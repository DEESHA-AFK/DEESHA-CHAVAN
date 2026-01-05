# Create contingency table
data <- matrix(c(30, 20, 10, 40),
               nrow = 2,
               byrow = TRUE)

rownames(data) <- c("Male", "Female")
colnames(data) <- c("Like", "Dislike")

# Chi-square test of independence
chisq.test(data)

# Observed frequencies
observed <- c(40, 35, 25)

# Expected probabilities
expected_prob <- c(1/3, 1/3, 1/3)

# Goodness of fit test
chisq.test(observed, p = expected_prob)

# Create data matrix
data <- matrix(c(20, 30,
                 25, 35,
                 30, 40),
               nrow = 3,
               byrow = TRUE)

rownames(data) <- c("Group A", "Group B", "Group C")
colnames(data) <- c("Yes", "No")

# Chi-square test of homogeneity
chisq.test(data)

