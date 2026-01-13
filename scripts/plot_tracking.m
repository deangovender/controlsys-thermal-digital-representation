function plot_tracking(t,r,y,plant,out_png)
  if nargin < 5, out_png = ""; end

  figure(2); clf;
  plot(t, plant.Tamb+r, "linewidth",1.5); hold on;
  plot(t, plant.Tamb+y, "linewidth",1.5);
  grid on; xlabel("Time (s)"); ylabel("Temp (degC)");
  legend("Setpoint","PV"); title("Baseline Tracking");

  drawnow();

  if ~isempty(out_png)
    print(out_png,"-dpng");
  endif
endfunction
