# ======================================================================
# R Script: Identifying and Handling Duplicates
# Dataset: winequality_cleaned.csv (Your Dataset)
# ======================================================================

library(dplyr)

# -------------------------------
# 1. LOAD DATA
# -------------------------------
# Use file.choose() to avoid path errors
wine <- read.csv(file.choose())

cat("--- 1. Original Dataset ---\n")
print(head(wine))

# -------------------------------
# 2. IDENTIFY DUPLICATES
# -------------------------------
# A duplicate row = ALL columns are exactly the same

duplicates_report <- wine %>%
  group_by(across(everything())) %>%  # group by all columns
  count() %>%                         # count occurrences
  filter(n > 1)                       # keep rows that appear more than once

cat("--- 2. Duplicate Rows Found ---\n")
print(duplicates_report)

# -------------------------------
# 3. REMOVE EXACT DUPLICATES
# -------------------------------
# distinct() removes rows that are identical across ALL columns

clean_wine <- wine %>%
  distinct()

cat("--- 3. Dataset After Removing Exact Duplicates ---\n")
print(clean_wine)

cat("\nRows before:", nrow(wine))
cat("\nRows after removing duplicates:", nrow(clean_wine), "\n")

# -------------------------------
# 4. REMOVE DUPLICATES BASED ON SPECIFIC COLUMNS
# -------------------------------
# Example: Keep only unique rows based on alcohol value (first occurrence kept)

unique_alcohol <- wine %>%
  distinct(alcohol, .keep_all = TRUE)

cat("--- 4. Unique Alcohol Values (Using distinct on specific column) ---\n")
print(head(unique_alcohol))
