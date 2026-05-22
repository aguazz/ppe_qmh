# Exercise 1
# Install the required packages
install.packages(c("MASS", "devtools", "swirl", "lintr"))

# Exercise 2
# Find the current working directory
getwd()

# Exercise 3
# Change the working directory to C:/Documents
setwd("C:/Users/Public/Documents")
# Use the menu bar to change it to "C:/Users/Public/Downloads" (not implemented here as it's a manual operation)

# Exercise 4
a <- 3 * (4 + 9)
b <- c(1, 4, 1999, 2011)
d <- 2 * pi
e <- a^2 + sqrt(d)

# Exercise 5
# Print the variables
print(a)
print(b)
print(d)
print(e)
# "c" is not used as it is a base R function for combining values into a vector.

# Exercise 6
# Create a vector using seq()
year <- seq(2010, 1950, by = -10)

# Print the vector
print(year)

# Apply functions to the vector
length(year)
min(year)
max(year)
range(year)
mean(year)
sum(year)

# Exercise 7
# Download and save the CSV file in https://github.com/kosukeimai/qss/blob/master/INTRO/UNpop.csv
# Import the data into R
# Full path
# UNpop <- read.csv("Your/path/to/the/file/UNpop.csv")
# Relative path
UNpop <- read.csv("UNpop.csv")

# Check the class of the object
class(UNpop)

# Apply functions to inspect the data
names(UNpop)
nrow(UNpop)
ncol(UNpop)
dim(UNpop)
summary(UNpop)

# Extract the 'year' column
year_column <- UNpop$year
year_column

# Extract the 4th and 5th observations
UNpop[4:5, ]

# Extract even observations from world.pop
even.world.pop <- UNpop$world.pop[seq(2, nrow(UNpop), by = 2)]
even.world.pop

# Load RData format file
# Full path
# load("Your/path/to/the/file/UNpop.RData")
# Relative path
load("UNpop.RData")

# Exercise 8
# Use lintr to analyze the script
library(lintr)
lint("Basic_R.R")

# Exercise 9
# Take the swirl lessons INTRO1 and INTRO2 from the swirl course qss-swirl
# swirl::install\_course\_github("kosukeimai", "qss-swirl")
library(swirl)
swirl()
# Follow the instructions to complete the lessons INTRO1 and INTRO2
