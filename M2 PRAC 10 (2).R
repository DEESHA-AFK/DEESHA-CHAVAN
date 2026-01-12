library(dplyr)

wine$alcohol_level <- ifelse(wine$alcohol >= 10, "High", "Low")

pie_data <- wine %>%
  count(alcohol_level)

ggplot(pie_data, aes(x = "", y = n, fill = alcohol_level)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y") +
  labs(
    title = "High vs Low Alcohol Wines",
    fill = "Alcohol Level"
  ) +
  theme_void()
