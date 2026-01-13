function fit = fit_fopdt_from_csv(csv_path, Ts)
  data=csvread(csv_path,1,0); t=data(:,1); u=data(:,2); y=data(:,3);
  du=[0; diff(u)]; [~,idx_step]=max(abs(du)); t_step=t(idx_step);

  idx_pre=find(t < t_step-2*Ts);
  idx_post=find(t > (t(end)-10));

  y0=mean(y(idx_pre)); yss=mean(y(idx_post));
  u0=mean(u(idx_pre)); uss=mean(u(idx_post));
  dy=yss-y0; du_mag=uss-u0;

  fit.K=dy/du_mag;

  thr=y0+0.02*dy; idx_after=find(t>=t_step); idxL=idx_after(1);
  for k=idx_after(1):length(t)
    if ((dy>=0 && y(k)>=thr) || (dy<0 && y(k)<=thr)), idxL=k; break; endif
  endfor
  fit.L=max(0, t(idxL)-t_step);

  thr63=y0+0.632*dy; t_start=t_step+fit.L; idx0=find(t>=t_start,1,"first"); idxT=idx0;
  for k=idx0:length(t)
    if ((dy>=0 && y(k)>=thr63) || (dy<0 && y(k)<=thr63)), idxT=k; break; endif
  endfor
  fit.tau=max(Ts, t(idxT)-(t_step+fit.L));
endfunction
