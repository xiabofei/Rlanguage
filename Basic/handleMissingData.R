# 1. 用R处理缺失数据的方法
# 构造两套价格数据 在一套价格数据的基础上加入扰动 形成另一套数据
e1 <- runif(15)
e2 <- e1 + 0.05*rnorm(15)
cbind(e1, e2)
# 将e1和e2中几个数据随机置为空
e1[sample(1:15,5)] <- NA
e2[sample(1:15,5)] <- NA
cbind(e1, e2)
# 缺失数据融合技巧
combined <- e1
missing <- is.na(combined)
combined[missing] <- e2[missing]
cbind(e1, e2, combined)

