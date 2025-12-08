# ==============================================================================
# R Script: Generating Basic Summaries 
# Functions: str() and summary() 
# Dataset: Wine Quality (Red Wine)
# ==============================================================================


# ==============================================================================
# 1. SETUP: Load Wine Dataset
# ==============================================================================

# NOTE: Use file.choose() if the CSV is not in your working directory
# wine_df <- read.csv(file.choose())

wine_df <- read.csv("D:/S076/winequality-red.csv")   # <-- Use correct path or file.choose()

print("--- Wine Data Loaded ---")


# ==============================================================================
# 2. USING str() (Structure)
# ==============================================================================

# Purpose: Compactly display the internal structure of the R object.
# What it tells you:
# - The class (data.frame)
# - Number of observations (rows) and variables (columns)
# - The Data Type of each column (num, int, chr)
# - The first few values

print("--- OUTPUT OF str() ---")
str(wine_df)


# ==============================================================================
# 3. USING summary() (Statistical Summary)
# ==============================================================================

# Purpose: detailed summary statistics for each column.
# What it tells you:
# - Numeric Cols: Min, 1st Qu, Median, Mean, 3rd Qu, Max
# - Integer Cols: Same statistical summary
# - Character Cols: Length and Class

print("--- OUTPUT OF summary() [Original Data] ---")
summary(wine_df)


# ==============================================================================
# 4. IMPROVING summary() WITH FACTORS
# ==============================================================================

# 'quality' is often treated as a categorical variable
# Converting it to factor shows counts per quality score

wine_df$quality <- as.factor(wine_df$quality)

print("--- OUTPUT OF summary() [After Factor Conversion] ---")
summary(wine_df)


# ==============================================================================
# 5. Accessing Specific Summaries
# ==============================================================================

# Sometimes you want only particular metrics, not the whole summary block.

avg_alcohol <- mean(wine_df$alcohol)
max_sulphates <- max(wine_df$sulphates)

print(paste("Average Alcohol:", avg_alcohol))
print(paste("Highest Sulphates:", max_sulphates))

