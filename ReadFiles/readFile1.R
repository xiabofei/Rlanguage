# 1. 读一个本地文件 作为table读进来
# 2. 有几个函数和package可以提供数据描述功能
A <- read.table("x1.data", sep = ",", col.names = c("year","my1","my2"))
nrow(A)
# 进行总结
summary(A$year)
# 构造一个新的列
A$newcol <- A$my1 + A$my2
newvar <- A$my1 + A$my2
# 将原有的列置空
A$my1 <- NULL

# 下面这几个命令有助于看数据的整体描述情况
str(A)
summary(A)
library(Hmisc)
contents(A)
describe(A)
