% Generated manually for robarma
\name{robarma-package}
\alias{robarma-package}
\docType{package}
\title{RobARMA for R}
\description{
R interface to the RobARMA C++ library for ARMA simulation and robust estimation.
}
\details{
The package provides a small R wrapper around the underlying C++ implementation.
Create an ARMA model with \code{arma_model()}, simulate series with \code{simulate()}, and fit estimators such as \code{mm()}.
}
\examples{
phi <- c(0.5)
theta <- c(0.2)
y <- simulate(phi = phi, theta = theta, mu = 1, n = 100, seed = 123)
model <- arma_model(y, 1, 1)
fit <- mm(model)
fit$params
}