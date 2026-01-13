# Plant Model — FOPDT Thermal Process (Digital Twin)

\[
G(s)=\frac{K e^{-Ls}}{\tau s + 1}
\]

Baseline parameters:
- K = 0.30
- τ = 8 s
- L = 1.2 s

Discrete simulation:
\[
y[k]=a y[k-1] + b u[k-N_d] + d[k]
\]
a=exp(-Ts/τ), b=K(1-a), N_d=round(L/Ts).
