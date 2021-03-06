% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/oneDsample.R
\name{oneDsample}
\alias{oneDsample}
\title{Single variable Rejection Sampling}
\usage{
oneDsample(f, N = 50000, lb = Inf, ub = Inf, method = "best")
}
\arguments{
\item{f}{The pdf that we are sampling from}

\item{N}{The number of attempted samples.  Default value is 50000.}

\item{lb}{lower bound of support of f.      Default value is Inf.}

\item{ub}{upper bound of support of f.      Default value is Inf.}

\item{method}{There are three method you can choose, 'norm', 't' or 'unif'.
Defalt method will be the best method we select for your pdf}
}
\value{
A vector containing samples from pdf (including NA)
        ggplot of original function(red) and simulation density function
        histogram of simulation density function
}
\description{
This function 'oneDsample(f,N,lb,up,method)' implements single variable rejection sampling for continuous rvs with or without bounded support.
Additionally, the function 'oneDsampleplot()' and 'oneDsamplehist()' shows the plot of original function and simulation density function.
}
\examples{

f<- function(x) {ifelse(-1< x & x < 0, 2*(x+1), 0)}
oneDsampleplot(oneDsample(f,20000,-1,0,method='unif'))

f<- function(x) dlnorm(x,mean=0,sdlog=1)
oneDsampleplot(oneDsample(f,50000,'norm'))

f<- function(x) dnorm(x,-10,2)
oneDsampleplot(oneDsample(f,method='t'))

f = function(x) {ifelse(0 <= x & x <= 2*pi ,1/2/pi *(sin(x) + 1),0)}
oneDsampleplot(oneDsample(f,50000,0,2*pi))


}
