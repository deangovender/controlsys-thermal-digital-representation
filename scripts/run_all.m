function run_all()
  rand("seed", 7); randn("seed", 7);

  out_fig  = "../figures";
  out_data = "../data";
  mkdir(out_fig); mkdir(out_data);

  % (GUI Octave works fine for interactive figures + saving)
  graphics_toolkit("gnuplot");
  setenv("GNUTERM","wxt");   % interactive terminal for gnuplot on Windows

  plant.K=55; plant.tau=8.0; plant.L=1.2; plant.Tamb=25;

  ctrl.Ts=0.5; ctrl.Kp=5.2; ctrl.Ki=0.68;
  ctrl.umin=0.0; ctrl.umax=1.0; ctrl.use_aw=true; ctrl.use_ff=false;

  sim.t_end=120; sim.r0=0; sim.r_step=35; sim.t_step=5;
  sim.meas_sigma=0.05; sim.proc_sigma=0.00;

  dist.enable=true; dist.t_dist=55; dist.mag=-3.0;

  % --- Data generation / identification ---
  csv_path = fullfile(out_data, "synthetic_step.csv");
  gen_synthetic_step_data(plant, ctrl.Ts, csv_path);

  fit = fit_fopdt_from_csv(csv_path, ctrl.Ts);
  savejson(fullfile(out_data,"fopdt_fit_results.json"), plant, fit);

  % --- Plot 1: FOPDT fit overlay ---
  plot_fopdt_fit_overlay(csv_path, fit, ctrl.Ts, "");
  save_current_fig(fullfile(out_fig,"fopdt_fit_overlay.png"));

  % --- Baseline sim ---
  sim.dist=struct("enable",false);
  [t,r,y,u,e,m]=pi_sim(plant,ctrl,sim);
  write_metrics_csv(fullfile(out_data,"metrics_baseline.csv"), m);

  % --- Plot 2: baseline tracking ---
  plot_tracking(t,r,y,plant, "");
  save_current_fig(fullfile(out_fig,"baseline_tracking.png"));

  % --- Plot 3: baseline control effort ---
  plot_control(t,u, "");
  save_current_fig(fullfile(out_fig,"baseline_control.png"));

  % --- Disturbance sim ---
  sim2=sim; sim2.dist=dist;
  [t2,r2,y2,u2,e2,m2]=pi_sim(plant,ctrl,sim2);
  write_metrics_csv(fullfile(out_data,"metrics_disturbance.csv"), m2);

  % --- Plot 4: disturbance response ---
  plot_disturbance(t2,r2,y2,u2,plant,dist, "");
  save_current_fig(fullfile(out_fig,"disturbance_response.png"));

  % --- Monte Carlo ---
  mc.N=60; mc.var=0.25;
  M = monte_carlo(plant,ctrl,sim,mc, "");
  write_metrics_table_csv(fullfile(out_data,"metrics_monte_carlo.csv"), M);

  % Monte Carlo plot is figure(5) in monte_carlo()
  save_current_fig(fullfile(out_fig,"monte_carlo_overlay.png"));

  fprintf("Done. Saved PNGs to ../figures and data to ../data\n");
  pause();  % keep figures open until you press a key in the terminal
endfunction


function save_current_fig(out_png)
  drawnow();
  pause(0.2);              % give the renderer a moment
  print(out_png, "-dpng"); % autosave
endfunction
