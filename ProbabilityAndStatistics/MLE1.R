# OLS likelihood function
ols.lf1 <- function(theta, y, X) {
  beta <- theta[-1]
  sigma2 <- theta[1]
  if (sigma2 <= 0) return(NA)
  n <- nrow(X)
  e <- y - X%*%beta
  log1 <- ((-n/2)*log(2*pi)) - ((n/2)*log(sigma2)) - ((t(e)%*%e)/(2*sigma2))
  return(-log1)
}