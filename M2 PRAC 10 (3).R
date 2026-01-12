range_data <- wine %>%
  group_by(quality) %>%
  summarise(
    min_alcohol = min(alcohol),
    max_alcohol = max(alcohol)
  )

ggplot(range_data, aes(x = quality)) +
  geom_linerange(
    aes(ymin = min_alcohol, ymax = max_alcohol),
    color = "darkgreen",
    size = 1.2
  ) +
  labs(
    title = "High–Low Chart of Alcohol by Quality",
    x = "Quality",
    y = "Alcohol"
  ) +
  theme_minimal()
d