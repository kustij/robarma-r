# RobARMA for R

R package wrapper for the RobARMA C++ library — robust and classical ARMA estimation.

## Installation

### R-universe (binary — no compiler needed)

```r
install.packages("robarma", repos = "https://kustij.r-universe.dev")
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

RobARMA builds on top of Ceres and Eigen.

### Building

````bash
Rscript -e "Rcpp::compileAttributes()"
R CMD build .
R CMD INSTALL robarma_*.tar.gz
### From source via remotes

You need Ceres Solver and Eigen3 installed first:

```bash
# macOS
brew install ceres-solver eige
````

The `configure` script auto-detects Ceres and Eigen on macOS (Homebrew or vcpkg) and Linux (system packages). Set `VCPKG_INCLUDE`, `VCPKG_EIGEN`, and `VCPKG_LIB` to override.
