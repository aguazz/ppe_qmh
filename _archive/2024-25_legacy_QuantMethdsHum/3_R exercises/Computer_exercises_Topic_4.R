# install.packages("wooldridge")


################################################
data(wage1, package='wooldridge')

# 1. Estimate the equation using OLS
model <- lm(lwage ~ educ + exper + expersq, data = wage1)

# Print the summary to report the results
summary(model)

# 2. Check if exper^2 (expersq) is statistically significant at the 1% level
# Look at the p-value associated with expersq in the model summary
summary(model)$coefficients["expersq", ]

# 3. Calculate the approximate return to the fifth and twentieth years of experience
beta_2 <- coef(model)["exper"]
beta_3 <- coef(model)["expersq"]

# Return to 5th year of experience
return_5th_year <- 100 * (beta_2 + 2 * beta_3 * 5)
return_5th_year

# Return to 20th year of experience
return_20th_year <- 100 * (beta_2 + 2 * beta_3 * 20)
return_20th_year

# 4. Calculate the value of exper at which additional experience lowers predicted log(wage)
# We set the derivative of the wage equation with respect to exper to 0:
# ∂(log(wage))/∂exper = β_2 + 2*β_3*exper = 0
# Solve for exper

turning_point_exper <- -beta_2 / (2 * beta_3)
turning_point_exper

# Count how many people in the dataset have more experience than the turning point
num_people_more_experience <- sum(wage1$exper > turning_point_exper)
num_people_more_experience
