# =====================================================
# PRACTICAL 6: Merge and Append
# Using Global Air Pollution Dataset
# =====================================================

# -----------------------------
# 1. Load required library
# -----------------------------
library(dplyr)

# -----------------------------
# 2. Load the dataset from ZIP
# -----------------------------
global_air <- read.csv(
  unz("D:/S076/global air pollution dataset.csv.zip",
      "global air pollution dataset.csv")
)

# View first rows
head(global_air)

# =====================================================
# 3. CREATE TWO DATASETS FROM THE MAIN CSV
#    (Good AQI and Moderate AQI)
# =====================================================

# Dataset 1 → Good AQI rows
data_good <- subset(global_air, AQI.Category == "Good")

# Dataset 2 → Moderate AQI rows
data_moderate <- subset(global_air, AQI.Category == "Moderate")

# Check
head(data_good)
head(data_moderate)

# =====================================================
# 4. APPENDING (bind_rows)
# =====================================================

air_appended <- bind_rows(data_good, data_moderate)

# View combined appended dataset
head(air_appended)

# =====================================================
# 5. MERGING DATASETS (merge)
# =====================================================

# Select only useful columns to merge
data_A <- data_good[, c("Country", "City", "AQI.Value")]
data_B <- data_moderate[, c("Country", "City", "PM2.5.AQI.Value")]

# ---------------------------
# A. Inner Merge (only matches)
# ---------------------------
inner_merge <- merge(data_A, data_B, by = c("Country", "City"))

# Show result
head(inner_merge)

# ---------------------------
# B. Left Merge (all from A)
# ---------------------------
left_merge <- merge(data_A, data_B,
                    by = c("Country", "City"),
                    all.x = TRUE)

# Show result
head(left_merge)

# ---------------------------
# C. Full Merge (all rows)
# ---------------------------
full_merge <- merge(data_A, data_B,
                    by = c("Country", "City"),
                    all = TRUE)

# Show result
head(full_merge)

# =====================================================
# END OF PRACTICAL 6
# =====================================================
