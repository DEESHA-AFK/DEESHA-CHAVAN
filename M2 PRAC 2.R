# Load the CSV file
sales_data <- read.csv("D:/S076/sales_data.csv", header = TRUE)

# Frequency table using table()
table(sales_data$Region)

# Frequency table using count()
library(dplyr)
sales_data %>% count(Region)
