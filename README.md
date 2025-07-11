
# 🐟 Climate-Induced Shifts in Fish Population Dynamics Using EDM

This project explores how climate variability—specifically the **North Atlantic Oscillation (NAO)**—influences fish population dynamics in the **Northeast Atlantic**. We apply **Empirical Dynamical Modeling (EDM)** and **Gaussian Process EDM (GPEDM)** to investigate nonlinear, causal relationships between climate and marine ecosystems.

## 🌍 Background

Marine species are sensitive to climate-driven shifts in ocean conditions. The NAO affects sea surface temperatures and circulation patterns, but its impact on individual fish populations is less understood. This study aims to:

- Quantify the role of the NAO as a **causal driver** of fish population dynamics
- Simulate future population trajectories under different climate scenarios
- Support ecosystem-based fisheries management with robust, data-driven insights

## 📊 Methods

We use two complementary nonlinear modeling approaches:

- **Empirical Dynamical Modeling (EDM):** Model-free forecasting and causal inference using delay embedding
- **Gaussian Process EDM (GPEDM):** Probabilistic, interpretable version of EDM that allows for uncertainty quantification

Key techniques include:

- **State-space reconstruction**
- **Forecast skill evaluation (R², RMSE)**
- **Causal inference via convergent cross-mapping (CCM) and φ-values**

## 🐠 Data

- **Fish abundance:** NOAA Northeast Fisheries Science Center (NEFSC) spring bottom trawl surveys (1968–2008)
- **Climate data:** Hurrell’s North Atlantic Oscillation (NAO) index
- **Species of interest:** Cod, Herring, Mackerel, and others with sufficient time series data

## 🔬 Results Summary

- GPEDM models with NAO inputs outperform climate-free models
- Strong φ-values suggest NAO is a **significant causal driver** for several species
- Simulations reveal **species-specific responses** to NAO variability

## ⚙️ How to Run

1. Clone the repo:
   ```bash
   git clone https://github.com/your-username/NAO-fish-EDM.git
   cd NAO-fish-EDM
````

2. Open R and install dependencies:

   ```R
   install.packages(c("rEDM", "tidyverse", "ggplot2", "readr"))
   # GPEDM may be installed from source if not on CRAN
   # devtools::install_github("username/gpedm")
   ```

3. Run analysis scripts:

   * `scripts/run_EDM_analysis.R` — Main EDM workflows
   * `scripts/fit_GP_models.R` — Fit GPEDM models
   * `scripts/run_simulations.R` — Project future dynamics

## 📦 Dependencies

* R >= 4.1
* Packages: `rEDM`, `gpedm`, `tidyverse`, `ggplot2`, `readr`, etc.

Optional: If using `renv`, activate the environment:

```R
renv::restore()
```

## 📫 Contact

**Haley Cabrera**
For questions, open an issue or email `haley.cabrera@example.com`

```

---

Let me know if you'd like to:
- Customize the project title or abstract tone
- Add a figure (I can give you a `![alt text](path/to/image.png)` block)
- Auto-generate a `renv.lock` or session info for reproducibility

Happy to help further!
```
