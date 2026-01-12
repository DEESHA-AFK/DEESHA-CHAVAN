library(ggplot2)

ggplot(data, aes(x = Sales_Amount)) +
  geom_histogram(bins = 10, fill = "skyblue", color = "black") +
  labs(
    title = "Histogram of Sales Amount",
    x = "Sales Amount",
    y = "Frequency"
  )

ggplot(data, aes(y = Sales_Amount)) +
  geom_boxplot(fill = "lightgreen") +
  labs(
    title = "Box Plot of Sales Amount",
    y = "Sales Amount"
  )

