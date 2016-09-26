############################################################
# http://michael.hahsler.net/research/arules_RUG_2015/demo/
# 多维数据的关联挖掘部分
############################################################
library(Matrix)
library(arules)
library(grid)
library(arulesViz)

load("SFQ_clean.rda")

# 引入部分数据列
d <- dat[,
  c(
    grep("rf_", colnames(dat), value = TRUE),
    grep("cs_", colnames(dat), value = TRUE),
    grep("ac_", colnames(dat), value = TRUE),
    grep("pf_", colnames(dat), value = TRUE),
    "arstmade", "sumissue", "detailcm", "race",
    "pct",
    "typeofid", "othpers"
  )
]
## 枚举变量的二值化打散方法
# 1. 通过"性别"这个变量 学习打散二值变量的方法 
d$female <- dat$sex == "female"
# 2. weapon是多类的枚举类型变量 灵活的打散方法
d$weapon <- dat$pistol | dat$riflshot | dat$asltweap |
  dat$knifcuti | dat$machgun | dat$othrweap
d$no_uniform <- !dat$offunif
# 3. 直接处理打散
d$inside <- dat$inout == "inside"
d$trhsloc <- dat$trhsloc
d$trhsloc[dat$trhsloc == "neither"] <- NA
## 连续变量离散化
d$minor <- dat$age<18 # 按阈值将连续变量二值化
d$height <- discretize(dat$height, method = "frequency", categories = 3) # 按频率打散

## 先将数据打散 再画图查看频率图 
# 转换为arules中特有的transactions类
trans <- as(d, "transactions")
itemLabels(trans)
as(trans[1:2, 1:10], "matrix")
itemFrequencyPlot(trans, topN=50, cex.names=.5)
# 统计items之间的相似度
d <- dissimilarity(sample(trans, 5000), method = "phi", which = "items")
d[is.na(d)] <- -1 # get rid of missing value
pdf(file = "similarity.pdf", width = 25)
plot(hclust(d), cex=.5)
dev.off()
