# Load the CSV file
sales_data <- read.csv("D:/S076/sales_data.csv", header = TRUE)

# Select first 100 observations to form pairs
unit_cost  <- sales_data$Unit_Cost[1:100]
unit_price <- sales_data$Unit_Price[1:100]

# Perform paired t-test
t.test(unit_cost, unit_price, paired = TRUE)
