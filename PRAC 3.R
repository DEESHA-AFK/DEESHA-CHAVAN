# Install required packages (run only once)
install.packages(c("readr", "psych"))

# Load the libraries
library(readr)
library(psych)

# Correct way to read the CSV file (use double \\ or forward /)
globalAirQuality <- read.csv("C:\\Users\\itlab\\Downloads\\globalAirQuality.csv")
# OR
# globalAirQuality <- read.csv("C:/Users/itlab/Downloads/globalAirQuality.csv")

# View the first few rows
head(globalAirQuality)

# View the last few rows
tail(globalAirQuality)

# Get the dimensions (rows and columns)
dim(globalAirQuality)
cat("Dimensions (Rows, Columns): ", dim(globalAirQuality), "\n")

# View structure of the dataset
str(globalAirQuality)

# Summary statistics
summary(globalAirQuality)

# Column names
names(globalAirQuality)
cat("Column Names: ", names(globalAirQuality), "\n")

# Detailed descriptive statistics from psych package
describe(globalAirQuality)

