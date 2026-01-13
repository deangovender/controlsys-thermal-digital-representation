function write_metrics_csv(path,m)
  fid=fopen(path,"w");
  fprintf(fid,"overshoot_degC,settling_time_s,sse_degC,u_max,u_min,rise_time_s\n");
  fprintf(fid,"%.6f,%.6f,%.6f,%.6f,%.6f,%.6f\n", m.overshoot_degC, m.settling_time_s, m.sse_degC, m.u_max, m.u_min, m.rise_time_s);
  fclose(fid);
endfunction
