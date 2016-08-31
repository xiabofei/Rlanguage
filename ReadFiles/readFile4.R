# 1. 将R的object改造用于传输
set.seed(101)
A = data.frame(x1=runif(10), x2=runif(10), x3=runif(10))
print(A)

# 将A存为binary file
save(A, file = "/tmp/my_data_file.rda")
load("/tmp/my_data_file.rda")

dput(A)
