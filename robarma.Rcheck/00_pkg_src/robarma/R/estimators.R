as_robarma_model <- function(model, p = NULL, q = NULL) {
  if (inherits(model, "robarma_arma_model")) {
    return(model)
  }

  if (missing(p) || missing(q)) {
    stop("Provide either an arma_model() object or y, p, and q.", call. = FALSE)
  }

  arma_model(model, p, q)
}

#' Construct an ARMA model object
#' @export
arma_model <- function(y, p, q) {
  if (!is.numeric(y)) {
    stop("y must be numeric.", call. = FALSE)
  }

  structure(
    list(
      y = as.numeric(y),
      p = as.integer(p),
      q = as.integer(q)
    ),
    class = "robarma_arma_model"
  )
}

format.robarma_arma_model <- function(x, ...) {
  sprintf("ARMA(%d, %d) model with %d observations", x$p, x$q, length(x$y))
}

print.robarma_arma_model <- function(x, ...) {
  cat(format(x), "\n")
  invisible(x)
}

wrap_fit <- function(result) {
  list(
    phi = result$phi,
    theta = result$theta,
    mu = result$mu,
    params = list(
      phi = result$phi,
      theta = result$theta,
      mu = result$mu
    ),
    final_cost = result$final_cost,
    converged = result$converged
  )
}

#' Simulate ARMA model (RobARMA)
#' @export
simulate <- function(phi, theta, mu, n, burn_in = 100, seed = 0) {
  .Call("_robarma_simulate_rcpp", phi, theta, mu, n, burn_in, seed)
}

#' Ordinary least squares estimator
#' @export
ols <- function(model, p, q) {
  model <- as_robarma_model(model, p, q)
  wrap_fit(.Call("_robarma_ols_rcpp", model$y, model$p, model$q))
}

#' Maximum likelihood estimator
#' @export
mle <- function(model, p, q) {
  model <- as_robarma_model(model, p, q)
  wrap_fit(.Call("_robarma_mle_rcpp", model$y, model$p, model$q))
}

#' Filtered tau estimator
#' @export
ftau <- function(model, p, q) {
  model <- as_robarma_model(model, p, q)
  wrap_fit(.Call("_robarma_ftau_rcpp", model$y, model$p, model$q))
}

#' S estimator
#' @export
s <- function(model, p, q) {
  model <- as_robarma_model(model, p, q)
  wrap_fit(.Call("_robarma_s_rcpp", model$y, model$p, model$q))
}

#' MM estimator
#' @export
mm <- function(model, p, q) {
  model <- as_robarma_model(model, p, q)
  wrap_fit(.Call("_robarma_mm_rcpp", model$y, model$p, model$q))
}

#' BIP-MM estimator
#' @export
bip_mm <- function(model, p, q) {
  model <- as_robarma_model(model, p, q)
  wrap_fit(.Call("_robarma_bip_mm_rcpp", model$y, model$p, model$q))
}
