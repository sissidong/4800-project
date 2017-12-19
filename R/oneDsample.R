#' what is the function does: Single Variable Rejection Sampling
#'
#' This function implements single variabel rejection sampling for rvs with bounded support and which have have bounded pdf.
#'
#'
#' @param f the pdf that we are sampling from
#' @param N the nimber of attempted samples.
#' @param lb lower bound of support of f
#' @param ub upper bound of support of f
#' @param maxf the maximum value of the given function f
#'
#' @return A vector containing samples from pdf
#' @export
#'
#' @examples
#'
#'

oneDsample <- function(f, N, lb, ub, maxf) {
  ones <- runif(N, lb, ub)
  unis <- runif(N, 0, maxf)
  ones[unis < f(ones)]
}
