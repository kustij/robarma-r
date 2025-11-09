// [[Rcpp::depends(Rcpp)]]
#include <Rcpp.h>
#include "estimators.hpp"
#include "simulate.hpp"

// Expose all functions from estimators.hpp
// Example: assuming estimators.hpp has double estimate_arma(...)
// [[Rcpp::export]]
double estimate_arma_rcpp(/* args */) {
    // Call C++ function from RobARMA
    return estimate_arma(/* args */);
}

// Expose simulate from simulate.hpp
// [[Rcpp::export]]
Rcpp::NumericVector simulate_rcpp(/* args */) {
    // Call C++ simulate function
    // Convert result to Rcpp::NumericVector
    // ...
    return Rcpp::NumericVector::create(0.0); // placeholder
}

// Add wrappers for all other functions in estimators.hpp
