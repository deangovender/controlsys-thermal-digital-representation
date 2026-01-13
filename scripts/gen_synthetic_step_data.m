function gen_synthetic_step_data(plant, Ts, out_csv)
  t_end=80; t=(0:Ts:t_end)'; u=zeros(size(t)); u(t>=5)=1.0;
  a=exp(-Ts/plant.tau); b=plant.K*(1-a); Nd=max(0,round(plant.L/Ts));
  y=zeros(size(t)); u_hist=zeros(Nd+1,1); noise_sigma=0.03;
  for k=2:length(t)
    u_hist=[u(k); u_hist(1:end-1)];
    y(k)=a*y(k-1)+b*u_hist(end)+noise_sigma*randn();
  endfor
  fid=fopen(out_csv,"w"); fprintf(fid,"t_s,u,y\n");
  for k=1:length(t), fprintf(fid,"%.6f,%.6f,%.6f\n", t(k), u(k), y(k)); endfor
  fclose(fid);
endfunction
