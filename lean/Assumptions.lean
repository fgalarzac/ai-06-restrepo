import Mathlib

/-!
# Source assumptions and static-model objects

This module contains only source-presented static-model ingredients used by the
current formalization. The stronger dynamic assumptions remain inventoried in
the paper plan and source map, but are not asserted here.
-/

namespace AR18RaceManMachine

/-- Assumption 1: labor productivity is strictly increasing in the task index. -/
def StrictComparativeAdvantage (productivity : ℝ → ℝ) : Prop :=
  StrictMono productivity

/-- Positivity implicit in the paper's use of `γ(i)` as task productivity and
in the effective labor cost `W / γ(i)`. -/
def PositiveTaskProductivity (productivity : ℝ → ℝ) : Prop :=
  ∀ task, 0 < productivity task

/-- A task is technologically available for automation exactly when its index
does not exceed the automation frontier `I`. -/
def AutomationAvailable (I task : ℝ) : Prop :=
  task ≤ I

/-- Equation (6), written as a predicate on the cost-indifference task. -/
def IsCostIndifferenceTask
    (productivity : ℝ → ℝ) (wage rental threshold : ℝ) : Prop :=
  productivity threshold = wage / rental

/-- The equilibrium task cutoff displayed immediately after equation (6). -/
def EquilibriumTaskThreshold (I costThreshold : ℝ) : ℝ :=
  min I costThreshold

end AR18RaceManMachine
