"""Static task equilibrium: AER Propositions 2-3, illustrative numerics.

Uses equation (12) with eta -> 0, N=1, gamma(i)=exp(A*i), theta=1,
nu(L)=L**2/2, B=1. No empirical calibration or dynamic theorem is claimed.
Run: python sim.py
"""

from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path
import math

import matplotlib

matplotlib.use("Agg")
import matplotlib.pyplot as plt
import numpy as np
from scipy.optimize import brentq


OUT = Path(__file__).resolve().parent / "figures"


@dataclass(frozen=True)
class Economy:
    sigma: float
    A: float

    def __post_init__(self) -> None:
        if self.sigma <= 0 or abs(self.sigma - 1) < 1e-8 or self.A <= 0:
            raise ValueError("Use positive A and sigma > 0 away from its log limit")

    def labor_weight(self, x: float) -> float:
        """Integral J=integral_x^1 gamma(i)^(sigma-1) di in (12)."""
        b = self.A * (self.sigma - 1)
        return math.exp(b * x) * math.expm1(b * (1 - x)) / b

    def at_allocation(self, x: float, K: float) -> dict[str, float]:
        """Equilibrium conditional on the actual capital-task threshold x."""
        if not (0 < x < 1 and K > 0):
            raise ValueError("Need 0 < x < 1 and K > 0")
        s = self.sigma
        j = self.labor_weight(x)
        ak = x ** (1 / s)
        al = j ** (1 / s)
        p = (s - 1) / s

        # L = W/C and C=F give a monotone scalar equation for L in (0,1).
        def labor_foc(L: float) -> float:
            return ak * K**p * L ** (1 + 1 / s) + al * L * L - al

        L = brentq(labor_foc, 1e-12, 1.0, xtol=1e-14)
        m = ak * K**p + al * L**p
        F = m ** (s / (s - 1))
        R = F * ak * K ** (-1 / s) / m
        W = F * al * L ** (-1 / s) / m
        share = W * L / F
        return {"x": x, "K": K, "L": L, "F": F, "W": W, "R": R,
                "share": share, "ratio": W / R, "J": j}

    def equal_cost_threshold(self, K: float) -> float:
        """The unique x with W/R=gamma(x), before imposing I."""
        def gap(x: float) -> float:
            q = self.at_allocation(x, K)
            return math.log(q["ratio"]) - self.A * x

        return brentq(gap, 1e-5, 1 - 1e-5, xtol=1e-12)

    def equilibrium(self, I: float, K: float) -> dict[str, float]:
        tilde = self.equal_cost_threshold(K)
        q = self.at_allocation(min(I, tilde), K)
        q["I"] = I
        q["I_tilde"] = tilde
        return q

    def proposition3_terms(self, I: float, K: float) -> dict[str, float]:
        """Published productivity minus displacement formula at binding I."""
        q = self.at_allocation(I, K)
        s = self.sigma
        effective_wage = q["W"] / math.exp(self.A * I)
        productivity = (effective_wage ** (1 - s) - q["R"] ** (1 - s)) / (1 - s)
        epsilon_L = (1 - q["L"] ** 2) / (1 + q["L"] ** 2)
        lam_I = math.exp(self.A * (s - 1) * I) / q["J"] + 1 / I
        displacement = (1 - q["share"]) * lam_I / (s + epsilon_L)
        return {"productivity": productivity, "displacement": displacement,
                "net": productivity - displacement,
                "binding": q["ratio"] > math.exp(self.A * I),
                "new_task_adopted": q["ratio"] < math.exp(self.A)}


def allocation_figure() -> None:
    """Illustration of the published Figure 3 / Proposition 2, not a new result."""
    cases = [(Economy(1.2, 4.0), 5.0), (Economy(1.2, 4.0), 22.0)]
    grid = np.linspace(0.34, 0.78, 220)
    fig, axes = plt.subplots(2, 2, figsize=(10, 7), sharex="col")
    for col, (economy, K) in enumerate(cases):
        data = [economy.equilibrium(float(I), K) for I in grid]
        tilde = data[0]["I_tilde"]
        actual = np.array([q["x"] for q in data])
        share = np.array([q["share"] for q in data])
        axes[0, col].plot(grid, actual, color="#176B84", lw=2.3, label="$I^*$")
        axes[0, col].plot(grid, grid, color="0.55", lw=1, ls=":", label="available $I$")
        axes[0, col].axvline(tilde, color="#B74C3D", ls="--", lw=1.3)
        axes[0, col].set_title(f"$A=4$, $\\sigma=1.2$, $K={K:g}$; $\\widetilde I={tilde:.3f}$")
        axes[1, col].plot(grid, share, color="#6A5BA5", lw=2.3)
        axes[1, col].axvline(tilde, color="#B74C3D", ls="--", lw=1.3)
        axes[1, col].set_xlabel("Available automation frontier $I$")
        axes[1, col].set_ylim(0, 1)
        axes[0, col].set_ylim(0, 1)
        if col == 0:
            axes[0, col].set_ylabel("Tasks produced with capital: $I^*$")
            axes[1, col].set_ylabel("Labor share")
            axes[0, col].legend(frameon=False, loc="upper left")
        for row in (0, 1):
            axes[row, col].grid(alpha=0.2)
    fig.suptitle("PAPER illustration: Figure 3 / Proposition 2 (binding frontier, then no effect)")
    fig.tight_layout()
    fig.savefig(OUT / "task_allocation.png", dpi=180)
    plt.close(fig)


