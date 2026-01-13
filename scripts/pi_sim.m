function [t,r,y,u,e,m]=pi_sim(plant,ctrl,sim)
  Ts=ctrl.Ts; t=(0:Ts:sim.t_end)'; n=length(t);
  r=sim.r0*ones(n,1); r(t>=sim.t_step)=sim.r_step;

  a=exp(-Ts/plant.tau); b=plant.K*(1-a); Nd=max(0,round(plant.L/Ts));
  y=zeros(n,1); u=zeros(n,1); e=zeros(n,1);
  I=0; u_hist=zeros(Nd+1,1);

  for k=2:n
    y_meas=y(k-1)+sim.meas_sigma*randn();
    e(k)=r(k)-y_meas;

    u_ff=0;
    if isfield(ctrl,"use_ff") && ctrl.use_ff, u_ff=r(k)/plant.K; endif

    I_cand=I+ctrl.Ki*Ts*e(k);
    u_raw=ctrl.Kp*e(k)+I_cand+u_ff;
    u_sat=min(ctrl.umax, max(ctrl.umin, u_raw));

    if ctrl.use_aw
      if ((u_raw>ctrl.umax && e(k)>0) || (u_raw<ctrl.umin && e(k)<0))
        u_raw=ctrl.Kp*e(k)+I+u_ff;
        u_sat=min(ctrl.umax, max(ctrl.umin, u_raw));
      else
        I=I_cand;
      endif
    else
      I=I_cand;
    endif

    u(k)=u_sat;
    u_hist=[u(k); u_hist(1:end-1)];

    d=0;
    if isfield(sim,"dist") && isfield(sim.dist,"enable") && sim.dist.enable
      if t(k)>=sim.dist.t_dist, d=sim.dist.mag; endif
    endif

    y(k)=a*y(k-1)+b*u_hist(end)+d+sim.proc_sigma*randn();
  endfor

  m=compute_metrics(t,r,y,u);
endfunction
