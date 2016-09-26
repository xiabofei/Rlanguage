for (i in 1:10) {
  if (i %% 2 == 0) {
      cat(paste(i, "is even.\n", seq=" "))
  }
}

cat("utf8 不识别中文")

