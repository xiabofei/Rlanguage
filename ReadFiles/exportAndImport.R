# 1. 熟悉R支持的各种import和export数据格式
A <- data.frame(
  name=c("a","b","c"),
  ownership=c("Case 1","Case 1","Case 2"),
  listed.at=c("NSE",NA,"BSE"),
  # Firm "b" is unlisted.
  is.listed=c(TRUE,FALSE,TRUE),
  # R convention - boolean variables are named "is.something"
  x=c(2.2,3.3,4.4),
  date=as.Date(c("2004-04-04","2005-05-05","2006-06-06"))
)
# 以csv格式的文件
write.table(A,file="demo.csv",sep = ",",col.names = NA,qmethod = "double")
B <- read.table("demo.csv", header = TRUE, sep = ",", row.names = 1)
# 以binary格式的文件
save(A, file = "demo.rda")
load("demo.rda")
# 以xml标准格式
library(StatDataML)
writeSDML(A, "/tmp/demo.sdml")
B <- readSDML("/tmp/demo.sdml")
# 以Stata的格式
library(foreign)
write.dta(A, "/tmp/demo.dta")
B <- read.dta("/tmp/demo.dta")
