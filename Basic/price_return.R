ranrw <- function(mu, sigma, p0=100, T=100){
  cumprod(c(p0, 1 + (rnorm(n=T, mean = mu, sd = sigma)/100)))
}
price2returns <- function(x){
  100*diff(log(x))
}
returns2prices <- function(r, p0=100){
  c(p0, p0*exp(cumsum(r/100)))
}

cat("Simulate 25 points from a random walk starting at 1500 --\n")
p <- ranrw(0.05, 1.4, 1500, 25)
print(p)

cat("Convert to returns--\n")
r <- price2returns(p)
print(r)

cat("Go back from returns to prices --\n")
goback <- returns2prices(r, 1500)
print(goback)

plot(density(r))
acf(r)