def wage_threshold_figure() -> None:
    """Own parameter sweep of Proposition 3 inside Assumptions 1-3."""
    I = 0.4
    sigma = 1.2
    cases = [Economy(sigma, 1.0), Economy(sigma, 4.0)]
    fig, axes = plt.subplots(2, 1, figsize=(9, 8), sharex=True)
    threshold_info: list[tuple[float, float | None, float, float]] = []
    for economy, color in zip(cases, ("#4477AA", "#B74C3D")):
        candidate = np.geomspace(1e-3, 1e4, 1800)
        eligible = []
        for K in candidate:
            z = economy.proposition3_terms(I, float(K))
            if z["binding"] and z["new_task_adopted"]:
                eligible.append(float(K))
        if len(eligible) < 3:
            raise RuntimeError(f"No admissible range for A={economy.A}")
        lo, hi = eligible[0], eligible[-1]
        Ks = np.geomspace(lo * 1.00001, hi / 1.00001, 240)
        terms = [economy.proposition3_terms(I, float(K)) for K in Ks]
        net = np.array([z["net"] for z in terms])
        axes[0].plot(Ks, net, color=color, lw=2.2, label=f"$A={economy.A:g}$, admissible $K$")
        roots = []
        for a, b, ya, yb in zip(Ks[:-1], Ks[1:], net[:-1], net[1:]):
            if ya * yb < 0:
                roots.append(brentq(lambda k: economy.proposition3_terms(I, k)["net"], a, b))
        root = roots[0] if roots else None
        threshold_info.append((economy.A, root, lo, hi))
        if root is not None:
            axes[0].scatter([root], [0], color=color, zorder=4)
        if economy.A == 4.0:
            axes[1].plot(Ks, [z["productivity"] for z in terms], color="#238A70", lw=2.1,
                         label="Productivity gain")
            axes[1].plot(Ks, [z["displacement"] for z in terms], color="#9B5AA3", lw=2.1,
                         label="Displacement loss")
            if root is not None:
                axes[1].axvline(root, color="0.45", ls="--", lw=1.2,
                                label=f"$\\widetilde K={root:.2f}$")
    axes[0].axhline(0, color="black", lw=0.9)
    axes[0].set_ylabel("$d\\ln W/dI$ at fixed $K$")
    axes[0].legend(frameon=False)
    axes[1].set_ylabel("Proposition 3 components")
    axes[1].set_xlabel("Capital stock $K$ (log scale)")
    axes[1].legend(frameon=False)
    for ax in axes:
        ax.set_xscale("log")
        ax.grid(alpha=0.2)
    fig.suptitle("OWN exploration: capital abundance and the static wage threshold")
    fig.tight_layout()
    fig.savefig(OUT / "wage_threshold.png", dpi=180)
    plt.close(fig)
    for A, root, lo, hi in threshold_info:
        print(f"A={A:g}: admissible K about [{lo:.4f}, {hi:.4f}], "
              f"wage-sign threshold {root if root is not None else 'outside range'}")


def verify_equations() -> None:
    """Numerical checks on the two economically material regime distinctions."""
    eco = Economy(1.2, 4.0)
    I, K, h = 0.4, 5.0, 1e-5
    q = eco.equilibrium(I, K)
    assert q["x"] == I and q["I_tilde"] > I
    assert abs(q["R"] * K + q["W"] * q["L"] - q["F"]) < 1e-9
    analytic = eco.proposition3_terms(I, K)["net"]
    numeric = (math.log(eco.equilibrium(I + h, K)["W"])
               - math.log(eco.equilibrium(I - h, K)["W"])) / (2 * h)
    assert abs(analytic - numeric) < 2e-6, (analytic, numeric)
    free_I = min(0.9, q["I_tilde"] + 0.08)
    free = eco.equilibrium(free_I, K)
    free_more = eco.equilibrium(min(0.99, free_I + 0.02), K)
    assert free["x"] == free_more["x"] and free["W"] == free_more["W"]
    print(f"Proposition 3 derivative: formula={analytic:.8f}, finite difference={numeric:.8f}")
    print(f"Figure 3 free regime: W(I={free_I:.3f})=W(I={free_I+0.02:.3f})={free['W']:.8f}")


def main() -> None:
    OUT.mkdir(exist_ok=True)
    verify_equations()
    allocation_figure()
    wage_threshold_figure()
    print(f"Saved figures in {OUT}")


if __name__ == "__main__":
    main()
