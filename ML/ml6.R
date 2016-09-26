#################################################################
# http://michael.hahsler.net/research/arules_RUG_2015/demo/
# 关联挖掘可视化 结合Google Map
#################################################################
if(! "ggmap" %in% installed.packages()) install.packages("ggmap", depend = TRUE)
library(ggplot2)
library(ggmap)
NYC <- get_map("New York City", zoom = 11)
# 这个受限于GFW 无法正常访问Google Map
