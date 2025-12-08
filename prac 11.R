# ============================================================================
# R Script: Reshaping Data using pivot_longer() and pivot_wider()
# Dataset: winequality_red (your CSV)
# ============================================================================

library(dplyr)
library(tidyr)

# ============================================================================
# 1. Load your dataset
# ============================================================================

# Your dataset is already loaded as winequality_red
df <- winequality_red %>%
  mutate(RowID = row_number()) %>%   # Important: ID for pivoting
  select(RowID, fixed_acidity, volatile_acidity, citric_acid,
         residual_sugar, chlorides, alcohol, quality)

print("--- 1. Original Wide Data ---")
print(head(df))

# ============================================================================
# 2. PIVOT_LONGER (Wide → Long)
# ============================================================================

# Example: Stack chemical measures into one column
long_df <- df %>%
  pivot_longer(
    cols = c(fixed_acidity, volatile_acidity, citric_acid, residual_sugar),
    names_to = "Chemical",
    values_to = "Value"
  )

print("--- 2. Long Format (pivot_longer) ---")
print(head(long_df))

# ============================================================================
# 3. PIVOT_WIDER (Long → Wide)
# ============================================================================

wide_df <- long_df %>%
  pivot_wider(
    names_from = Chemical,
    values_from = Value
  )

print("--- 3. Wide Format (Back to Original) ---")
print(head(wide_df))

# ============================================================================
# 4. ADVANCED EXAMPLE:
# Spread QUALITY levels as columns and display alcohol values
# ============================================================================

quality_pivot <- df %>%
  select(RowID, quality, alcohol) %>%
  pivot_wider(
    names_from = quality,   # quality levels (3,4,5,6,7,8)
    values_from = alcohol
  )

print("--- 4. Quality Pivot (Alcohol by Quality) ---")
print(head(quality_pivot))
