function M=monte_carlo(plant0,ctrl,sim,mc,out_png)
  if nargin < 5, out_png = ""; end

  N=mc.N; var=mc.var; M=zeros(N,7);

  figure(5); clf; hold on;
  for i=1:N
    plant=plant0;
    plant.K=plant0.K*(1+(2*rand()-1)*var);
    plant.tau=plant0.tau*(1+(2*rand()-1)*var);
    plant.L=max(0, plant0.L*(1+(2*rand()-1)*var));

    sim_i=sim; sim_i.dist=struct("enable",false);
    [t,r,y,u,e,m]=pi_sim(plant,ctrl,sim_i);

    M(i,:)=[m.overshoot_degC, m.settling_time_s, m.sse_degC, m.u_max, plant.K, plant.tau, plant.L];
    plot(t, plant0.Tamb+y, "linewidth",0.5);
  endfor

  grid on; xlabel("Time (s)"); ylabel("Temp (degC)");
  title(sprintf("Monte Carlo Overlay (N=%d, ±%.0f%%)", N, 100*var));

  drawnow();

  if ~isempty(out_png)
    print(out_png,"-dpng");
  endif
endfunction
