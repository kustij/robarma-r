# RobARMA for R

R package wrapper for RobARMA C++ library.

## Usage

```r
library(robarma)
result <- ols(...)
sim <- simulate(...)
```

## Build and Development Workflow

### Prerequisites

- vcpkg

### Local Build (refresh.sh)

- For local development and CI, use:
  ```bash
  bash refresh.sh
  ```
  This will:
  - Regenerate Rcpp attributes
  - Build and install the package
  - Test loading the package

### VS Code Tasks

- You can use VS Code tasks for automation:
  - `Rcpp: compileAttributes` (regenerates RcppExports)
  - `Build R package` (runs R CMD build)
  - `Install R package` (installs built tarball)
  - `Test R package` (runs external tests)
- See `.vscode/tasks.json` for configuration.

### CI Workflow

- In CI, add steps to:
  - Run `Rscript -e "Rcpp::compileAttributes();"`
  - Build and install the package
  - Run tests with `Rscript tests/testthat.R`

## Notes

- No need for users to install Eigen or Ceres
- All heavy lifting done in C++
- Scripts and tasks are for development only, not for package users
