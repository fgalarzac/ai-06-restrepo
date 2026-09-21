# Checked reading notes: the published AER article

**Source and notation.** **PAPER.** I read the final 2018 *American Economic Review* article, 108(6), 1488–1542, and checked its published online Appendix B. Its sections are I–V (the June 2017 NBER draft uses 2–6). Unless marked otherwise, proposition and equation numbers below are those of the AER article. The NBER draft states the **opposite** $K$ inequality in Proposition 3; its surrounding economic logic and the final AER article support the high-$K$ wage increase. The AER article also corrects the draft's impossible $I^*=I>\widetilde I$ condition in Proposition 9 to $I^*=I<\widetilde I$.

The labels **PAPER**, **DERIVATION**, **INTERPRETATION**, and **OPEN QUESTION** identify the status of each claim. These notes analyze the source and do not claim to re-prove its dynamic theorems.

## 1. The aggregate task economy (Section I.A–B)

**PAPER.** Output is a CES aggregate of tasks:

$$Y=\widetilde B\left(\int_{N-1}^{N}y(i)^{(\sigma-1)/\sigma}\,di\right)^{\sigma/(\sigma-1)}.\tag{1}$$

The interval has measure **one** at every $N$. A new task at the high end replaces an old one at the low end. Thus $N$ upgrades task quality, rather than adding more tasks to the aggregator. The productivity schedule $\gamma(i)$ is strictly increasing (Assumption 1): labor has comparative advantage at high indices. For $i>I$, task production is the CES of a task-specific intermediate $q(i)$ and effective labor $\gamma(i)l(i)$ (eq. 2). For $i\le I$, the same CES contains $k(i)+\gamma(i)l(i)$, so capital can substitute for labor (eq. 3). Both require the intermediate. $I$ is technological feasibility, not necessarily actual use.

**PAPER.** Competitive task firms choose the cheaper effective input: capital costs $R$ per task unit, labor costs $W/\gamma(i)$. The equal-cost index solves $W/R=\gamma(\widetilde I)$; monotonic $\gamma$ implies capital performs tasks below $I^*=\min\{I,\widetilde I\}$ and labor above. In Figure 3A, $I^*=I<\widetilde I$ and firms would use capital in more tasks if feasible. In Figure 3B, $I^*=\widetilde I<I$ and the cost-minimizing allocation is already feasible: raising $I$ alone changes nothing. At equality the derivative can be one-sided (Proposition 2, footnote 16).

**PAPER.** Proposition 1 establishes existence and uniqueness under Assumptions 1–3. Assumption 2 is $\eta\to0$ or $\zeta=1$, yielding homothetic factor demand; Assumption 3 bounds the static capital stock so new tasks are adopted. In the equilibrium, let $a=I^*-N+1$, $J=\int_{I^*}^{N}\gamma(i)^{\widehat\sigma-1}di$, and $\widehat\sigma=\sigma(1-\eta)+\zeta\eta$. Equation (12) is

$$Y=\frac{B}{1-\eta}\left[a^{1/\widehat\sigma}K^{(\widehat\sigma-1)/\widehat\sigma}+J^{1/\widehat\sigma}L^{(\widehat\sigma-1)/\widehat\sigma}\right]^{\widehat\sigma/(\widehat\sigma-1)}.\tag{12}$$

The factor weights $a,J$ are endogenous to task allocation. The Cobb–Douglas limit in Corollary 1 has $\sigma=\zeta=1$ and $\gamma(i)=1$, giving $Y=[B/(1-\eta)]K^{1-N+I^*}L^{N-I^*}$. The corollary's constant $\gamma$ is a special limiting case, not the strict comparative-advantage schedule in Assumption 1.

## 2. What moves at fixed capital (Propositions 2–3)

**PAPER.** Let $\omega=W/(RK)$, $\varepsilon_L>0$ be labor-supply elasticity with respect to $\omega$, $\varepsilon_\gamma=d\ln\gamma(I)/dI>0$, and

