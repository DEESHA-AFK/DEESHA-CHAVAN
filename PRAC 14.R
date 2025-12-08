library(dplyr)
library(lubridate)

# Adding a sample 'Harvest_Date' column for demonstration
set.seed(123)  # For reproducibility
clean_wine$Harvest_Date <- sample(seq(as.Date('2020-01-01'), as.Date('2024-12-31'), by="day"), nrow(clean_wine), replace = TRUE)
head(clean_wine)


wine_dates <- clean_wine %>%
  mutate(
    Actual_Date = ymd(Harvest_Date),
    Year_Num = year(Actual_Date),
    Month_Num = month(Actual_Date),
    Month_Name = month(Actual_Date, label = TRUE),
    Day_Num = day(Actual_Date),
    Weekday_Num = wday(Actual_Date),
    Weekday_Name = wday(Actual_Date, label = TRUE, abbr = FALSE),
    Quarter = quarter(Actual_Date),
    Day_of_Year = yday(Actual_Date)
  )

head(wine_dates)


current_time <- now()
paste("Current Year:", year(current_time))
paste("Current Month:", month(current_time))
paste("Current Day:", day(current_time))
paste("Current Weekday:", wday(current_time, label=TRUE))
