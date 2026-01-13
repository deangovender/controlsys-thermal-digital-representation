function plot_control(t,u,out_png)
  figure(3); clf; plot(t,u,"linewidth",1.5);
  grid on; xlabel("Time (s)"); ylabel("u (0..1)"); title("Control Effort"); print(out_png,"-dpng");
endfunction