$$\Lambda_I=\frac{\gamma(I^*)^{\widehat\sigma-1}}{J}+\frac1a,\qquad \Lambda_N=\frac{\gamma(N)^{\widehat\sigma-1}}{J}+\frac1a.$$

With $I^*=I<\widetilde I$, Proposition 2 gives $d\ln(W/R)/dI=-\Lambda_I/(\widehat\sigma+\varepsilon_L)<0$, $d\ln(W/R)/dN=\Lambda_N/(\widehat\sigma+\varepsilon_L)>0$, and $d\ln(W/R)/d\ln K=(1+\varepsilon_L)/(\widehat\sigma+\varepsilon_L)>0$. With $I^*=\widetilde I<I$, the $I$ derivative is **zero**; the $N$ derivative is $\Lambda_N/(\sigma_{free}+\varepsilon_L)>0$ and the $K$ derivative is $(1+\varepsilon_L)/(\sigma_{free}+\varepsilon_L)>0$, where $\sigma_{free}=\widehat\sigma+\Lambda_I/\varepsilon_\gamma>\widehat\sigma$. Reassigning tasks when prices change makes the free elasticity larger. In both regimes, the labor share and employment move with $\omega$: new tasks raise both; effective automation lowers both.

**PAPER.** Proposition 3 separates the productivity gain $P_I=d\ln Y\vert_{K,L}/dI$ from displacement when automation actually changes tasks:

$$P_I=\frac{B^{\widehat\sigma-1}}{1-\widehat\sigma}\left[(W/\gamma(I))^{1-\widehat\sigma}-R^{1-\widehat\sigma}\right]>0,$$
$$\frac{d\ln W}{dI}=P_I-(1-s_L)\frac{\Lambda_I}{\widehat\sigma+\varepsilon_L},\qquad
\frac{d\ln R}{dI}=P_I+s_L\frac{\Lambda_I}{\widehat\sigma+\varepsilon_L}.$$

At $\widehat\sigma=1$, take the continuous logarithmic limit. The first term comes from replacing expensive labor with cheaper capital and raising demand for labor in the remaining tasks. The second comes from bunching labor into fewer tasks under diminishing returns. The published Proposition 3 says there is $\widetilde K$ such that, in the technology-constrained regime, the wage **rises when $K>\widetilde K$** and falls when $K<\widetilde K$. Near the lower cost-equality boundary, $W/\gamma(I)\approx R$, so productivity gains are too small to offset displacement. Higher $K$ cheapens capital relative to labor and makes the saving larger. New tasks raise productivity and wages, although their effect on $R$ can be negative. When $I^*=\widetilde I<I$, more available automation has no productivity or factor-price effect.

**INTERPRETATION.** The threshold result requires $K$ to stay within the paper's admissible static range. A particular calibration need not display both wage signs inside that range. The second figure deliberately shows one calibration that does and one that does not.

## 3. Capital adjustment and four possible BGPs (Section II)

**PAPER.** Assumption 1′ strengthens comparative advantage to $\gamma(i)=e^{Ai}$, $A>0$. Let $n=N-I$ and $n^*=N-I^*\ge n$. With a constant task frontier gap and $\dot N=\dot I=\Delta$, net technology is labor augmenting at rate $g=A\Delta$ (eq. 16). The household Euler equation fixes the BGP rental rate at $R=\rho+\delta+\theta g$. Set $\bar\rho=B-\delta-\theta g$. Lemma A2 defines $\rho_{min}<\bar\rho<\rho_{max}$, a low-discount boundary $\widetilde n(\rho)$ at which the newest labor task just becomes worthwhile, and a high-discount boundary $\underline n(\rho)$ at which the marginal automated task just becomes worth producing with capital.

**PAPER.** Proposition 4 (Assumptions 1′ and 2, positive growth) lists:

