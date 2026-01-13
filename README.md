# Thermal PI Control — Digital Representation (FOPDT)

A **portfolio control-systems showcase**: requirements → modeling → PI design → discrete implementation → verification → robustness.

## Start here
- Specs: `requirements.md`
- Narrative: `docs/REPORT.md`
- Repro sims: `scripts/run_all.m`
- Checklist: `CHECKLIST.md`

## Run (Octave)
```octave
cd scripts
run_all
```

## Outputs
- Plots: `figures/*.png`
- Metrics: `data/metrics_*.csv`
- Identification: `data/fopdt_fit_results.json`

## Model assumptions
- Operating range: 25–80 °C (cold-start below 25 °C out of scope).
- Model output is temperature rise above ambient: ΔT = T − Tamb.
- Control input u is normalized heater power (0–1 = 0–100%).
- FOPDT gain K is the steady-state ΔT rise at u = 1 (K = 55 °C).

## CV line
Designed and verified a discrete-time PI temperature controller on an FOPDT thermal digital twin (saturation + anti-windup, disturbance tests, and Monte Carlo robustness).
