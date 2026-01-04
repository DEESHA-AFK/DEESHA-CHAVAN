bikes$temp_group <- cut(
  bikes$temperature,
  breaks = quantile(bikes$temperature, probs = c(0, 0.33, 0.66, 1)),
  labels = c("Low", "Medium", "High"),
  include.lowest = TRUE
)

bikes$temp_group <- as.factor(bikes$temp_group)

anova_model <- aov(count ~ temp_group, data = bikes)

summary(anova_model)

shapiro.test(residuals(anova_model))

bartlett.test(count ~ temp_group, data = bikes)

TukeyHSD(anova_model)

aggregate(count ~ temp_group, data = bikes, mean)

boxplot(count ~ temp_group,
        data = bikes,
        xlab = "Temperature Group",
        ylab = "Bike Rental Count")
