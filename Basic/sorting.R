## 1. 排序且取下标的做法
D <- data.frame(x=c(1,2,3,1),y=c(7,19,2,2))
# order是降序排列, 返回的是vector的下标
indexs <- order(D$x)
D[indexs,]
# rev是取反
rev(c(1,2,3,4))
D[rev(order(D$y)),]
