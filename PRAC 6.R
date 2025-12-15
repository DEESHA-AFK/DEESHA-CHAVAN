
library(dplyr)
global_air <- read.csv(
  unz("D:/S076/global air pollution dataset.csv.zip",
      "global air pollution dataset.csv")
)

# View first rows
head(global_air)

# Dataset 1 → Good AQI rows
data_good <- subset(global_air, AQI.Category == "Good")

# Dataset 2 → Moderate AQI rows
data_moderate <- subset(global_air, AQI.Category == "Moderate")

# Check
head(data_good)
head(data_moderate)



air_appended <- bind_rows(data_good, data_moderate)

# View combined appended dataset
head(air_appended)


#MERGING DATASETS (merge)
# Select only useful columns to merge
data_A <- data_good[, c("Country", "City", "AQI.Value")]
data_B <- data_moderate[, c("Country", "City", "PM2.5.AQI.Value")]


inner_merge <- merge(data_A, data_B, by = c("Country", "City"))

# Show result
head(inner_merge)


left_merge <- merge(data_A, data_B,
                    by = c("Country", "City"),
                    all.x = TRUE)

# Show result
head(left_merge)


full_merge <- merge(data_A, data_B,
                    by = c("Country", "City"),
                    all = TRUE)

# Show result
head(full_merge)


