data <- read.csv(file.choose())

data$Choose.your.gender <- as.factor(data$Choose.your.gender)
data$Do.you.have.Depression. <- as.factor(data$Do.you.have.Depression.)

result <- aov(
  Age ~ Choose.your.gender * Do.you.have.Depression.,
  data = data
)

summary(result)

interaction.plot(
  x.factor = data$Choose.your.gender,
  trace.factor = data$Do.you.have.Depression.,
  response = data$Age,
  xlab = "Gender",
  ylab = "Mean Age",
  trace.label = "Depression Status",
  col = c("blue", "red"),
  lwd = 2,
  type = "b"
)
