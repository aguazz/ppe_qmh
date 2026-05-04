# install.packages("wooldridge")

################################################3
data(volat, package='wooldridge')

# Part (ii): Estimate the equation by OLS and report the results
model <- lm(rsp500 ~ pcip + i3, data = volat)
summary(model)

coefficients <- coef(summary(model))
r_squared <- summary(model)$r.squared

# Print key results
cat("Estimated Equation:\n")
cat("rsp500 = ", round(coefficients[1, 1], 4), " + ", round(coefficients[2, 1], 4), " * pcip + ", round(coefficients[3, 1], 4), " * i3\n\n")
cat("P-values:\n")
cat("pcip: ", round(coefficients[2, 4], 4), "\n")
cat("i3: ", round(coefficients[3, 4], 4), "\n\n")
cat("R-squared: ", round(r_squared, 4), "\n")

# Interpretation of predictability
if (coefficients[2, 4] < 0.05 | coefficients[3, 4] < 0.05) {
  cat("At least one of the predictors is statistically significant, suggesting that the return on the S&P 500 may be predictable.\n")
} else {
  cat("Neither predictor is statistically significant, so there is no strong evidence of predictability.\n")
}

######################################################
data(traffic2, package = "wooldridge")

# Load necessary packages
library(dplyr)
library(lubridate)

# Load and inspect the dataset
head(traffic2)

# Part (i): During what month and year did California's seat belt law take effect? When did the highway speed limit increase to 65 miles per hour?

# Seat belt law: The variable 'beltlaw' indicates when the seat belt law took effect (beltlaw = 1).
# Speed limit increase: The variable 'spdlaw' indicates when the speed limit increased to 65 mph (spdlaw = 1).

# Extract the month and year when these laws took effect
seat_belt_law_date <- traffic2 %>% filter(beltlaw == 1) %>% select(year) %>% distinct()
speed_limit_date <- traffic2 %>% filter(spdlaw == 1) %>% select(year) %>% distinct()

cat("Seat belt law took effect in:", seat_belt_law_date$year, "\n")
cat("Highway speed limit increased to 65 mph in:", speed_limit_date$year, "\n")

# Part (ii): Regress log(totacc) on the linear time trend (t) and monthly dummy variables (feb to dec)
model_part_ii <- lm(log(totacc) ~ t + feb + mar + apr + may + jun + jul + aug + sep + oct + nov + dec, data = traffic2)
summary(model_part_ii)

# Part (iii): Regress log(totacc) on the time trend (t), monthly dummy variables (feb to dec), and additional covariates (wkends, unem, spdlaw, beltlaw)
model_part_iii <- lm(log(totacc) ~ t + feb + mar + apr + may + jun + jul + aug + sep + oct + nov + dec + wkends + unem + spdlaw + beltlaw, data = traffic2)
summary(model_part_iii)

# Part (iv): Interpret the coefficients on spdlaw and beltlaw in the regression from part (iii).

# The coefficient on spdlaw shows the effect of increasing the speed limit to 65 mph on total accidents.
# The coefficient on beltlaw shows the effect of introducing the seat belt law on total accidents.
# Discuss whether the signs of these coefficients match expectations (e.g., a positive sign for spdlaw indicating more accidents due to higher speed limits).

# Part (v): Calculate the average of prcfat and discuss whether the magnitude seems reasonable.

avg_prcfat <- mean(traffic2$prcfat, na.rm = TRUE)
cat("Average prcfat:", round(avg_prcfat, 2), "%\n")

# The average percentage of accidents resulting in at least one fatality is about X%. Discuss whether this percentage seems reasonable based on the context.

# Part (vi): Regress prcfat on the time trend (t), monthly dummy variables (feb to dec), and additional covariates (wkends, unem, spdlaw, beltlaw)
model_prcfat <- lm(prcfat ~ t + feb + mar + apr + may + jun + jul + aug + sep + oct + nov + dec + wkends + unem + spdlaw + beltlaw, data = traffic2)
summary(model_prcfat)

# Discuss the estimated effects of spdlaw and beltlaw on prcfat.
# If spdlaw has a significant positive coefficient, it suggests that increasing the speed limit leads to a higher percentage of fatal accidents.
# If beltlaw has a significant negative coefficient, it suggests that the seat belt law reduces the percentage of fatal accidents.

