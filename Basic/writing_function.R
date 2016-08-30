## 1. R中函数定义
## 2. 函数返多个值

# 展示如何写一个函数
X = list(height=5.4, weight=54)
print("Use default printing --")
print(X)
print("Accessing individual elements --")
cat("Your height is ", X$height, " and your weight is ", X$weight, "\n")

square <- function(x){
  return(x*x)
}
cat("The square of 3 is ", square(3), "\n")

cube <- function(x=5){
  return(x*x*x);
}

cat("Calling cube with 2 : ", cube(2), "\n")
cat("Calling cube        : ", cube(), "\n")
powers <- function(x){
  parcel = list(x2=x*x, x3=x*x*x, x4=x*x*x*x);
  return(parcel);
}

X = powers(3)
print("Showing powers of 3 --")
print(X)

powerful <- function(x){
  return(list(x2=x*x, x3=x*x*x, x4=x*x*x*x));
}
print("Showing powers of 3 --")
print(powerful(3))

# R函数中 最后一个expression自动作为返回函数
powerful <- function(x) {
  list(x2=x*x, x3=x*x*x, x4=x*x*x*x)
}
print(powerful(4))
