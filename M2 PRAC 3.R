# Load the CSV file
sales_data <- read.csv("D:/S076/sales_data.csv", header = TRUE)

# Create two-way table using table()
table(sales_data$Region, sales_data$Sales_Channel)
