import AR18RaceManMachine.MainTheorems

/-!
# Paper interface: Acemoglu and Restrepo (NBER Working Paper 22252)

Source authority: the revised June 2017 NBER version. This interface selects
the central static cutoff statement and the factor-price algebra underlying
Proposition 3. The latter remains conditional on equations (B9) and (B10), so
this is an explicitly partial formalization of Proposition 3 rather than a
claim that its full continuum comparative-statics argument has been closed.
-/

namespace AR18RaceManMachine

/-- Source-facing target for the static task cutoff surrounding equation (6). -/
def staticTaskThresholdSpec
    (productivity : ℝ → ℝ) (I threshold wage rental : ℝ) : Prop :=
  StrictComparativeAdvantage productivity →
    PositiveTaskProductivity productivity →
      0 < rental →
        IsCostIndifferenceTask productivity wage rental threshold →
          (∀ task, task < EquilibriumTaskThreshold I threshold →
            AutomationAvailable I task ∧ rental < wage / productivity task) ∧
          (∀ task, EquilibriumTaskThreshold I threshold < task →
            I < task ∨ wage / productivity task < rental)

/-- The selected static algebraic core of Proposition 3, kept as one semantic
target. The first conjunct formalizes the (B9)-(B10) linear-system step. The
second specializes it to automation and makes the productivity-versus-
displacement sign comparison explicit. The premises expose the present partial
boundary: this target does not claim a derivation of (B9), (B10), or coefficient
positivity from the full continuum model. -/
def proposition3StaticCoreSpec : Prop :=
  (∀ laborShare wageChange rentalChange productivityChange relativePriceChange : ℝ,
    laborShare * wageChange + (1 - laborShare) * rentalChange =
        productivityChange →
      wageChange - rentalChange = relativePriceChange →
        wageChange =
            productivityChange + (1 - laborShare) * relativePriceChange ∧
          rentalChange =
            productivityChange - laborShare * relativePriceChange) ∧
  (∀ laborShare wageChange rentalChange productivityChange displacement : ℝ,
    laborShare * wageChange + (1 - laborShare) * rentalChange =
        productivityChange →
      wageChange - rentalChange = -displacement →
        0 < productivityChange →
          0 < displacement →
            0 ≤ laborShare →
              laborShare ≤ 1 →
                wageChange =
                    productivityChange - (1 - laborShare) * displacement ∧
                  rentalChange = productivityChange + laborShare * displacement ∧
                  0 < rentalChange ∧
                  ((1 - laborShare) * displacement < productivityChange →
                    0 < wageChange) ∧
                  (productivityChange < (1 - laborShare) * displacement →
                    wageChange < 0))

end AR18RaceManMachine
