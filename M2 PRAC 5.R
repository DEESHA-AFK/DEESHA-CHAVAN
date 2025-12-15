# Load the CSV file
sales_data <- read.csv("D:/S076/sales_data.csv", header = TRUE)

# Check structure (optional but recommended)
str(sales_data)

# Independent two-sample t-test
# Comparing Sales_Amount between Online and Retail sales channels
t.test(Sales_Amount ~ Sales_Channel, data = sales_data)
