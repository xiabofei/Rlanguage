# 1. 频率直方图不同区间显示不同的颜色
x <- rnorm(1000)
hx <- hist(x, breaks = 100, plot = FALSE)
plot(hx, col = ifelse(abs(hx$breaks)<1.699, 4, 2))