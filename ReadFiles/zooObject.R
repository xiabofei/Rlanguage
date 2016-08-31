# 1. zoo这个包当时专门为了处理daily的finacial data
# 2. 有处理时间序列数据相关的需求 可以再具体去查zoo包的用法
# http://ftp.auckland.ac.nz/software/CRAN/doc/vignettes/zoo/zoo-quickref.pdf
A <- data.frame(date=c("1995-01-01", "1995-01-02", "1995-01-03", "1995-01-06"),
                x=runif(4),
                y=runif(4))
A$date <- as.Date(A$date)

# 构建一个zoo的object matrix
library(zoo)
B <- A
B$date <- NULL
z <- zoo(as.matrix(B), order.by = A$date)
rm(A, B)

C <- coredata(z)
rownames(C) <- as.character(time(z))
str(C)
str(z)