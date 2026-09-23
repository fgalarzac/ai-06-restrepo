import AR18RaceManMachine.Assumptions
import Mathlib.Tactic

/-!
# Checked static-model proof layer

The first theorem formalizes the cutoff argument surrounding equation (6).
The last two theorems formalize the two-equation calculation in the proof of
Proposition 3 (equations (B9) and (B10)) and its automation-only
productivity-versus-displacement specialization.

The Proposition 3 results are deliberately conditional on (B9) and (B10).
Deriving those differential identities from the paper's continuum production
model is outside the present proof boundary and remains explicit in the source
map and status.
-/

namespace AR18RaceManMachine

/-- Strict comparative advantage and the indifference equation imply the
source's cutoff allocation: below `min I threshold`, capital is available and
has the lower relative cost index; above it, either automation is unavailable
or labor has the lower relative cost index. -/
theorem staticTaskThreshold_impl
    (productivity : ℝ → ℝ) (I threshold wage rental : ℝ)
    (hComparativeAdvantage : StrictComparativeAdvantage productivity)
    (hProductivityPositive : PositiveTaskProductivity productivity)
    (hRentalPositive : 0 < rental)
    (hThreshold : IsCostIndifferenceTask productivity wage rental threshold) :
    (∀ task, task < EquilibriumTaskThreshold I threshold →
      AutomationAvailable I task ∧ rental < wage / productivity task) ∧
    (∀ task, EquilibriumTaskThreshold I threshold < task →
      I < task ∨ wage / productivity task < rental) := by
  change StrictMono productivity at hComparativeAdvantage
  change ∀ task, 0 < productivity task at hProductivityPositive
  change productivity threshold = wage / rental at hThreshold
  constructor
  · intro task htask
    have htaskI : task < I :=
      lt_of_lt_of_le htask (min_le_left I threshold)
    have htaskThreshold : task < threshold :=
      lt_of_lt_of_le htask (min_le_right I threshold)
    have hProductivity : productivity task < productivity threshold :=
      hComparativeAdvantage htaskThreshold
    rw [hThreshold] at hProductivity
    have hBeforeCleared : productivity task * rental < wage :=
      (lt_div_iff₀ hRentalPositive).mp hProductivity
    have hCapitalCheaper : rental < wage / productivity task :=
      (lt_div_iff₀ (hProductivityPositive task)).mpr (by
        simpa [mul_comm] using hBeforeCleared)
    exact ⟨le_of_lt htaskI, hCapitalCheaper⟩
  · intro task htask
    by_cases hI : I < task
    · exact Or.inl hI
    · right
      have hThresholdTask : threshold < task := by
        by_contra hNot
        have hTaskI : task ≤ I := le_of_not_gt hI
        have hTaskThreshold : task ≤ threshold := le_of_not_gt hNot
        have hTaskMin : task ≤ min I threshold := le_min hTaskI hTaskThreshold
        exact (not_le_of_gt htask) hTaskMin
      have hProductivity : productivity threshold < productivity task :=
        hComparativeAdvantage hThresholdTask
      rw [hThreshold] at hProductivity
      have hAfterCleared : wage < productivity task * rental :=
        (div_lt_iff₀ hRentalPositive).mp hProductivity
      exact (div_lt_iff₀ (hProductivityPositive task)).mpr (by
        simpa [mul_comm] using hAfterCleared)

/-- Solving the income-accounting identity (B9) together with the relative
factor-price identity (B10) gives the two factor-price formulas displayed in
Proposition 3. -/
theorem factorPriceDecomposition_impl
    (laborShare wageChange rentalChange productivityChange relativePriceChange : ℝ)
    (hIncome :
      laborShare * wageChange + (1 - laborShare) * rentalChange =
        productivityChange)
    (hRelative : wageChange - rentalChange = relativePriceChange) :
    wageChange =
        productivityChange + (1 - laborShare) * relativePriceChange ∧
      rentalChange =
        productivityChange - laborShare * relativePriceChange := by
  constructor
  · linear_combination hIncome + (1 - laborShare) * hRelative
  · linear_combination hIncome - laborShare * hRelative

/-- Automation-only specialization of Proposition 3. `productivityChange` is
the positive `d ln Y|_{K,L}` term and `displacement` is the positive magnitude
of the automation component of (B10). The wage sign is determined by their
difference, while the rental-rate change is positive. -/
theorem proposition3AutomationSignDecomposition_impl
    (laborShare wageChange rentalChange productivityChange displacement : ℝ)
    (hIncome :
      laborShare * wageChange + (1 - laborShare) * rentalChange =
        productivityChange)
    (hRelative : wageChange - rentalChange = -displacement)
    (hProductivity : 0 < productivityChange)
    (hDisplacement : 0 < displacement)
    (hLaborShareNonnegative : 0 ≤ laborShare)
    (hLaborShareAtMostOne : laborShare ≤ 1) :
    wageChange = productivityChange - (1 - laborShare) * displacement ∧
      rentalChange = productivityChange + laborShare * displacement ∧
      0 < rentalChange ∧
      ((1 - laborShare) * displacement < productivityChange →
        0 < wageChange) ∧
      (productivityChange < (1 - laborShare) * displacement →
        wageChange < 0) := by
  have hDecomposition :=
    factorPriceDecomposition_impl laborShare wageChange rentalChange
      productivityChange (-displacement) hIncome hRelative
  rcases hDecomposition with ⟨hWage, hRental⟩
  constructor
  · nlinarith
  · constructor
    · nlinarith
    · constructor
      · nlinarith [mul_nonneg hLaborShareNonnegative (le_of_lt hDisplacement)]
      · constructor <;> intro hComparison <;> nlinarith

end AR18RaceManMachine

