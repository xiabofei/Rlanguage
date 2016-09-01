# 1. R中读取Microsoft Excel的.xls格式的文件
library(gdata)
a <- read.xls("file.xlsx", sheet = 2)