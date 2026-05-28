# RobARMA for R

R package wrapper for the RobARMA C++ library — robust and classical ARMA estimation.

## Installation

### R-universe (binary — no compiler needed)

```r
install.packages("robarma", repos = "https://kustij.r-universe.dev")
```

R-universe distributes pre-built binaries for macOS, Windows, and Linux.
No Ceres, Eigen, or C++ toolchain required.

### From source via remotes

You need Ceres Solver and Eigen3 installed first:

```bash
# macOS
brew install ceres-solver eigen

# Ubuntu / Debian
sudo apt-get install libceres-dev libeigen3-dev libgoogle-glog-dev libgflags-dev
```

Then:

```r
remotes::install_github("kustij/robarma-r")
```

## Usage

```r
library(robarma)

y     <- simulate(phi = c(0.5), theta = c(0.2), mu = 1, n = 100, seed = 123)
model <- arma_model(y, 1, 1)
fit   <- mm(model)
fit$params
```

All estimators (`ols`, `mle`, `ftau`, `s`, `mm`, `bip_mm`) accept either an `arma_model` object or raw `y, p, q` arguments.

## Development

### Prerequisites

macOS: `brew install ceres-solver eigen`  
Linux: `sudo apt-get install libceres-dev libeigen3-dev libgoogle-glog-dev libgflags-dev`

### Building

```bash
Rscript -e "Rcpp::compileAttributes()"
R CMD build .
R CMD INSTALL robarma_*.tar.gz
```

The `configure` script auto-detects Ceres and Eigen on macOS (Homebrew or vcpkg) and Linux (system packages). Set `VCPKG_INCLUDE`, `VCPKG_EIGEN`, and `VCPKG_LIB` to override.

### VS Code Tasks

`Rcpp: compileAttributes` → `Build R package` → `Install R package` → `Test R package`

### CI

GitHub Actions workflow at `.github/workflows/R-CMD-check.yml` installs native dependencies and runs `R CMD check` on macOS, Linux, and Windows.
