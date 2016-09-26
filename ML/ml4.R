#######################################################
# http://michael.hahsler.net/research/arules_RUG_2015/demo/
# 数据归一化 & 作图
# 
#######################################################
# 加载clean数据
load("SQF_clean.rda")
# 逐步做数据分布比较
oldpar <- par("mar" = c(6,4,4,2)+0.1) # 就当成一种与device有关的参数
barplot(table(dat$city), ylab = "Number of Stops", las = 3)
par(oldpar)
pop <- c('Manhattan' =1626159, 'Brooklyn' = 2592149, 'Bronx' = 1418733,
         'Queens' =2296175, 'Staten Island'=472621)
oldpar <- par("mar" = c(6,4,4,2)+.1)
barplot(table(dat$city)/pop*100, ylab="Stops in % of Population",
        las=3, ylim=c(0,10))

par(oldpar)
tbl <- table(dat$race)
names(tbl) <- abbreviate(names(tbl), 8)
barplot(tbl, ylab="Number of Stops", las=3)

pop <- c(White=44.6, Black=25.1, Hispanic=27.5, Other=11.8)
sum(pop)
# 数据项归一化方法
pop <- pop/sum(pop)
tbl <- table(dat$race)
# 数据项重命名
tbl <- c(tbl["White"], tbl["Black"],
         tbl["White Hispanic"]+tbl["Black Hispanic"],
         tbl["Asian/Pacific Islander"]+tbl["Am. Indian/ Native Alaskan"])
names(tbl) <- c("White", "Black", "Hispanic", "Other")
tbl <- tbl/sum(tbl)
# 通过下面这个例子 可以熟悉画对比直方图的方法
barplot((rbind(pop, tbl)*100), beside = TRUE, ylab="Proportion [%]",
        col=gray.colors(2), ylim=c(0,70), main = "Stops in NYC")
legend(x = "topright", legend = c("Population", "Stops"),
       fill=gray.colors(2), bty="n")