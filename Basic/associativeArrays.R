## 1.给已有的数据结构起别名
## 2.将数据转换格式表示
x <- c(2,3,7,9)
# 给x的每个元素打上label标签
names(x) <- c("kal","sho","sad","aja")
x["kal"] <- 12
x
# 对矩阵操作
m <- matrix(runif(10), nrow=5)
rownames(m) <- c("violet","indigo","blue","green","yellow")
colnames(m) <- c("Asia","Africa")
m

# R对象转换成latex或html时候用的
library(xtable)
xtable(m)

# 另一种存储的形式
D <- data.frame(m)
D
str(D)
D$Africa
