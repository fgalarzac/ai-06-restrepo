# Formalization Working Memo: AR18RaceManMachine

This memo records proof leads and unresolved source questions. It is not audit
evidence.

## Source authority

- NBER Working Paper 22252, revised June 2017, is authoritative.
- PDF SHA256: `441d01202afd56ef8002fc24ffc2beb51191741c0b5accb11d2534620dd616b7`.
- Text SHA256: `f2a917676a69d14e6fb96ada88f37db82d87bcb92e464f023691ceed9a532083`.

## Model convention

- `AR18-POSITIVE-TASK-PRICES-01`: the cutoff proof makes task productivity and
  the rental rate positive. The source calls `gamma(i)` productivity, divides by
  it in effective labor cost, and writes `W/R` in equation (6), but Assumption 1
  itself states only strict monotonicity. The positivity premises are visible in
  the Spec.

## Printed-source issue

- `AR18-P3-CAPITAL-THRESHOLD-01`: visual inspection of NBER PDF page 13
  confirms `K-bar > K-underbar`. Assumption 3 imposes `K < K-underbar`, while
  Proposition 3 also claims a wage decrease for `K > K-bar`. This ordering
  differs from the later AER version. Current treatment: keep the NBER clause
  unproved and the paper status partial. Do not reverse the inequality without
  explicit approval of a corrected target.

## Proof deviation and boundary

- The source obtains the Proposition 3 factor-price formulas by solving (B9)
  and (B10). Lean checks this algebra and the automation-only sign split.
- Lean currently takes (B9), (B10), positivity of the productivity effect, and
  positivity of the displacement magnitude as proof-level premises. Their
  derivation from the full CES task model remains open.

## Deferred work

- Full semantics and proofs for Propositions 1-2 and the remaining clauses of
  Proposition 3.
- All dynamic, endogenous-technology, inequality, welfare, and appendix results
  listed in `audit/paper_statement_map.json`.
- Current-protocol independent semantic review and closeout artifacts after the
  proof surface is complete.
