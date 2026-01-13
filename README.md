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

## CV line
Designed and verified a discrete-time PI temperature controller on an FOPDT thermal digital twin (saturation + anti-windup, disturbance tests, and Monte Carlo robustness).
