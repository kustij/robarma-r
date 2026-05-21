#include <glog/export.h>
#include <Rcpp.h>
#include "../external/robarma/include/estimators.hpp"
#include "../external/robarma/include/simulate.hpp"

using namespace Rcpp;

// Helper to convert R vector to Eigen::VectorXd
Eigen::VectorXd as_eigen(NumericVector v)
{
    return Eigen::Map<Eigen::VectorXd>(v.begin(), v.size());
}

// Helper to convert Eigen::VectorXd to Rcpp::NumericVector
NumericVector to_numeric(const Eigen::VectorXd &v)
{
    return NumericVector(v.data(), v.data() + v.size());
}

// [[Rcpp::export]]
List ols_rcpp(NumericVector y, int p, int q)
{
    auto fit = robarma::estimators::ols(robarma::arma_model(as_eigen(y), p, q));
    return List::create(
        Named("phi") = to_numeric(fit.params.phi),
        Named("theta") = to_numeric(fit.params.theta),
        Named("mu") = fit.params.mu,
        Named("final_cost") = fit.result.final_cost,
        Named("converged") = fit.result.convergence);
}

// [[Rcpp::export]]
List mle_rcpp(NumericVector y, int p, int q)
{
    auto fit = robarma::estimators::mle(robarma::arma_model(as_eigen(y), p, q));
    return List::create(
        Named("phi") = to_numeric(fit.params.phi),
        Named("theta") = to_numeric(fit.params.theta),
        Named("mu") = fit.params.mu,
        Named("final_cost") = fit.result.final_cost,
        Named("converged") = fit.result.convergence);
}

// [[Rcpp::export]]
List ftau_rcpp(NumericVector y, int p, int q)
{
    auto fit = robarma::estimators::ftau(robarma::arma_model(as_eigen(y), p, q));
    return List::create(
        Named("phi") = to_numeric(fit.params.phi),
        Named("theta") = to_numeric(fit.params.theta),
        Named("mu") = fit.params.mu,
        Named("final_cost") = fit.result.final_cost,
        Named("converged") = fit.result.convergence);
}

// [[Rcpp::export]]
List s_rcpp(NumericVector y, int p, int q)
{
    auto fit = robarma::estimators::s(robarma::arma_model(as_eigen(y), p, q));
    return List::create(
        Named("phi") = to_numeric(fit.params.phi),
        Named("theta") = to_numeric(fit.params.theta),
        Named("mu") = fit.params.mu,
        Named("final_cost") = fit.result.final_cost,
        Named("converged") = fit.result.convergence);
}

// [[Rcpp::export]]
List mm_rcpp(NumericVector y, int p, int q)
{
    auto fit = robarma::estimators::mm(robarma::arma_model(as_eigen(y), p, q));
    return List::create(
        Named("phi") = to_numeric(fit.params.phi),
        Named("theta") = to_numeric(fit.params.theta),
        Named("mu") = fit.params.mu,
        Named("final_cost") = fit.result.final_cost,
        Named("converged") = fit.result.convergence);
}

// [[Rcpp::export]]
List bip_mm_rcpp(NumericVector y, int p, int q)
{
    auto fit = robarma::estimators::bip_mm(robarma::arma_model(as_eigen(y), p, q));
    return List::create(
        Named("phi") = to_numeric(fit.params.phi),
        Named("theta") = to_numeric(fit.params.theta),
        Named("mu") = fit.params.mu,
        Named("final_cost") = fit.result.final_cost,
        Named("converged") = fit.result.convergence);
}

// [[Rcpp::export]]
NumericVector simulate_rcpp(NumericVector phi, NumericVector theta, double mu, int n, int burn_in = 100, int seed = 0)
{
    Eigen::VectorXd result = robarma::simulate(as_eigen(phi), as_eigen(theta), mu, n, Eigen::VectorXd{}, burn_in, seed);
    return to_numeric(result);
}
