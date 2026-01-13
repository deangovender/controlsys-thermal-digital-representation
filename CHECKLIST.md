# Control Systems Project — Checklist + Progress

This is the working checklist for the repo.

Legend:
- [x] done (present in this pack)
- [~] drafted / partial (present, but improve after running sims once)
- [ ] not started

---

# Control Systems Project — Portfolio Checklist (Compressed)

Use this as your `CHECKLIST.md` for a control systems repo.

---

## README Top (skim-friendly)
- [ ] Title + 1-line problem statement
- [ ] 1 hero graphic (block diagram or key plot)
- [ ] **Key results (numbers)**: settling time, overshoot, SSE, etc.
- [ ] Links: `/docs`, sim script, results folder, release tag

---

## Requirements
- [ ] Controlled variable(s) + manipulated variable(s)
- [ ] Disturbances + noise sources
- [ ] Performance targets (numeric): rise/settle, overshoot, SSE, bandwidth, etc.
- [ ] Constraints (sampling, actuator limits, sensor limits, cost/complexity)

---

## Plant Model
- [ ] Model source: physics / identification / datasheet
- [ ] Model form: TF / FOPDT / state-space
- [ ] Parameters listed + assumptions
- [ ] Model validation plot (fit vs data) **or** rationale if theoretical

---

## Controller Design
- [ ] Controller choice + why (PI/PID/lead-lag/state feedback/observer)
- [ ] Tuning method documented (root locus, IMC, pole placement, etc.)
- [ ] Stability evidence (Bode margins / poles / root locus)
- [ ] Practicalities: saturation, anti-windup, sensor filtering, derivative handling (if used)
- [ ] Sampling time chosen + discretization method (ZOH/Tustin/etc.)
- [ ] Final discrete form shown (difference equation or implementation notes)

---

## Verification (evidence)
- [ ] Test plan: what scenarios + acceptance criteria
- [ ] Plots:
  - [ ] Step response (reference tracking)
  - [ ] Disturbance rejection
  - [ ] Noise sensitivity (optional but strong)
  - [ ] Saturation/recovery (if relevant)
- [ ] Robustness check (param variation, delay change, noise increase)

---

## Results Summary
- [ ] Table: **Target vs Achieved**
- [ ] 3 bullet conclusions: what meets spec, what doesn’t, why

---

## Repro + Release
- [ ] How to run simulations (commands + tool versions)
- [ ] Exported plots in `/results`
- [ ] Tag: `v1.0-portfolio`

---

## CV Snippet (paste-ready)
- [ ] 1 line: “Designed X controller for Y plant achieving Z metrics.”
- [ ] 2 bullets: metrics + tools (Octave/Python/Matlab, etc.)
