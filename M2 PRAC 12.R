setwd("D:/S076")

sales <- read.csv("sales_data.csv")

sales_numeric <- sales[, sapply(sales, is.numeric)]

cor_matrix <- cor(sales_numeric, use = "complete.obs")

install.packages("corrplot")
library(corrplot)

corrplot(
  cor_matrix,
  method = "shade",
  type = "upper",
  order = "hclust",
  tl.col = "black",
  tl.srt = 45
)
