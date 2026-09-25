# The Race Between Machine and Man: Implications of Technology for Growth, Factor Shares and Employment Formalization Notes

This is a lightweight handoff document for source-to-Lean mapping.

- Namespace: `AR18RaceManMachine`
- Official URL: https://www.nber.org/papers/w22252
- Source authority: NBER Working Paper 22252, revised June 2017
- Source PDF: `source/w22252.pdf`
- Local source text cache: `source/w22252.txt` (ignored by Git)

## Formalization checklist

- [ ] Full named-result inventory copied to the README theorem table.
- [ ] DAG graph includes all required paper-stage nodes and dependencies.
- [ ] README status and remaining-assumption notes match proof artifacts.
- [ ] Post-formalization library elevation pass completed: reusable proof
      results, techniques, and primitives were moved into `AppliedModelingLib` when
      local/low-risk, or recorded with destination modules in the final report.
- [ ] Recursive provenance is clear in the consolidated paper closeout. Run a
      standalone repository-wide provenance audit only for a named diagnostic
      failure or at an explicit integration/release boundary.
- [ ] Final status review completed before publishing.

## Notes

- Date reviewed: 2026-09-22
- Last theorem row formalized: selected static algebraic core of Proposition 3
- Outstanding assumptions / caveats: full paper remains partial; B9/B10 and
  coefficient positivity are proof-level boundaries; the literal NBER
  `K-bar > K-underbar` clause is open and has not been replaced by the AER text.
- Reusable library elevation candidates:
