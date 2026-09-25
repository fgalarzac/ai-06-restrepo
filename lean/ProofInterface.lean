import AR18RaceManMachine.PaperInterface

/-!
# Exact-type proof endpoints
-/

namespace AR18RaceManMachine

theorem staticTaskThreshold
    (productivity : ℝ → ℝ) (I threshold wage rental : ℝ) :
    staticTaskThresholdSpec productivity I threshold wage rental := by
  intro hComparativeAdvantage hProductivityPositive hRentalPositive hThreshold
  exact staticTaskThreshold_impl productivity I threshold wage rental
    hComparativeAdvantage hProductivityPositive hRentalPositive hThreshold

theorem proposition3StaticCore : proposition3StaticCoreSpec := by
  constructor
  · intro laborShare wageChange rentalChange productivityChange
      relativePriceChange hIncome hRelative
    exact factorPriceDecomposition_impl laborShare wageChange rentalChange
      productivityChange relativePriceChange hIncome hRelative
  · intro laborShare wageChange rentalChange productivityChange displacement
      hIncome hRelative hProductivity hDisplacement hLaborShareNonnegative
      hLaborShareAtMostOne
    exact proposition3AutomationSignDecomposition_impl laborShare wageChange
      rentalChange productivityChange displacement hIncome hRelative hProductivity
      hDisplacement hLaborShareNonnegative hLaborShareAtMostOne

end AR18RaceManMachine
