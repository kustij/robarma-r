# robarmaR

R package wrapper for RobARMA C++ library (Eigen, Ceres).

## Features
- Precompiled binaries for major platforms
- Rcpp interface to RobARMA functions

## Usage
```r
library(robarmaR)
result <- estimate_arma(...)
sim <- simulate(...)
```

## Building and Bundling
- Build RobARMA C++ library for macOS, Windows, Linux
- Place binaries in `inst/libs/<platform>/`
- Update RcppExports.cpp to wrap all required functions

## Notes
- No need for users to install Eigen or Ceres
- All heavy lifting done in C++
