# Portfolio Report — Thermal PI Control (Digital Twin)

## What this is
A complete, reproducible control workflow without hardware: model → tune → implement → verify → stress-test.

## Plant
FOPDT model with baseline K=55 °C per unit u, τ=8 s, L=1.2 s.

Assumptions:
- Operating range 25–80 °C (Tamb = 25 °C, cold-start below 25 °C out of scope).
- Output is temperature rise above ambient (ΔT = T − Tamb).
- u is normalized heater power (0–1 = 0–100%).

## Controller
Discrete PI (Ts=0.5 s) with saturation + anti-windup.

## Verification
- reference tracking
- disturbance rejection
- Monte Carlo robustness (±25% on K, τ, L)

Settling time is defined as the time to enter and remain within ±2 °C of the setpoint (absolute temperature).

Run `scripts/run_all.m` to regenerate outputs.
