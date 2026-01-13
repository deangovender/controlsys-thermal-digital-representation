# Discrete PI + Anti-Windup (Embedded-Ready)

Per tick:
1) e = r - y_meas
2) I_candidate = I + Ki*Ts*e
3) u_raw = Kp*e + I_candidate
4) u = clip(u_raw, 0, 1)
5) if saturated and error pushes further into saturation → reject integrator update else accept it

Implemented in `scripts/pi_sim.m`.
