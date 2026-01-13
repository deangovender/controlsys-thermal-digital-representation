function plot_fopdt_fit_overlay(csv_path, fit, Ts, out_png)
  data=csvread(csv_path,1,0); t=data(:,1); u=data(:,2); y=data(:,3);
  a=exp(-Ts/fit.tau); b=fit.K*(1-a); Nd=max(0,round(fit.L/Ts));
  yhat=zeros(size(t)); u_hist=zeros(Nd+1,1);
  for k=2:length(t)
    u_hist=[u(k); u_hist(1:end-1)];
    yhat(k)=a*yhat(k-1)+b*u_hist(end);
  endfor
  figure(1); clf; plot(t,y,"linewidth",1.5); hold on; plot(t,yhat,"linewidth",1.5);
  grid on; xlabel("Time (s)"); ylabel("y (degC)");
  legend("Data","Fitted"); title("FOPDT Fit Overlay"); print(out_png,"-dpng");
endfunction
