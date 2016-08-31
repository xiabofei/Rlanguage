# 1. 文件读和写
# 2. ascii 和 binary两种格式有关读写操作的效率区别(binary在读取数据上效率很高)
cat("Time creation of dataset:\n")
system.time({B = data.frame(x1=runif(100000), x2=runif(1000000), x3=runif(100000))})

cat("Time writing an ascii file into dataset C:\n")
system.time(write.table(B, file = "/tmp/foo.csv", sep = ",", col.names = NA))

cat("Time reading an ascii file into dataset C:\n")
system.time({C=read.table("/tmp/foo.csv", header = TRUE, sep = ",", row.names = 1)})

cat("Time writing a binary file out of datase C:\n")
system.time({save(C, file = "/tmp/foo.binary")})

cat("Time reading a binary file + variablenames from /tmp/foo.binary:\n")
system.time({load("/tmp/foo.binary")})

summary(C)