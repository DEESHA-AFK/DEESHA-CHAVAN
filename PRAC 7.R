
library(dplyr)
global_air <- read.csv(
  unz("D:/S076/global air pollution dataset.csv.zip",
      "global air pollution dataset.csv")
)


head(global_air)

air_selected <- global_air %>% 
  select(Country, City, AQI.Value)

head(air_selected)


pm_data <- global_air %>% 
  select(starts_with("PM"))

head(pm_data)


air_dropped <- global_air %>% 
  select(-CO.AQI.Value, -CO.AQI.Category)

head(air_dropped)


air_dropped_range <- global_air %>% 
  select(-(AQI.Value:CO.AQI.Category))

head(air_dropped_range)


air_no_pm <- global_air %>% 
  select(-starts_with("PM"))

head(air_no_pm)



