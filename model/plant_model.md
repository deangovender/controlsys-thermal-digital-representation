# Plant Model — FOPDT Thermal Process (Digital Twin)

\[
G(s)=\frac{K e^{-Ls}}{\tau s + 1}
\]

Baseline parameters:
- K = 55 °C per unit u (steady-state ΔT rise at u = 1)
- τ = 8 s
- L = 1.2 s

Assumptions:
- Output is temperature rise above ambient: ΔT = T − Tamb
- u is normalized heater power (0–1 = 0–100%)
- Operating range: 25–80 °C (Tamb = 25 °C, cold-start below 25 °C out of scope)

Discrete simulation:
\[
y[k]=a y[k-1] + b u[k-N_d] + d[k]
\]
a=exp(-Ts/τ), b=K(1-a), N_d=round(L/Ts).
