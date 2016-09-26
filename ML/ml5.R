###############################################################
# http://michael.hahsler.net/research/arules_RUG_2015/demo/
# 关联关系可视化探索
###############################################################
if(! "vcd" %in% installed.packages()) install.packages("vcd", depend = TRUE)
# 加载包
library(grid)
library(vcd)
# 图形化关联关系
assoc(~ sex + race, data = dat, shade=TRUE, abbreviate_labs=6, varnames=FALSE)
assoc(~ dat$sex + dat$forceuse, data=dat, shade=TRUE,
      labeling_args = list(rot_labels = c(25, 90, 0, 90), varnames=FALSE))
assoc(~ dat$arstmade + dat$sex, data = dat, shade = TRUE, varnames=FALSE)
assoc(~ dat$arstmade + dat$race, data = dat, shade=TRUE, abbreviate_labs=6)
