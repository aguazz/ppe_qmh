# install.packages("wooldridge")

################################################3
data(bwght, package='wooldridge')

# Estimate the model without faminc
model_without_faminc <- lm(bwght ~ cigs, data = bwght)

# Estimate the model with faminc
model_with_faminc <- lm(bwght ~ cigs + faminc, data = bwght)

# Summary of the models
summary(model_without_faminc)
summary(model_with_faminc)

# Extracting key information
n <- nrow(bwght)  # Sample size

# Coefficients and R-squared for the model without faminc
coef_without_faminc <- coef(model_without_faminc)
r_squared_without_faminc <- summary(model_without_faminc)$r.squared

# Coefficients and R-squared for the model with faminc
coef_with_faminc <- coef(model_with_faminc)
r_squared_with_faminc <- summary(model_with_faminc)$r.squared

# Reporting the results in equation form
cat("Model without faminc: \n")
cat(paste0("bwght = ", round(coef_without_faminc[1], 4), " + ", round(coef_without_faminc[2], 4), " * cigs\n"))
cat(paste0("Sample size: ", n, ", R-squared: ", round(r_squared_without_faminc, 4), "\n\n"))

cat("Model with faminc: \n")
cat(paste0("bwght = ", round(coef_with_faminc[1], 4), " + ", round(coef_with_faminc[2], 4), " * cigs + ", round(coef_with_faminc[3], 4), " * faminc\n"))
cat(paste0("Sample size: ", n, ", R-squared: ", round(r_squared_with_faminc, 4), "\n"))

# The focus should be on comparing the coefficient of 'cigs' in the two models 
# (with and without `faminc`). If adding `faminc` substantially changes 
# the estimated effect of `cigs` on `bwght`, it suggests that `faminc` is 
# an important confounding variable. Otherwise, if the coefficient of `cigs` 
# remains relatively unchanged, it indicates that controlling for `faminc` 
# does not significantly affect the relationship between `cigs` and 'bwght`.

###########################################################
data(hprice1, package='wooldridge')

# Estimate the model: price = β0 + β1 * sqrft + β2 * bdrms + u
model <- lm(price ~ sqrft + bdrms, data = hprice1)

# Display the summary of the regression results
summary(model)

# Extract coefficients for easier access
coefficients <- coef(model)

# Part (i): Write out the results in equation form
cat("Estimated equation: price =", round(coefficients[1], 4), "+", round(coefficients[2], 4), "* sqrft +", round(coefficients[3], 4), "* bdrms \n\n")

# Part (ii): What is the estimated increase in price for a house with one more bedroom, holding square footage constant?
bedroom_increase <- coefficients["bdrms"]
cat("Estimated increase in price for one more bedroom (holding sqrft constant):", round(bedroom_increase, 4), "thousand dollars\n\n")

# Part (iii): What is the estimated increase in price for a house with an additional bedroom that is 140 square feet in size?
additional_increase <- coefficients["bdrms"] + 140 * coefficients["sqrft"]
cat("Estimated increase in price for an additional bedroom with 140 sqrft:", round(additional_increase, 4), "thousand dollars\n\n")

# Part (iv): What percentage of the variation in price is explained by square footage and number of bedrooms?
r_squared <- summary(model)$r.squared
cat("R-squared:", round(r_squared * 100, 2), "% of the variation in price is explained by sqrft and bdrms\n\n")

# Part (v): Find the predicted selling price for the first house (sqrft = 2438, bdrms = 4)
predicted_price_first_house <- predict(model, newdata = data.frame(sqrft = 2438, bdrms = 4))
cat("Predicted selling price for the first house:", round(predicted_price_first_house, 4), "thousand dollars\n\n")

# Part (vi): The actual selling price was $300,000 (price = 300). Find the residual for this house.
actual_price <- 300
residual <- actual_price - predicted_price_first_house
cat("Residual for the first house:", round(residual, 4), "thousand dollars\n\n")

# Interpretation: Does the residual suggest the buyer underpaid or overpaid?
if (residual > 0) {
  cat("The positive residual suggests that the buyer underpaid for the house.\n")
} else {
  cat("The negative residual suggests that the buyer overpaid for the house.\n")
}


#######################################################
data(econmath, package = "wooldridge")

# Display the first few rows to check the structure of the dataset
head(econmath)

# Question 1: How many students received a perfect score for the course? What was the average score?
num_perfect_scores <- sum(econmath$score == 100)
average_score <- mean(econmath$score)
cat("Number of students with a perfect score:", num_perfect_scores, "\n")
cat("Average score:", round(average_score, 2), "\n")

# Find the means and standard deviations of actmth and acteng, and discuss how they compare.
mean_actmth <- mean(econmath$actmth, na.rm = TRUE)
sd_actmth <- sd(econmath$actmth, na.rm = TRUE)
mean_acteng <- mean(econmath$acteng, na.rm = TRUE)
sd_acteng <- sd(econmath$acteng, na.rm = TRUE)

cat("Mean ACT Math:", round(mean_actmth, 2), "\n")
cat("Standard Deviation ACT Math:", round(sd_actmth, 2), "\n")
cat("Mean ACT English:", round(mean_acteng, 2), "\n")
cat("Standard Deviation ACT English:", round(sd_acteng, 2), "\n")

# Discuss how they compare
cat("Discussion: The means and standard deviations of ACT Math and ACT English provide insight into the variability of the scores. Higher standard deviations suggest more spread in the scores.\n\n")

# Question 2: Estimate a linear equation relating score to colgpa, actmth, and acteng
model <- lm(score ~ colgpa + actmth + acteng, data = econmath)
summary(model)

# Report the results in the usual form:
coefficients <- coef(model)
cat("Estimated equation: score =", round(coefficients[1], 4), "+", round(coefficients[2], 4), "* colgpa +", round(coefficients[3], 4), "* actmth +", round(coefficients[4], 4), "* acteng\n")

# Question 3: Would you say the math or English ACT score is a better predictor of performance in the economics course? Explain.
cat("\nDiscussion: Based on the t-values and p-values from the regression output, we can assess which variable (actmth or acteng) has a stronger relationship with the course score. The variable with the larger t-value and smaller p-value is considered a better predictor.\n\n")

# Question 4: Discuss the size of the R-squared in the regression.
r_squared <- summary(model)$r.squared
cat("R-squared:", round(r_squared, 4), "\n")
cat("Discussion: The R-squared value indicates the proportion of the variance in the dependent variable (score) that is explained by the independent variables (colgpa, actmth, and acteng). A higher R-squared suggests that the model fits the data well.\n")






