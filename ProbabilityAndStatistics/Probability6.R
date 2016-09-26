# part 1 : vector的indices
x <- c(10,20,30,40,50)
d <- c(3,2,2)
x[d]
# part 2 data frame的indices
D = data.frame(x=seq(10, 50, 10), y=seq(500, 100, -100))
D
t(D) # 转置transpose
D[d,]
# part 3 boot在vector上的操作
samplemean <- function(x,d){
  return(mean(x[d]))
}
samplemedian <- function(x,d){
  return(median(x[d]))
}
library(boot)
b = boot(x, samplemedian, R=1000)
# part 4 boot在data frame上的操作
sdratio <- function(D, d){
  E = D[d,]
  return(sd(E$x)/sd(E$y))
}
x = runif(100)
y = 2*runif(100)
D = data.frame(x, y)
b = boot(D, sdratio, R=1000)
cat("Standard deviation of sdratio = ", sd(b$t[,1]), "\n")
ci = boot.ci(b, type = "basic")
cat("95% CI from ", ci$basic[1,4], " - ", ci$basic[1,5], "\n")
