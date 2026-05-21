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

### Building the project

- Compile attributes to generate RcppExports.cpp and RcppExports.R files in src directory
  ```bash
  Rscript 'Rcpp::compileAttributes()'
  ```
- Build package by running
  ```bash
  R CMD build .
  ```

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
