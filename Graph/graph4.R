# 1. 主要学习polygon函数的用法
# 这个函数可以圈定需要的区域
years <- 1950:2000
timeseries <- cumsum(c(100, runif(50)*5))
hilo <- range(timeseries)
# 先有一个plot 后面才能用polygon
plot(years, timeseries, type = "l", lwd = 3)
# 圈定给定的区域
polygon(x=c(1960,1960,1965,1965),
        y=c(hilo, rev(hilo)),
        density=NA, 
        col="orange", 
        border=NA)
# 再画一次实线 目的是让实线在上面显示
lines(years, timeseries, type = "l", lwd = 3)
