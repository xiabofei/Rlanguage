# 1. 处理设计date形式的数据
A <- read.table("x2.data", sep = ",", col.names = c("date", "my1", "my2"))
# A$date <- as.Date(A$date, format = "%Y-%m-%d")
A$newcol <- A$my1 + A$my2
newvar <- A$my1 - A$my2
A$my1 <- NULL
summary(A)