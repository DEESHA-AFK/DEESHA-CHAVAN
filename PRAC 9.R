head(global_air_clean[, c("Country", "Country_short")])

library(stringr)
library(dplyr)

global_air_clean <- global_air_clean %>%
  mutate(
    Country_words = str_split(Country, " "),        # splits by space
    First_word_country = sapply(Country_words, `[`, 1)  # extracts first word
  )

# View the results
head(global_air_clean[, c("Country", "Country_words", "First_word_country")])

global_air_clean <- global_air_clean %>%
  mutate(Contains_United = str_detect(Country, "United"))

global_air_clean %>%
  filter(Contains_United) %>%
  select(Country, Contains_United)
global_air_clean <- global_air_clean %>%
  mutate(
    Country_upper = str_to_upper(Country),
    Country_lower = str_to_lower(Country)
  )

head(global_air_clean[, c("Country", "Country_upper", "Country_lower")])