1. **Full automation:** $\rho<\bar\rho$, $N=I$, and $B>\delta+\rho>(1-\theta)(B-\delta-\rho)/\theta+\delta$ for positive growth/transversality. Then $n^*=0$ and the labor share is zero.
2. **Immediate automation, interior:** $\rho\in(\rho_{min},\rho_{max})$, $\dot N=\dot I=\Delta$, $n>\max\{\underline n(\rho),\widetilde n(\rho)\}$, and $\rho+(\theta-1)A\Delta>0$. Then $n^*=n$ and $I^*=I$.
3. **Eventual automation, interior:** $\rho>\bar\rho$, $\dot N=\Delta$, $\dot I\ge\Delta$, $n<\underline n(\rho)$, and the same transversality inequality. Available automation runs ahead of profitable use; $n^*=\underline n(\rho)>n$.
4. **No automation:** $\rho>\rho_{max}$, $\dot N=\Delta$, and the same transversality inequality. Then $n^*=1$ and the capital share is zero.

The paper states a unique globally stable BGP in each listed case. The published statement adds the explicit $\rho$ ranges to the interior and no-automation cases that are less clear in the older draft.

**PAPER.** Proposition 5 compares **permanent** changes in $n$ at an interior BGP under Assumptions 1′ and 2, constant $g$, and $n>\widetilde n(\rho)$. For $n<\underline n(\rho)$, a small change in available automation leaves $n^*$, effective wage paths, employment, and labor share unchanged. For $n>\underline n(\rho)$, $w_I(n)=W/\gamma(I^*)$ rises with $n$, $w_N(n)=W/\gamma(N)$ falls with $n$, and employment and labor share rise with $n$. Therefore a permanent **increase in $I$**, lowering $n$ while keeping the BGP growth rate fixed, raises long-run $W$ as capital accumulates, while employment and labor share fall. $R$ returns to $\rho+\delta+\theta g$. For $\widehat\sigma<1$, the accumulation partly offsets the initial labor-share fall; for $\widehat\sigma>1$, it deepens it. A change in $N$ is a different experiment: a slower rate of new-task creation can also lower wage growth.

**INTERPRETATION.** Proposition 3 is the fixed-$K$ impact, not a forecast of the terminal wage. Proposition 5 allows $K$ to adjust and holds the long-run rental rate fixed. Figure 6's low-productivity case can have an immediate wage loss followed by an approximately flat higher or near-initial long-run level. Wages, labor share, and employment therefore need separate time labels.

## 4. Why the two frontiers can keep pace (Section III)

**PAPER.** Scientists split between automation and new tasks: $S_I+S_N\le S$, $\dot I=\kappa_I S_I$, $\dot N=\kappa_N S_N$ (eq. 22). Patented intermediates earn profits; innovators compensate displaced patent holders, so $V_I$ and $V_N$ (eqs. 25–26) measure **incremental** cost savings. Assumption 4, $\widehat\sigma>\zeta$, makes cheaper-factor technologies profitable. Competition pays scientist wages $\kappa_I V_I$ and $\kappa_N V_N$; their normalized values determine $\dot n$ (eq. 28). An interior BGP requires $\kappa_Iv_I(n)=\kappa_Nv_N(n)$ (eq. 29).

**PAPER.** At an immediate-adoption interior BGP, $w_I(n)$ rises with $n$: when $n$ falls after automation, labor becomes cheaper at the **next** task to automate, reducing the incremental automation prize. Hence $v_I(n)$ rises with $n$. Also $w_N(n)$ falls with $n$, making labor cheap relative to capital at the frontier of **new** tasks; hence $v_N(n)$ also rises with $n$. This latter slope opposes uniqueness. Proposition 6 requires Assumptions 1′, 2, 4 and sufficiently small $S$. If $\rho<\bar\rho$ full automation is a BGP (subject to the growth/transversality bounds). If $\rho>\bar\rho$, there are $0<\underline\kappa\le\bar\kappa$: above $\bar\kappa$ there is a unique interior BGP; strictly between them there are multiple BGPs; below $\underline\kappa$ there is a unique no-automation BGP (always so when $\rho>\rho_{max}$). At the unique interior crossing, $\kappa_Iv_I$ is steeper than $\kappa_Nv_N$: extra automation lowers the incentive to automate further and restores $n$. Stability is global saddle-path for $\theta=0$ and local/asymptotic saddle-path for $\theta>0$.

