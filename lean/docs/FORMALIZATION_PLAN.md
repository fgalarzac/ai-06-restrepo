# Formalization Plan: AR18RaceManMachine

## Source authority

- Paper: Daron Acemoglu and Pascual Restrepo, *The Race Between Machine and Man: Implications of Technology for Growth, Factor Shares and Employment*.
- Authority: NBER Working Paper 22252, revised June 2017.
- URL: <https://www.nber.org/papers/w22252>
- Pinned PDF: `source/w22252.pdf` (SHA256 `441d01202afd56ef8002fc24ffc2beb51191741c0b5accb11d2534620dd616b7`).
- Deterministic extraction: `source/w22252.txt` (SHA256 `f2a917676a69d14e6fb96ada88f37db82d87bcb92e464f023691ceed9a532083`).
- The AER text is useful only for comparison. It is not Lean source authority.

## Source-first named inventory

The extraction was mechanically checked for every named assumption, proposition,
corollary, and appendix lemma. The complete labelled surface is:

- Main static theory: Assumptions 1-3; Propositions 1-3; Corollary 1.
- Dynamic and endogenous-technology theory: Assumption 1 prime; Propositions 4-6;
  Assumption 4; Corollary 2.
- Extensions: Assumption 1 double-prime; Propositions 7-9.
- Appendices: Assumption 2 prime; Lemmas A1-A3; Proposition B1; Lemma B1;
  Proposition B2; Assumption 2 double-prime; Propositions B3-B4.

Exact heading lines are recorded in `audit/paper_statement_map.json`. All items
outside the two selected static targets remain explicit proof debt. Figures,
empirical regressions, standalone displays, simulations, and proof prose remain
deep-audit material unless they support a selected result.

## Selected targets and dependency order

| Order | Source item | Lean Spec | Proof endpoint | Status |
|---:|---|---|---|---|
| 1 | Static task threshold after equation (6) | `staticTaskThresholdSpec` | `staticTaskThreshold` | proved; Linux Lean validation passed |
| 2 | Proposition 3 static algebraic core | `proposition3StaticCoreSpec` | `proposition3StaticCore` | proved conditionally on (B9), (B10), and positive coefficients; full proposition partial |

The task-threshold proof uses Assumption 1, positivity of productivity and the
rental rate, equation (6), and the technological frontier. It establishes direct
unit-cost comparisons on either side of `min I I-tilde`.

The Proposition 3 proof follows the source's Appendix B route: solve the two
equations

1. `sL * dlnW + (1-sL) * dlnR = dlnY|K,L` (B9), and
2. `dlnW - dlnR = q` (B10).

For automation alone, `q` is the negative displacement magnitude. Lean then
proves that the wage change equals productivity minus displacement, that the
rental change equals productivity plus the labor-share-weighted displacement,
and that the wage sign flips according to which effect is larger.

## Honest boundary

This checkpoint does not derive (B9), (B10), or the positivity of Proposition
3's exact CES coefficients from the continuum production model. It does not
formalize the new-task case, the unconstrained-allocation case, or the dynamic
results. Therefore the paper remains **partially formalized**.

The NBER PDF also states on page 13 that there exists
`K-bar > K-underbar`, while Assumption 3 imposes `K < K-underbar` and the same
sentence claims a negative wage effect for `K > K-bar`. The pinned source was
visually checked. No AER correction has been substituted and no corrected Lean
target has been approved. This clause is recorded as open defect
`AR18-P3-CAPITAL-THRESHOLD-01`.

## Next proof seams

1. Formalize equation (12) and derive the exact `d ln Y|K,L` coefficients.
2. Prove coefficient positivity from the cost ordering in both constrained and
   unconstrained task-allocation cases.
3. Derive (B9) from factor-income accounting and (B10) from Proposition 2 rather
   than accepting them as proof-level premises.
4. Resolve the literal NBER capital-threshold clause or obtain an explicit
   approved corrected target.
5. Continue through Propositions 1-2 before extending to the dynamic section.

## Validation commands

GitHub Actions [run 35850485751](https://github.com/fgalarzac/ai-06-restrepo/actions/runs/35850485751)
passed both `lake build +AR18RaceManMachine` and
`python3 scripts/paper_contribution.py check AR18RaceManMachine --fast` on
2026-09-23 against AppliedModelingLib commit
`e952266be81e96bbeecea6af83d639af324a4438` and the pinned NBER PDF hash.

On a Linux checkout with the pinned Lean toolchain:

```text
LEAN_NUM_THREADS=1 lake build +AR18RaceManMachine.Assumptions
LEAN_NUM_THREADS=1 lake build +AR18RaceManMachine.MainTheorems
LEAN_NUM_THREADS=1 lake build +AR18RaceManMachine.PaperInterface
LEAN_NUM_THREADS=1 lake build +AR18RaceManMachine.ProofInterface
LEAN_NUM_THREADS=1 lake build +AR18RaceManMachine
```

For a later closeout, run the repository planner first. No closeout, semantic
judgment, or accepted receipt is claimed by this checkpoint.

