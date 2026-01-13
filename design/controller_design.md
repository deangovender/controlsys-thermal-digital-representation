# Controller Design — Discrete PI

Error:
\[
e[k]=r[k]-y_{meas}[k]
\]

Integrator:
\[
I[k]=I[k-1]+K_i T_s e[k]
\]

Command:
\[
u_{raw}[k]=K_p e[k] + I[k]
\]
u = clip(u_raw, 0, 1), with conditional anti-windup.

Baseline gains: Kp=5.2, Ki=0.68, Ts=0.5 s.
