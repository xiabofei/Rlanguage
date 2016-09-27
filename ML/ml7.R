############################################################
# http://michael.hahsler.net/research/arules_RUG_2015/demo/
# 多维数据的关联挖掘部分
# 关于apriori的部分, 参数参考下面这篇资料
# http://www.borgelt.net/doc/apriori/apriori.html#lift
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


## 看各类条件下的population的问题
# 看female这个类别下 各个feature的item frequency
trans_female <- subset(trans, items %in% "female")
itemFrequencyPlot(trans_female, topN=25, population=trans, cex.names=.5)
itemFrequencyPlot(trans_female, topN=25, population=trans, lift=TRUE, cex.names=.5)
# 看minor下面的population分布
trans_minor <- subset(trans, items %in% "minor")
itemFrequencyPlot(trans_minor, topN = 25, population = trans, lift=TRUE, cex.names=.5)


## 频繁项集挖掘
# stp1. 数据全集有多少行
nrow(trans)
# stp2. 频繁项中最低的共现次数
500/nrow(trans)
# stp3. 调用频繁项集函数
# 需要在parameter中喂进去一些参数
# 1) target : 关联挖掘的类型
# 2) supp : 能够被当成频繁项的最小共现频率
# 3) minlen maxlen : 频繁项集的大小长度
itemsets <- apriori(trans, parameter = list(target="frequent", supp=0.001, minlen=2, maxlen=4))
# 查看前10个最频繁出现的item
inspect(head(sort(itemsets),n=100))
# 这部分要想看懂 得搜一些背景知识
# http://www.borgelt.net/doc/apriori/apriori.html#lift
# 可以系统看懂各项apriori的指标
quality(itemsets)$lift <- interestMeasure(itemsets, measure = "lift", trans = trans)
inspect(head(sort(itemsets, by="lift"), n=10))
plot(head(sort(itemsets, by = "lift"), n=50), method = "graph", control=list(cex=.8))
# 除去一些有逻辑问题的数据项
trans <- trans[,-pmatch("rf_bulg", colnames(trans))]
itemsets <- apriori(trans, parameter = list(target = "frequent",
                                            supp=0.001, minlen = 2, maxlen=4))
quality(itemsets)$lift <- interestMeasure(itemsets, measure="lift", trans = trans)
inspect(head(sort(itemsets, by = "lift"), n=10))
plot(head(sort(itemsets, by = "lift"), n=50), method = "graph", control=list(cex=.8))
trans <- trans[,-pmatch("detailcm=CPW", colnames(trans))]
itemsets <- apriori(trans, parameter = list(target = "frequent",
                                            supp=0.001, minlen = 2, maxlen=4))
quality(itemsets)$lift <- interestMeasure(itemsets, measure="lift", trans = trans)
inspect(head(sort(itemsets, by = "lift"), n=10))

## 生成关联规则
# parameter中的target的默认值是rules (默认是挖掘规则)
# 前面硬给设置成了target=frequency (指定目标是挖掘共现频率和项目)
r <- apriori(trans, parameter = list(target="rules",supp=0.001, maxlen=4))
inspect(head(sort(r, by="lift"), n=10))


# lower support to 100 cases
100/nrow(trans)
r <- apriori(trans, parameter = list(supp=0.00019, maxlen=4))
inspect(head(sort(r, by="lift"), n=10))


# 针对已经挖掘出来的规则 提取female相关的rules
r_female <- subset(r, subset = items %in% "female")
r_female
inspect(head(sort(r_female, by="lift"), 10))
itemFrequencyPlot(items(r_female), topN=30, cex.names=.6)
plot(head(sort(r_female, by="lift"), 50),
     method="graph", control=list(cex=.7))
