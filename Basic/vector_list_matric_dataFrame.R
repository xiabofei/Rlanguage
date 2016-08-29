x <- c(2,3,7,9)
y <- c(9,7,3,2)
year <- 1990:1993
names <- c("payal", "shraddha", "kritika", "itida")
y[1]
y[length(y)]
person <- list(name="payal", x=2, y=9, year=1990)
person
person$name
cbind(year, x, y)
D <- data.frame(names, year, x, y)
nrow(D)
D$names
D$names[nrow(D)]
D$names[length(D$names)]
