# 关联规则挖掘的tutorial
# http://michael.hahsler.net/research/arules_RUG_2015/demo/
############################################################
# 比较复杂的数据预处理过程
############################################################
if(!file.exists("SQF 2012.csv")) {
  download.file("http://www.nyclu.org/files/stopandfrisk/Stop-and-Frisk-2012.zip",
                "Stop-and-Frisk-2012.zip")
  unzip("Stop-and-Frisk-2012.zip")
}
# 导入数据
dat <- read.csv("SQF 2012.csv")
dim(dat)
## 数据清洗
# 数据格式转换
dat$datestop <- as.Date(sprintf("%08d", dat$datestop), format = "%m%d%Y")
dat$timestop <- as.integer(substr(sprintf("%04d", dat$timestop),1 ,2))
# 连续数据处理
dat$perobs[ dat$perobs<1 | dat$perobs>120 ] <- NA
head(dat$perstop)
dat$perstop[dat$perstop == "**"] <- NA
dat$perstop <- as.numeric(dat$perstop)
dat$dob <- NULL
# 通过age这个字段去学习数据处理
# 1. 用hist频率直方图去大概看一下数据分布(或者boxplot也可以)
hist(dat$age)
# 2. 发现数据质量比较差, 再用table去看具体的频率取值分布
table(dat$age)
# 3. 去除不正常数据
dat$age[dat$age<10 | dat$age>90] <- NA
# 4. 再用频率直方图去验证, 结果OK
hist(dat$age, breaks = 30)
# clean height字段
table(dat$height)
barplot(table(dat$height))
dat$height[dat$height<40 | dat$height>90] <- NA
hist(dat$height, breaks = 40)
# clean weight字段
table(dat$weight)
barplot(table(dat$weight))
dat$weight[dat$weight<50 | dat$weight>400] <- NA
hist(dat$weight, breaks = 40)
# 可以用?vector查看 将里连续数字编码快速转换为符号编码值
# tips: 注意编码的起始数字是0还是1
dat$city <- factor(dat$city, labels = c("Manhattan", "Brooklyn", "Bronx", "Queens", "Staten Island"))
dat$race <- factor(dat$race, labels=c("Black", "Black Hispanic",
                                      "White Hispanic", "White", "Asian/Pacific Islander",
                                      "Am. Indian/ Native Alaskan"))
dat$sex <- factor(dat$sex+1L, label=c("female", "male"))
dat$build <- factor(dat$build, labels=c("heavy", "muscular",
                                        "medium", "thin"))
dat$forceuse <- factor(dat$forceuse, labels =c("defense of other",
                                               "defense of self", "overcome resistence", "other",
                                               "suspected flight", "suspected weapon"))
dat$inout <- factor(dat$inout+1L, labels=c("outside", "inside"))
dat$trhsloc <- factor(dat$trhsloc+1L, labels=c("neither",
                                               "housing authority", "transit authority"))
crimecodes <- read.csv("crimecodes.csv", header = FALSE)
dat$detailcm <- factor(dat$detailcm, levels= crimecodes[,1],
                       labels=crimecodes[,2])
dat$pct <- as.factor(dat$pct) # use names instead?
dat$addrpct <- as.factor(dat$addrpct)
dat$sector <- as.factor(dat$sector)
dat$typeofid <- factor(dat$typeofid,
                       labels=c("photo id", "verbal id", "refused to provide id", "unknown"))
dat$repcmd <- as.factor(dat$repcmd)
dat$revcmd <- as.factor(dat$revcmd)
# 将二值变量转换为逻辑变量
# 1. 根据命名规则去改逻辑变量
for(b in grep("cs_", colnames(dat), value=TRUE)) dat[[b]] <- as.logical(dat[[b]])
for(b in grep("rf_", colnames(dat), value=TRUE)) dat[[b]] <- as.logical(dat[[b]])
for(b in grep("sb_", colnames(dat), value=TRUE)) dat[[b]] <- as.logical(dat[[b]])
for(b in grep("ac_", colnames(dat), value=TRUE)) dat[[b]] <- as.logical(dat[[b]])
for(b in grep("pf_", colnames(dat), value=TRUE)) dat[[b]] <- as.logical(dat[[b]])
# 2. 硬改为逻辑变量
dat$othpers <- as.logical(dat$othpers)
dat$explnstp <- as.logical(dat$explnstp)
dat$offunif <- as.logical(dat$offunif)
dat$offverb <- as.logical(dat$offverb)
dat$offverb[dat$offunif] <- NA
dat$officrid <- as.logical(dat$officrid)
dat$officrid[dat$offunif] <- NA
dat$offshld <- as.logical(dat$offshld)
dat$offshld[dat$offunif] <- NA
dat$radio <- as.logical(dat$radio)
# 除去无效数据
dat$year <- NULL # we only have 2012
dat$haircolr <- NULL
dat$eyecolor <- NULL
dat$ser_num <- NULL
dat$othfeatr <- NULL
dat$arstoffn <- NULL
dat$crimsusp <- NULL
dat$premname <- NULL
dat$addrnum <- NULL
dat$stname <- NULL
dat$stinter <- NULL
dat$ crossst <- NULL
dat$beat <- NULL
dat$post <- NULL
dat$recstat <- NULL
dat$linecm <- NULL

save(dat, file = "SQF_clean.rda")
