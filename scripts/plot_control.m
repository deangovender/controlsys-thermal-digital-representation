function plot_control(t,u,out_png)
  if nargin < 3, out_png = ""; end

  figure(3); clf;
  plot(t,u,"linewidth",1.5);
  grid on; xlabel("Time (s)"); ylabel("u (0..1)");
  title("Control Effort");

  drawnow();

  if ~isempty(out_png)
    print(out_png,"-dpng");
  endif
endfunction
