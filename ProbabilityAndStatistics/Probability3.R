# 加载原始数据
load(file = "demo.rda")
summary(firms)

# 看看数据的概况
plot(density(log(firms$mktcap)))
plot(firms$mktcap, firms$spread, type = "p", cex=.2, col = "blue", log = "xy",
     xlab = "Market cap (Min USD)", ylab = "Bid/offer spread (bps)")
m = lm(log(spread) ~ log(mktcap), firms)
summary(m)