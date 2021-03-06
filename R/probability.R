#' Single variable Rejection Sampling
#'
#' This function 'prooneD(f,N,lb,up,vall,valu)' shows the probability of the given pdf (with one r.v.) the situation could be smaller than,
#' large than or between any range
#'
#'
#' @param f the pdf that we are sampling from
#' @param N the nimber of attempted samples.
#' @param lb lower bound of support of f
#' @param ub upper bound of support of f
#' @param vall  lower value, default is -Inf
#' @param valu  upper value, default is Inf
#'
#' @return  probability of given pdf (with one r.v.) and situation
#'
#' @export the probability o
#'
#' @examples
#'
#' f<- function(x) dnorm(x,-10,2)
#' prooneD(f,10000, Inf, Inf,vall=-10, valu=15)
#'
#' f<- function(x) {ifelse(-1< x & x < 0, 2*(x+1), 0)}
#' prooneD(f,10000, -1, 0,valu=-0.5)
#'
#'
prooneD<- function(f, N, lb, ub,vall=-Inf,valu=Inf) {
  if (abs(integrate(f,lb,ub)$val-1)>0.001){
    stop("Error: not a pdf.The area under the function you given should be 1")
  }
  else{
    if(lb!=Inf & ub!=Inf){
      maxf<-max(f(runif(10000,lb,ub)))+1
      sample<-data.frame(x = replicate(N, {sx <- runif(1, lb, ub);ifelse(runif(1,0,maxf) < f(sx), sx, NA)}))
    }
    else{
      if(lb==Inf & ub!=Inf){
        x<-rnorm(10000,ub,100)
        maxf<-max(f(x))
        a=x[which(f(x)==maxf)]
        if(maxf>0.5){sx <- runif(N, a-20 , ub)}
        else{sx <- rnorm(N*100, a, 100)}
      }
      else if(lb!=Inf & ub==Inf){
        x<-rnorm(10000,lb,100)
        maxf<-max(f(x))
        a=x[which(f(x)==maxf)]

        if(maxf>0.5){sx <- runif(N, lb , a+20)}
        else{sx <- rnorm(N*100, a, 100)}
      }
      else{
        x<-rnorm(10000,0,100)
        maxf<-max(f(x))
        a=x[which(f(x)==maxf)]
        if(maxf>0.5){sx <- runif(N, a-20 , a+20)}
        else{sx <- rnorm(N*100, a, 100)}
      }
      sample<-data.frame(x = {ifelse(runif(N*100,0,maxf+1) < f(sx), sx, NA)})
    }
    mean(sample$x < valu & sample$x > vall, na.rm = TRUE)
  }
}
