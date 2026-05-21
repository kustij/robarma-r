\name{estimators}
\alias{ols}
\alias{mle}
\alias{ftau}
\alias{s}
\alias{mm}
\alias{bip_mm}
\title{ARMA estimators}
\description{
Fit ARMA models using the available robust and classical estimators.
}
\usage{
ols(model, p, q)
mle(model, p, q)
ftau(model, p, q)
s(model, p, q)
mm(model, p, q)
bip_mm(model, p, q)
}
\arguments{
\item{model}{Either an object created by \code{arma_model()} or a numeric vector of observations.}
\item{p}{AR order, required when \code{model} is a numeric vector.}
\item{q}{MA order, required when \code{model} is a numeric vector.}
}
\value{
A list with fields \code{phi}, \code{theta}, \code{mu}, \code{params}, \code{final_cost}, and \code{converged}.
The nested \code{params} element contains \code{phi}, \code{theta}, and \code{mu} again for a Python-style interface.
}
\examples{
y <- simulate(phi = c(0.5), theta = c(0.2), mu = 1, n = 100, seed = 123)
model <- arma_model(y, 1, 1)
fit <- mm(model)
fit$params
}