# -------------------------------

# R Script: Read CSV from ZIP and Clean Data

# -------------------------------

library(readr)   # For read_csv
library(dplyr)   # For data manipulation
library(tidyr)   # For replace_na()

# Step 1: Specify zip file path (use forward slashes)

zip_file <- "D:/S076/global air pollution dataset.csv.zip"

# Step 2: List files inside the zip to check CSV name

unzip(zip_file, list = TRUE)

# Step 3: Read CSV directly from the zip

global_air <- read_csv(unz(zip_file, "global air pollution dataset.csv"))

# Quick view

head(global_air)
summary(global_air)

# Step 4a: Remove rows with missing values

global_air_no_na <- na.omit(global_air)
cat("Rows after removing NAs:", nrow(global_air_no_na), "\n")

# Step 4b: Replace missing values (example)

global_air_clean <- global_air %>%
  replace_na(list(
    Country = "Unknown",   # replace NA in character column
    Year = 0,              # replace NA in numeric column
    PM25 = 0               # replace NA in numeric column
    # Add more columns as needed
  ))

# Verify

cat("Total remaining NAs:", sum(is.na(global_air_clean)), "\n")
head(global_air_clean)
