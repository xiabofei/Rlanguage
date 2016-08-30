# 向量化输出
cat("example 1: sin(x) for a vector --\n")
x = c(0.1, 0.6, 1.0, 1.5)
print(sin(x))

# 构造一个N*M的矩阵 求每一列的均值
N=4
M=100
# R中像runif这样的分布生成函数比较方便
r = matrix(runif(N*M), N, M)
# 方法1
mean1 = numeric(M)
for (i in 1:M) {
  mean1[i] = mean(r[,i])
}
# 方法2(R风格的方法)
# 记住R有这么一个优化列均值的方法
mean2 = rep(1/N, N) %*% r

# 对比方法1和方法2的结果
all.equal(mean1, mean2[,])

# 这部分强调的主要内容是尽量用vector的操作代替循环操作




