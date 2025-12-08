# ======================================================================
# R Script: Vertical Concatenation using rbind()
# Dataset: winequality_cleaned.csv   (your dataset)
# ======================================================================

library(dplyr)

# -------------------------------
# 1. Load Your Wine Dataset
# -------------------------------
wine <- read.csv("D:/S076/winequality_cleaned.csv")

cat("----- Original Wine Dataset -----\n")
print(head(wine))

# -------------------------------
# 2. CREATE A SECOND DATASET
#    (Simulating another batch of wine data)
# -------------------------------
# For demonstration, take first 5 rows as Batch A,
# last 5 rows as Batch B
batch_A <- wine[1:5, ]
batch_B <- wine[(nrow(wine) - 4):nrow(wine), ]

cat("----- Batch A -----\n")
print(batch_A)

cat("----- Batch B -----\n")
print(batch_B)

# -------------------------------
# 3. ENSURE COLUMN NAMES MATCH
# -------------------------------
colnames(batch_A)
colnames(batch_B)

# Both already match because both come from the same dataset

# -------------------------------
# 4. VERTICAL CONCATENATION
# -------------------------------
combined_wine <- rbind(batch_A, batch_B)

cat("----- Combined Dataset (A+B) -----\n")
print(combined_wine)

cat("\nTotal rows:", nrow(combined_wine))
list.files("D:/S076")