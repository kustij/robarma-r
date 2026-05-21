library(testthat)
library(robarma)

test_that("arma_model creates a model object", {
    y <- rnorm(25)
    model <- arma_model(y, 1, 1)

    expect_s3_class(model, "robarma_arma_model")
    expect_equal(model$p, 1L)
    expect_equal(model$q, 1L)
    expect_length(model$y, length(y))
})

test_that("ols returns expected structure", {
    y <- rnorm(100)
    fit <- ols(y, p = 2, q = 2)
    expect_type(fit, "list")
    expect_true(all(c("phi", "theta", "mu", "final_cost", "converged") %in% names(fit)))
    expect_true(all(c("phi", "theta", "mu") %in% names(fit$params)))
})

test_that("mm accepts an arma_model object", {
    y <- simulate(phi = c(0.5), theta = c(0.2), mu = 1, n = 100, seed = 123)
    model <- arma_model(y, 1, 1)

    fit <- mm(model)

    expect_true(is.list(fit$params))
    expect_true(all(c("phi", "theta", "mu") %in% names(fit$params)))
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
