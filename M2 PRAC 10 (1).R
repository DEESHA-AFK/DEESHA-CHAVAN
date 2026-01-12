library(ggplot2)

wine <- read.csv("winequality-red.csv")

head(wine)   # verify data loaded

ggplot(wine, aes(x = alcohol, y = quality)) +
  geom_point(color = "steelblue", size = 2) +
  labs(
    title = "Scatter Plot of Alcohol vs Wine Quality",
    x = "Alcohol",
    y = "Quality"
  ) +
  theme_minimal()
