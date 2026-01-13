function savejson(out_path, plant, fit)
  fid=fopen(out_path,"w");
  fprintf(fid,"{\n");
  fprintf(fid,'  "true": {"K": %.6f, "tau": %.6f, "L": %.6f},\n', plant.K, plant.tau, plant.L);
  fprintf(fid,'  "estimated": {"K": %.6f, "tau": %.6f, "L": %.6f},\n', fit.K, fit.tau, fit.L);
  fprintf(fid,'  "notes": "2%% threshold + 63.2%% method on synthetic_step.csv"\n');
  fprintf(fid,"}\n");
  fclose(fid);
endfunction
