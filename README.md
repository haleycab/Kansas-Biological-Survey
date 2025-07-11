# 🐟 Climate-Induced Shifts in Fish Population Dynamics Using EDM

This project investigates how climate variability, particularly the North Atlantic Oscillation (NAO), influences fish population dynamics in the Northeast Atlantic. We apply two modeling approaches: **Empirical Dynamical Modeling (EDM)** and its probabilistic extension, **Gaussian Process EDM (GPEDM)**, to explore nonlinear relationships between climate drivers and marine species abundance.

## 🌍 Background

Ecological systems are influenced by many interacting variables, many of which are unmeasured or unknown. In marine environments, species distributions and population trends often reflect large-scale climate variability. The NAO, which alters sea surface temperatures, wind, and ocean mixing, plays a central role in shaping the North Atlantic marine ecosystem. However, its specific impact on fish populations remains difficult to quantify.

This study focuses on understanding how the NAO affects fish abundance at the species level. The objective is to assess whether the NAO acts as a causal driver of population dynamics and to evaluate how species respond to different climate scenarios.

## 📊 Methods

We use two complementary, nonlinear time series approaches:

- **Empirical Dynamical Modeling (EDM):** A model-free forecasting method that reconstructs system dynamics using time-lagged observations
- **Gaussian Process EDM (GPEDM):** A probabilistic version of EDM that models nonlinear dynamics as distributions over functions, allowing for uncertainty quantification

These approaches allow us to examine complex, state-dependent dynamics without needing to specify a mechanistic model of the system.

## 🔁 Why Delay Embedding Works: Takens' Theorem

Ecological time series often lack complete information on all relevant drivers. For instance, while we may have data on the population size of a fish species, we may not have observations of its prey, competitors, or environmental conditions. Despite this, it is possible to model the system's dynamics.

**Takens’ Theorem** provides the theoretical foundation for this approach. It states that, under certain assumptions, the dynamics of a system can be reconstructed using only time-lagged values of a single observed variable. This means that by using lagged observations of species abundance, we can implicitly account for the effects of hidden or unmeasured variables. This principle is the foundation of both EDM and GPEDM.

## 🐠 Data

- **Fish abundance:** Spring bottom trawl survey data from NOAA’s Northeast Fisheries Science Center (1968–2008)
- **Climate index:** Hurrell’s North Atlantic Oscillation (NAO) index
- **Species examined:** Atlantic cod, herring, mackerel, and other species with sufficiently long time series

## 🔬 Results Summary

- GPEDM models that include the NAO as an input show improved predictive performance compared to models without climate variables
- Strong causal signals (high φ-values) suggest that the NAO influences population dynamics in several species
- Simulations highlight species-specific responses to NAO variability, suggesting different ecological mechanisms across trophic levels

These findings demonstrate that EDM-based approaches can be effective in identifying climate-driven dynamics in ecological systems, even when many key processes remain unmeasured.
