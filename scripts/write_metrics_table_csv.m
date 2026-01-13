function write_metrics_table_csv(path,M)
  fid=fopen(path,"w");
  fprintf(fid,"overshoot_degC,settling_time_s,sse_degC,u_max,K,tau,L\n");
  for i=1:rows(M)
    fprintf(fid,"%.6f,%.6f,%.6f,%.6f,%.6f,%.6f,%.6f\n", M(i,1),M(i,2),M(i,3),M(i,4),M(i,5),M(i,6),M(i,7));
  endfor
  fclose(fid);
endfunction
