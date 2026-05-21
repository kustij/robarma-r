\name{simulate}
\alias{simulate}
\title{Simulate an ARMA process}
\description{
Simulate an ARMA(p, q) time series using the underlying C++ implementation.
}
\usage{
simulate(phi, theta, mu, n, burn_in = 100, seed = 0)
}
\arguments{
\item{phi}{Numeric vector of AR coefficients.}
\item{theta}{Numeric vector of MA coefficients.}
\item{mu}{Location parameter.}
\item{n}{Sample size.}
\item{burn_in}{Length of the burn-in period.}
\item{seed}{Random seed. A value of 0 uses the current time.}
}
\value{
A numeric vector containing the simulated series.
}
\examples{
y <- simulate(phi = c(0.5), theta = c(0.2), mu = 1, n = 100, seed = 123)
}