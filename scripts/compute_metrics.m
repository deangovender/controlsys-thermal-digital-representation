function m=compute_metrics(t,r,y,u)
  n=length(t); r_final=r(end);
  m.overshoot_degC=max(0, max(y)-r_final);

  idx=floor(0.9*n):n;
  m.sse_degC=mean(abs(r(idx)-y(idx)));

  band=2.0; m.settling_time_s=NaN;
  for k=1:n
    if all(abs(y(k:end)-r_final)<=band), m.settling_time_s=t(k); break; endif
  endfor

  m.u_max=max(u); m.u_min=min(u);

  y10=0.1*r_final; y90=0.9*r_final;
  i10=find(y>=y10,1,"first"); i90=find(y>=y90,1,"first");
  if isempty(i10)||isempty(i90), m.rise_time_s=NaN; else m.rise_time_s=t(i90)-t(i10); endif
endfunction
