one.simulation <- function(N=100) {
  x <- runif(N)
  return(c(mean(x), median(x)))
}

# Simulation
# 随机产生100000组正太分布的数据的统计量(均值,中位数)
results <- replicate(100000, one.simulation(20))

k1 <- density(results[1,])
k2 <- density(results[2,])

# x是原来的数据点
# y是拟合出来的概率密度函数
xrange <- range(k1$x, k2$x)
plot(k1$x, k2$y, xlim=xrange, type="l", xlab="Estimated value", ylab="")

grid()
lines(k2$x, k2$y, col="red")
abline(v=0.5)

legend(x="topleft", bty="n",
       lty=c(1,1),
       col=c("black", "red"),
       legend=c("Mean", "Median"))
