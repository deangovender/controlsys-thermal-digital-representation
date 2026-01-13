# Portfolio Report — Thermal PI Control (Digital Twin)

## What this is
A complete, reproducible control workflow without hardware: model → tune → implement → verify → stress-test.

## Plant
FOPDT model with baseline K=0.30, τ=8 s, L=1.2 s.

## Controller
Discrete PI (Ts=0.5 s) with saturation + anti-windup.

## Verification
- reference tracking
- disturbance rejection
- Monte Carlo robustness (±25% on K, τ, L)

Run `scripts/run_all.m` to regenerate outputs.
