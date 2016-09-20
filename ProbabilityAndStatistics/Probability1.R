# 1. 数据概率分布(边缘分布,联合概率分布等)
# 2. table是个非常实用的函数
# 3. 枚举类型的采样技巧: 
#    如果要采样像"性别"这样的枚举类型数据, 可以用数字先去sample, 然后再调用
#    factor函数将数字编码成具体的意义的值
N = 15
set.seed(102)
x <- sample(1:3, N, replace = TRUE)
# 将x编码
# 比如1对应"None", 2对应"School", 3对应"College"
education <- factor(x, labels = c("None", "School", "College"))
x <- sample(1:2, N, replace = TRUE) # replace为TRUE表示可以重复采样
gender <- factor(x, labels = c("Male", "Female"))
age <- runif(N, min = 20, max = 60)
# 将数据构造成data.frame
D <- data.frame(age, gender, education)
rm(x, age, gender, education)
print(D)
# table可以用于统计vector种不同元素的频数
table(D$education)
# table还可以统计联合频度
table(D$gender, D$education)
# 利用table统计联合概率分布
table(D$gender, D$education)/nrow(D)
# addmargins用于统计边缘概率分布
addmargins(table(D$gender, D$education))
addmargins(table(D$gender, D$education)/nrow(D))
# 分组统计量
# 例子1: 按性别统计不同组的均值
by(D$age, D$gender, mean)
# 例子2: 按性别统计不同组的标准差
by(D$age, D$gender, sd)
# 例子3: 按性别统计不同组的数据整体描述
by(D$age, D$gender, summary)

# 复杂一些的统计例子
# 联合统计量
a <- matrix(by(D$age, list(D$gender, D$education), mean), nrow = 2)
rownames(a) <- levels(D$gender)
colnames(a) <- levels(D$education)
print(a)
library(xtable)
print(xtable(a))
