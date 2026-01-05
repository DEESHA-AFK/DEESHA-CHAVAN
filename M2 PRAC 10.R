library(ggplot2)

wine <- read.csv(file.choose())

ggplot(wine, aes(x = factor(quality))) +
  geom_bar(fill = "steelblue") +
  labs(
    title = "Wine Quality Distribution",
    x = "Wine Quality",
    y = "Count"
  )
