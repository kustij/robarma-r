#' Estimate ARMA model (RobARMA)
#' @export
estimate_arma <- function(...) {
  .Call('_robarmaR_estimate_arma_rcpp', ...)
}

#' Simulate ARMA model (RobARMA)
#' @export
simulate <- function(...) {
  .Call('_robarmaR_simulate_rcpp', ...)
}

# Add R wrappers for other estimators.hpp functions as needed
