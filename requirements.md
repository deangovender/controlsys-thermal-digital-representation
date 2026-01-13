# Requirements — Thermal Plant Control (Digital Twin)

## Signals
- PV: temperature (°C)
- SP: setpoint (°C)
- MV: heater command `u` (0..1 → 0–100%)
- Model output: temperature rise above ambient, ΔT = T − Tamb

## Sampling
- `Ts = 0.5 s`

## Constraints
- Saturation: `0 ≤ u ≤ 1`

## Scope
- Operating range: 25–80 °C (cold-start below 25 °C is out of scope)
- Ambient reference: Tamb = 25 °C

## Performance targets
For setpoints within 25–80 °C:
- Settling ≈ 60 s into and staying within ±2 °C of the setpoint (absolute temperature)
- Overshoot < 2.0 °C
- SSE < 2.0 °C (mean abs error over last 10%)

For a disturbance step:
- Recovery < 30 s into ±2 °C
- No sustained oscillation

Verified by `scripts/run_all.m`.
