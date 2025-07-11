# 🐟 Climate-Driven Shifts in Fish Population Dynamics Using EDM

This project investigates how climate variability—specifically the North Atlantic Oscillation (NAO)—shapes fish population dynamics in the Northeast Atlantic. Using **Empirical Dynamical Modeling (EDM)** and its probabilistic extension, **Gaussian Process EDM (GPEDM)**, we explore nonlinear and potentially causal links between climate and marine ecosystems.

## 🌍 Background

Marine ecosystems are highly sensitive to changing ocean conditions, many of which are influenced by large-scale climate patterns like the NAO. While the NAO is known to affect sea surface temperature and ocean circulation, its impact on individual fish species is less well characterized. This project addresses that gap by:

- Assessing the NAO’s role as a **causal driver** of population dynamics
- Simulating potential future population trends under different climate regimes
- Contributing data-driven tools to support ecosystem-based fisheries management

## 📊 Methods

We use two complementary modeling approaches that don’t require explicit mechanistic equations:

- **Empirical Dynamical Modeling (EDM):** A model-free framework that uses delay-coordinate embedding to forecast and infer causality
- **Gaussian Process EDM (GPEDM):** A flexible, probabilistic variant of EDM that quantifies uncertainty in forecasts and relationships

Both methods allow us to study complex systems using only observed time series data—no assumptions about the underlying equations are needed.

## 🔁 Why Delay Embedding Works: Takens' Theorem

In ecological systems, many important variables—like prey availability, competition, or temperature—are often unmeasured. Takens' Theorem offers a way forward: under certain conditions, the dynamics of a system can be reconstructed using time-lagged values of just one observed variable.


This approach captures hidden ecological influences indirectly through their effect on the target species. In practice, we reconstruct the system’s “attractor” and use it for forecasting and inference. This is the foundation of both EDM and GPEDM.

## 🐠 Data

- **Fish abundance:** Spring bottom trawl surveys from NOAA’s Northeast Fisheries Science Center (1968–2008)
- **Climate index:** Hurrell’s North Atlantic Oscillation (NAO) index
- **Focal species:** Cod, Herring, Mackerel, and others with sufficient long-term records

## 🔬 Key Findings

- GPEDM models that include NAO consistently outperform those without climate input
- High φ-values suggest the NAO plays a causal role in the population dynamics of multiple species
- Species show distinct responses to NAO variability, highlighting the importance of species-specific modeling in fisheries science

