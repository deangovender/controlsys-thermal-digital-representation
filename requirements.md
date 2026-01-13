# Requirements — Thermal Plant Control (Digital Twin)

## Signals
- PV: temperature (°C)
- SP: setpoint (°C)
- MV: heater command `u` (0..1 → 0–100%)

## Sampling
- `Ts = 0.5 s`

## Constraints
- Saturation: `0 ≤ u ≤ 1`

## Performance targets
For a +10 °C step:
- Overshoot < 1.0 °C
- Settling < 30 s into ±0.2 °C
- SSE < 0.2 °C (mean abs error over last 10%)

For a disturbance step:
- Recovery < 20 s into ±0.2 °C
- No sustained oscillation

Verified by `scripts/run_all.m`.
