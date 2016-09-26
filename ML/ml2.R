dataset = read.csv("haberman.csv", header = FALSE)
# 散点图
# plot(dataset[,1], dataset[,3], main = "Scatterplot", xlab = "Age", ylab = "Number of Nodes", pch=20)
# 频率直方图
# hist(dataset[,2], main = "Histogram", xlab = "Year", ylab = "Count")
# box图
# boxplot(dataset[,1], main = "Boxplot", xlab = "Age")
x1 <- dataset[,1]
x2 <- dataset[,2]
y <- dataset[,4]
lm_model <- lm(y ~ x1 + x2, data = as.data.frame(cbind(y, x1, x2)))
summary(lm_model)