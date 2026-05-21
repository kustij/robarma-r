library(testthat)
library(robarma)

test_that("simulate output is reproducible with seed", {
  phi <- c(0.7)
  theta <- c(0.1)
  mu <- 1
  n <- 10
  sim1 <- simulate(phi, theta, mu, n, seed = 123)
  sim2 <- simulate(phi, theta, mu, n, seed = 123)
  expect_equal(sim1, sim2)
})
