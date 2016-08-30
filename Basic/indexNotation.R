## 1. vector和matrix的切片操作
## 2. 通过boolean类型对vector和matrix特定位置的元素操作
x <- c(2,7,9,2,NA,5)
# x的元素1到3
x[1:3]
# 除了第一个元素外其他元素
x[-1]
# 提取奇数元素
indexes <- seq(1,6,2)
x[indexes]
# 通过boolean型提取元素
require <- c(TRUE,TRUE,FALSE,FALSE,FALSE,FALSE)
x[require]
# 判断是否是NA
is.na(x)
# 将缺失值替代为0
x[is.na(x)] <- 0
x
# vector转换成matrix的方法
y <- matrix(c(2,7,9,2,NA,5),nrow = 2)
y
# 提取矩阵列
y[,c(1,3)]
is.na(y)
# 转换成字符串 可能方便存储?
str(is.na(y))
# 
y[is.na(y)] <- -1
y