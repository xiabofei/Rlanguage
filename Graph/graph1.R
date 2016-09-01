# 1. R中一些画图的常用函数
# 定制画板的layout
# 
par(mfrow=c(2,2))

# 第一个图
plot(density(runif(10)),lwd=2)∑
text(x=0, y=0.2,"100 uniforms")
abline(h=0, v=1) # 横纵坐标定位点
x=seq(0.01, 1, 0.01)
par(col="blue")
# 第二个图
plot(x, sin(x), type = "l")
lines(x, cos(x), type = "l", col = "red")
# 第三个图
plot(x, exp(x), type = "l", col = "green")
lines(x ,log(x), type = "l", col = "orange")
# 第四个图
plot(x, tan(x), type = "l", lwd=3, col = "yellow")