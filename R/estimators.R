#' Simulate ARMA model (RobARMA)
#' @export
simulate <- function(phi, theta, mu, n, burn_in = 100, seed = 0) {
  .Call("_robarma_simulate_rcpp", phi, theta, mu, n, burn_in, seed)
}

#' Ordinary least squares estimator
#' @export
ols <- function(...) {
  .Call("_robarma_ols_rcpp", ...)
}

#' Maximum likelihood estimator
#' @export
mle <- function(...) {
  .Call("_robarma_mle_rcpp", ...)
}

#' Filtered tau estimator
#' @export
ftau <- function(...) {
  .Call("_robarma_ftau_rcpp", ...)
}

#' S estimator
#' @export
s <- function(...) {
  .Call("_robarma_s_rcpp", ...)
}

#' MM estimator
#' @export
mm <- function(...) {
  .Call("_robarma_mm_rcpp", ...)
}

#' BIP-MM estimator
#' @export
bip_mm <- function(...) {
  .Call("_robarma_bip_mm_rcpp", ...)
}
