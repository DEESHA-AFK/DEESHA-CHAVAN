library(readr)
library(dplyr)

# Read CSV from ZIP
zip_file <- "D:/S076/global air pollution dataset.csv.zip"
global_air <- read_csv(unz(zip_file, "global air pollution dataset.csv"))

# Clean column names to remove spaces and dots
colnames(global_air) <- make.names(colnames(global_air))

# Check column names
colnames(global_air)
# Now CO.AQI.Value, Ozone.AQI.Value, NO2.AQI.Value, PM2.5.AQI.Value

# Create new variables safely
global_air <- global_air %>%
  mutate(
    Total_AQI = CO.AQI.Value + Ozone.AQI.Value + NO2.AQI.Value + PM2.5.AQI.Value,
    Avg_AQI = Total_AQI / 4,
    Norm_AQI = (Avg_AQI - min(Avg_AQI, na.rm = TRUE)) / 
      (max(Avg_AQI, na.rm = TRUE) - min(Avg_AQI, na.rm = TRUE)),
    AQI_Level = case_when(
      Avg_AQI <= 50 ~ "Good",
      Avg_AQI <= 100 ~ "Moderate",
      Avg_AQI <= 150 ~ "Unhealthy for Sensitive Groups",
      Avg_AQI <= 200 ~ "Unhealthy",
      Avg_AQI <= 300 ~ "Very Unhealthy",
      TRUE ~ "Hazardous"
    )
  )

# View results
head(global_air[, c("Country", "City", "Avg_AQI", "Total_AQI", "Norm_AQI", "AQI_Level")])

write_csv(global_air, "D:/S076/global_air_cleaned.csv")

global_air %>%
  group_by(Country) %>%
  summarise(
    Avg_AQI_by_country = mean(Avg_AQI, na.rm = TRUE),
    Max_AQI_by_country = max(Total_AQI, na.rm = TRUE)
  )