**PAPER.** Corollary 2 distinguishes shocks. A temporary automation lead reduces $n$ and then self-corrects toward the **same** BGP, restoring employment and labor share. A permanent increase in $\kappa_I/\kappa_N$, under $\rho>\bar\rho$ and the unique-interior regime, shifts the value crossing to a **different** BGP with lower $n$, employment, and labor share. The transitional diversion of scientists may slow productivity growth if the forgone new-task gain exceeds the automation gain (footnote 32).

## 5. Extensions and welfare in the paper (Section IV)

**PAPER.** Proposition 7 introduces high- and low-skill workers. High-skill labor specializes in newer tasks; low-skill productivity rises as a task standardizes. Under its balanced-technology path and transversality condition, if $\xi<1$ standardization is incomplete, the high/low wage ratio diverges and low-skill workers' task measure vanishes. If $\xi=1$, old tasks become fully accessible, both wages grow together and the long-run wage gap is constant and **decreases** with $n$. New tasks can widen the gap immediately yet narrow it in the long run; automation widens it in both comparisons.

**PAPER.** Proposition 8 changes the patent regime to creative destruction. Automation profits now depend on the revenue stream until replacement, and $v_I^{CD}(n)$ **decreases** with $n$: more automation lengthens the life of another automated task and encourages yet more automation. With constant $\iota(n)$, no interior BGP is stable. A sufficiently increasing $\iota(n)$, satisfying the proposition's endpoint bounds $\iota(0)<\underline\iota$ and $\iota(1)>\bar\iota$, gives at least one locally stable interior BGP. Thus Section III's automatic self-correction depends on its patent compensation structure.

**PAPER.** Proposition 9 examines a static technology-constrained economy under Assumptions 1–3. With optimal labor supply, $W/C=\nu'(L)$, the fall in employment has no first-order welfare cost; productivity gains make automation welfare-improving. If a binding upward-sloping quasi-labor-supply constraint creates a wedge $W/C>\nu'(L)$, then, up to a positive marginal-utility factor,

$$\frac{d\mathcal W}{dI}\ \propto\ P_I-L\left(\frac WC-\nu'(L)\right)\frac{\widetilde\varepsilon_L}{\widehat\sigma+\widetilde\varepsilon_L}\Lambda_I.$$

Welfare falls exactly when the second, employment-loss term exceeds productivity. New tasks raise welfare with or without this wedge. The online appendix develops the planner comparison and shows why the wedge creates a bias toward excessive automation. It also already analyzes a general nonhomothetic case, capital used alongside labor in new tasks ($\nu\in(0,1)$), and microfoundations of quasi-labor supply. These are not new extension proposals here.

## 6. The oral-exam trap and the hand check

| Question | Condition that reverses a pessimistic answer |
|---|---|
| **PAPER · Immediate wage at fixed $K$** | With $I^*=I<\widetilde I$, enough capital, $K>\widetilde K$, makes productivity savings dominate displacement. If $I^*=\widetilde I<I$, additional available automation has no effect. |
| **PAPER · Long-run wage after capital adjusts** | In the active interior BGP, a permanent $I$ lead raises it; for $n<\underline n(\rho)$ a small increase in available automation has no effect. |
| **PAPER · Employment and labor share** | They fall with effective automation at fixed technology mix, even when wages rise. They can **recover** after a temporary lead at the stable unique interior BGP; permanent $\kappa_I/\kappa_N$ change moves them to lower BGP values. New tasks raise them. |
| **PAPER · Welfare** | Without frictions it rises; with a binding labor wedge it falls only when lost employment value exceeds productivity. |

**INTERPRETATION.** The cleanest evening hand check is a tiny continuum-to-two-block exercise at a threshold $I$: mark the automated and labor blocks, write the unit cost comparison at $I$, and differentiate the wage response to a small rightward move of that boundary at fixed $K$. The check should exhibit the productivity and displacement terms separately and state which capital range makes the first dominate. Avoid attempting the whole dynamic model by hand. The numerical code uses the homothetic CES case with $\sigma=1.2$ as a separate illustration, not as a substitute for the student's derivation.
