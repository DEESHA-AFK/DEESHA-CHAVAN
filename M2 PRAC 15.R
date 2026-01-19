tips <- read.csv("https://raw.githubusercontent.com/mwaskom/seaborn-data/master/tips.csv")
head(tips)
setwd("D:/S076")       # Set your working directory
data <- read.csv("space_missions1.csv")
data_clean <- na.omit(data[, c("Year", "Price")])  # Keep only Year and Price
data10 <- data_clean[1:10, ]                      # Take first 10 rows
model <- lm(Price ~ Year, data = data10)
summary(model)

plot(data10$Year, data10$Price,
     main = "Linear Regression using lm() (First 10 Values)",
     xlab = "Year",
     ylab = "Mission Price")
abline(model)
data10_tips <- tips[1:10, ]
data10_tips$HighTip <- ifelse(data10_tips$tip > 2, 1, 0)

model10 <- glm(HighTip ~ total_bill,
               data = data10_tips,
               family = binomial)

data10_tips_sorted <- data10_tips[order(data10_tips$total_bill), ]

plot(data10_tips_sorted$total_bill,
     data10_tips_sorted$HighTip,
     xlab = "Total Bill",
     ylab = "Probability of High Tip",
     main = "Logistic Regression using glm() (First 10 Values)",
     pch = 16)

lines(data10_tips_sorted$total_bill,
      predict(model10, type = "response")[order(data10_tips$total_bill)],
      lwd = 2)

write.csv(data10, "space_missions10.csv", row.names = FALSE)


write.csv(data10_tips, "tips10.csv", row.names = FALSE)
library(writexl)

write_xlsx(data10, "space_missions10.xlsx")
write_xlsx(data10_tips, "tips10.xlsx")


pdf("linear_regression_space_missions.pdf")
plot(data10$Year, data10$Price,
     main = "Linear Regression using lm() (First 10 Values)",
     xlab = "Year",
     ylab = "Mission Price")
abline(model)
dev.off()


pdf("logistic_regression_tips.pdf")
plot(data10_tips_sorted$total_bill,
     data10_tips_sorted$HighTip,
     xlab = "Total Bill",
     ylab = "Probability of High Tip",
     main = "Logistic Regression using glm() (First 10 Values)",
     pch = 16)
lines(data10_tips_sorted$total_bill,
      predict(model10, type = "response")[order(data10_tips$total_bill)],
      lwd = 2)
dev.off()

