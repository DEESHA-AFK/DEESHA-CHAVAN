# ================================================
# PRACTICAL: Selecting and Dropping Variables using select()
# Dataset: Global Air Pollution Dataset
# ================================================

# ---------------------------
# 1. Load library
# ---------------------------
library(dplyr)

# ---------------------------
# 2. Import dataset from ZIP
# ---------------------------
global_air <- read.csv(
  unz("D:/S076/global air pollution dataset.csv.zip",
      "global air pollution dataset.csv")
)

# View data
head(global_air)

# ================================================
# 3. SELECTING VARIABLES  (choose specific columns)
# ================================================

# Example: Select Country, City, AQI.Value
air_selected <- global_air %>% 
  select(Country, City, AQI.Value)

head(air_selected)

# Example: Select columns that start with "PM"
pm_data <- global_air %>% 
  select(starts_with("PM"))

head(pm_data)

# ================================================
# 4. DROPPING VARIABLES  (remove columns)
# ================================================

# Example: Drop CO.AQI.Value and CO.AQI.Category
air_dropped <- global_air %>% 
  select(-CO.AQI.Value, -CO.AQI.Category)

head(air_dropped)

# Drop multiple columns using a range
air_dropped_range <- global_air %>% 
  select(-(AQI.Value:CO.AQI.Category))

head(air_dropped_range)

# Drop all PM-related columns
air_no_pm <- global_air %>% 
  select(-starts_with("PM"))

head(air_no_pm)

# ================================================
# END OF PRACTICAL
# ================================================
