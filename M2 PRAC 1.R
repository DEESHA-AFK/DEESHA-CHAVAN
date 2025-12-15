# Load the CSV file
sales_data <- read.csv("D:/S076/sales_data.csv")

# View dataset structure
str(sales_data)

# Descriptive statistics using summary()
summary(sales_data)

# Descriptive statistics using describe()
install.packages("psych")   # run only once
library(psych)
describe(sales_data)
