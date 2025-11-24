library(testthat)
library(robarma)

test_that("ols returns expected structure", {
    y <- rnorm(100)
    fit <- ols(y, p = 2, q = 2)
    expect_type(fit, "list")
    expect_true(all(c("phi", "theta", "mu", "final_cost", "converged") %in% names(fit)))
})

test_that("simulate returns numeric vector", {
    phi <- c(0.5)
    theta <- c(0.2)
    mu <- 0
    n <- 50
    sim <- simulate(phi, theta, mu, n)
    expect_type(sim, "double")
    expect_length(sim, n)
})
