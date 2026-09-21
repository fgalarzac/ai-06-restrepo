# Candidate extensions, checked against the published article

**Source check.** **PAPER.** Section IV already covers heterogeneous skills and task standardization (Proposition 7), creative destruction of profits (Proposition 8), and welfare with labor-market frictions (Proposition 9). Online Appendix B already relaxes homotheticity, puts capital alongside labor in new tasks with $\nu\in(0,1)$ (Propositions B3–B4), derives planner distortions, and microfounds quasi-labor supply. Footnote 11 notes that task-specific capital productivity can be introduced in the *static* model but complicates balanced growth. None of these is claimed as a new extension below.

## 1. Delay between a usable invention and capital installation

**OPEN QUESTION.** An automation technology can be profitable and yet take time to deploy. Introduce an invented frontier $I_T$ and a deployed frontier $I_D$, with $\dot I_T=\kappa_I S_I$ as in equation (22), but $\dot I_D=(I_T-I_D)/\tau_D$ and $I^*=\min\{I_D,\widetilde I\}$. Study whether larger $\tau_D$ lengthens a wage slump after a burst of automation and changes the stability boundary for the race.

**INTERPRETATION.** Proposition 4's “eventual automation” already allows $I^*<I$ **because capital is too expensive**. This proposal adds a deployment delay even where capital is cheaper. Section IV's creative destruction changes patent payoffs, not installation time. The paper's standard capital accumulation adjusts the quantity of $K$; it does not distinguish an invention from its deployment. The natural starting point is to solve the exogenous-frontier transition numerically before redoing the value functions. A risk is that a finite lag merely delays, rather than changes, the BGP; that result would still clarify how Figure 6's transition depends on deployment.

## 2. Training capacity for the new frontier tasks

**OPEN QUESTION.** Let $N$ denote invented tasks and $N_U\le N$ tasks workers are trained to perform; for example $\dot N_U=(N-N_U)/\tau_H$ with training resources deducted from final output. Task availability and effective productivity would then depend on $N_U$, making a new task valuable to firms only after enough workers can use it. Does slower training lower the new-task value $V_N$ enough to move or destabilize the interior BGP?

**INTERPRETATION.** Proposition 7's $\Gamma(t-T(i))$ is **standardization of a task for low-skill workers**, with fixed skill supplies; it does not model a constrained training pipeline for the baseline labor force. The published conclusion explicitly identifies education and skill acquisition as a possible bottleneck, but does not solve it. This is therefore a proposed model of a gap the authors acknowledge, not a claim they overlooked training. Its cost is additional state variables and a possible break in the one-dimensional $n=N-I$ summary.

## What I chose to compute now

**DERIVATION / INTERPRETATION.** `sim.py` stays inside the published static model and maps the capital threshold in Proposition 3, alongside a reproduction of Figure 3's binding-versus-free task allocation. This is more checkable for this stage than coding the full forward-looking $V_I,V_N$ system: it directly tests the corrected AER wage inequality while keeping all assumptions and the admissible $K$ range visible. The two extensions above are candidates for later work, after the student's hand derivation and the separate Lean run.
