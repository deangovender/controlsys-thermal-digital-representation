# Identification — Estimating FOPDT Parameters from Step Response

Dataset: `data/synthetic_step.csv` (t_s, u, y).

Method:
1) K ≈ Δy_ss/Δu
2) L: first time y crosses baseline + 2% of final change after the step
3) τ: time from (t_step+L) to the 63.2% point

Outputs:
- `data/fopdt_fit_results.json`
- `figures/fopdt_fit_overlay.png`
