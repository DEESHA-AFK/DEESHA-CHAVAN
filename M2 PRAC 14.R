data10 <- data[1:10, ]

data10$HighTip <- ifelse(data10$tip > 2, 1, 0)
model10 <- glm(HighTip ~ total_bill,
               data = data10,
               family = binomial)

data10_sorted <- data10[order(data10$total_bill), ]

plot(data10_sorted$total_bill,
     data10_sorted$HighTip,
     xlab = "Total Bill",
     ylab = "Probability of High Tip",
     main = "Logistic Regression using glm() (First 10 Values)",
     pch = 16)


lines(data10_sorted$total_bill,
      predict(model10, type = "response")[order(data10$total_bill)],
      lwd = 2)
