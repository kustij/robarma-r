\name{arma_model}
\alias{arma_model}
\title{Construct an ARMA model object}
\description{
Create a lightweight ARMA model object that stores the observed series and model orders.
}
\usage{
arma_model(y, p, q)
}
\arguments{
\item{y}{Numeric vector of observations.}
\item{p}{Integer AR order.}
\item{q}{Integer MA order.}
}
\value{
An object of class \code{robarma_arma_model}.
}
\examples{
y <- rnorm(50)
model <- arma_model(y, 1, 1)
print(model)
}