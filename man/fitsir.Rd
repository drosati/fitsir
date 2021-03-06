% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/fitSIR_funs.R
\name{fitsir}
\alias{fitsir}
\title{fitting function}
\usage{
fitsir(data, method = "Nelder-Mead", control = list(maxit = 1e+05),
  start = startfun(), debug = FALSE)
}
\arguments{
\item{data}{data frame with columns \code{tvec} and \code{count}}

\item{method}{optimization method}

\item{control}{control parameters for optimization}

\item{start}{starting parameters}

\item{debug}{print debugging output?}
}
\description{
fitting function
}
\examples{
library("bbmle") ## needed at present for coef()
bombay2 <- setNames(bombay,c("tvec","count"))
## use default starting values
(f1 <- fitsir(bombay2))  ## NOT a good fit
ss <- SIR.detsim(bombay2$tvec,trans.pars(coef(f1)))
cc <- bombay2$count
goodcoef <- c(log.beta=2.506739,log.gamma=2.475908,
              log.N=14.436240,logit.i=-12.782353)
ss2 <- SIR.detsim(bombay2$tvec,trans.pars(goodcoef))
plot(count~tvec,data=bombay2)
lines(bombay2$tvec,ss)
lines(bombay2$tvec,ss2,col=2)
## CRUDE R^2 analogue (don't trust it too far! only works if obs always>0)
mean((1-ss/cc)^2)
mean((1-ss2/cc)^2)
}

