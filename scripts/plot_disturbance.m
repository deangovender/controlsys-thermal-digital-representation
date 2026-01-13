function plot_disturbance(t,r,y,u,plant,dist,out_png)
  figure(4); clf;
  subplot(2,1,1);
  plot(t, plant.Tamb+r, "linewidth",1.5); hold on;
  plot(t, plant.Tamb+y, "linewidth",1.5);
  grid on; ylabel("Temp (degC)"); legend("Setpoint","PV"); title("Disturbance Rejection");

  subplot(2,1,2);
  plot(t,u,"linewidth",1.5); hold on; yl=ylim(); plot([dist.t_dist dist.t_dist], yl, "--");
  grid on; xlabel("Time (s)"); ylabel("u (0..1)"); print(out_png,"-dpng");
endfunction
