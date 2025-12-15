# Load dataset
sales_data <- read.csv("D:/S076/sales_data.csv", header = TRUE)

# One-sample t-test
t.test(sales_data$Sales_Amount, mu = 5000)
