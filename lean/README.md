# The Race Between Machine and Man

Lean formalization of selected results from Daron Acemoglu and Pascual
Restrepo, NBER Working Paper 22252, revised June 2017.

| Field | Value |
|---|---|
| Namespace | `AR18RaceManMachine` |
| Source authority | NBER Working Paper 22252, revised June 2017 |
| Status | Partially formalized |
| Selected results | Static task threshold; Proposition 3 factor-price and productivity/displacement algebra |
| Proof holes in tracked Lean files | 0 |
| Local Lean validation | Unavailable on this Windows host; Linux CI required |

## What is proved

- `staticTaskThresholdSpec` / `staticTaskThreshold`: strict comparative
  advantage and equation (6) give the cutoff `min I I-tilde`; below it capital
  is available and cheaper, while above it automation is unavailable or labor
  is cheaper.
- `proposition3StaticCoreSpec` / `proposition3StaticCore`: equations (B9) and
  (B10) imply the factor-price formulas. In the automation-only case, the wage
  effect is productivity minus displacement and the rental effect is positive.

## Current boundary

The exact CES productivity coefficients, (B9), and (B10) have not yet been
derived from the continuum model in Lean. Most named results are inventoried
but unformalized. The NBER Proposition 3 capital-threshold sentence is retained
as an open source issue because it prints `K-bar > K-underbar`; the later AER
inequality was not substituted.

## Files

- [PaperInterface.lean](PaperInterface.lean): transparent source-facing Specs.
- [ProofInterface.lean](ProofInterface.lean): exact-type proof endpoints.
- [MainTheorems.lean](MainTheorems.lean): checked proof implementations.
- [FORMALIZATION_PLAN.md](docs/FORMALIZATION_PLAN.md): inventory, proof order,
  open boundaries, and validation commands.
- [paper_statement_map.json](audit/paper_statement_map.json): pinned source
  anchors and the full deferred named-result ledger.
- [source_proof_fidelity.json](audit/source_proof_fidelity.json): checked proof
  steps and the NBER capital-threshold issue.
