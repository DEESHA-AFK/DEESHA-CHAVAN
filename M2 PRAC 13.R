setwd("D:/S076")
getwd()
data <- read.csv("space_missions1.csv")
data_clean <- na.omit(data[, c("Year", "Price")])
data10 <- data_clean[1:10, ]
model <- lm(Price ~ Year, data = data10)

summary(model)

plot(data10$Year, data10$Price,
     main = "Linear Regression using lm() (First 10 Valid Values)",
     xlab = "Year",
     ylab = "Mission Price")

abline(model)
