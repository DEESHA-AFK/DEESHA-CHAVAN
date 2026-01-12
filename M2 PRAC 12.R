setwd("D:/S076")

sales <- read.csv("sales_data.csv")

print(sales)
str(sales)

sales_numeric <- sales[, sapply(sales, is.numeric)]

print(sales_numeric)

cor_matrix <- cor(sales_numeric)
print(cor_matrix)

cor_complete <- cor(sales_numeric, use = "complete.obs")
print(cor_complete)

cor_spearman <- cor(sales_numeric, method = "spearman")
print(cor_spearman)

cor_sales_profit <- cor(sales$Sales, sales$Profit, use = "complete.obs")
print(cor_sales_profit)
