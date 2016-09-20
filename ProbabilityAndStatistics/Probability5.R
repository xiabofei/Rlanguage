library(boot)

samplemedian <- function(x,d){
  return(median(x[d]))
}

data <- rnorm(50)
# data是原始数据
# samplemedian是一个计算统计量的函数
#   第一个参数是原始数据
#   第二个参数是数据的频数 或 权重 (猜测这个参数代表的默认权重相等)
b <- boot(data, samplemedian, R=2000)
cat("Sample median has a sigma of ", sd(b$t[,1]), "\n")
plot(b)

boot.ci(b, conf = 0.99, type = "basic")
