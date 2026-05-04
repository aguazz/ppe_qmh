# install.packages("wooldridge")

########################################################
data(ceosal2, package='wooldridge')

# Calculate the average salary
average_salary <- mean(ceosal2$salary)
average_salary

# Count the number of CEOs in their first year as CEO (ceoten = 0)
num_first_year_ceos <- sum(ceosal2$ceoten == 0)
num_first_year_ceos

# Find the longest tenure as a CEO
longest_tenure <- max(ceosal2$ceoten)
longest_tenure

# Estimate the simple regression model
model <- lm(lsalary ~ ceoten, data = ceosal2)

# Report the regression results
summary(model)

# Extract the coefficient for ceoten (beta_1)
beta_1 <- coef(model)["ceoten"]

# Calculate the approximate percentage increase in salary for one more year as a CEO
percentage_increase <- beta_1 * 100

# Print the results
percentage_increase

#####################################################

data(wage2, package='wooldridge')

# Calculate the average salary
average_salary <- mean(wage2$wage, na.rm = TRUE)

# Calculate the average IQ
average_IQ <- mean(wage2$IQ, na.rm = TRUE)

# Calculate the sample standard deviation of IQ
sd_IQ <- sd(wage2$IQ, na.rm = TRUE)

# Print the results
average_salary
average_IQ
sd_IQ

# Estimate the simple regression model
model <- lm(wage ~ IQ, data = wage2)

# View the regression results
summary(model)

# Extract the coefficient for IQ (the predicted increase in wage for a one-point increase in IQ)
coef_IQ <- coef(model)["IQ"]

# Calculate the predicted increase in wage for an increase in IQ of 15 points
predicted_increase <- coef_IQ * 15

# Print the results
coef_IQ
predicted_increase

# Check the R-squared value to see if IQ explains most of the variation in wage
r_squared <- summary(model)$r.squared
r_squared

# Estimate the log-linear regression model (log of wage vs. IQ)
model_log <- lm(log(wage) ~ IQ, data = wage2)

# View the regression results
summary(model_log)

# Extract the coefficient for IQ (percentage effect on wage for a one-point increase in IQ)
coef_log_IQ <- coef(model_log)["IQ"]

# Calculate the approximate percentage increase in predicted wage for a 15-point increase in IQ
percentage_increase <- coef_log_IQ * 15 * 100

# Print the results
coef_log_IQ
percentage_increase

################################################

# Set seed for reproducibility
set.seed(123)

# Generate 500 observations from a uniform distribution on [0, 10]
x_i <- runif(500, min = 0, max = 10) * 10

# Calculate the sample mean of x_i
sample_mean <- mean(x_i)

# Calculate the sample standard deviation of x_i
sample_sd <- sd(x_i)

# Print the results
sample_mean
sample_sd

# Set seed for reproducibility
set.seed(123)

# Step 1: Generate 500 errors from the Normal(0, 36) distribution
u_i <- rnorm(500, mean = 0, sd = sqrt(36))

# Calculate the sample mean and sample standard deviation of u_i
sample_mean_u <- mean(u_i)
sample_sd_u <- sd(u_i)

# Print the sample mean and sample standard deviation of u_i
sample_mean_u
sample_sd_u

# Explanation:
# The sample average of u_i is not exactly zero because it is a random sample,
# and although the expected value is zero, the sample mean will vary around zero.

# Step 2: Generate y_i = 1 + 2 * x_i + u_i
y_i <- 1 + 2 * x_i + u_i

# Step 3: Run the regression of y_i on x_i
model <- lm(y_i ~ x_i)

# View the regression summary
summary(model)

# Extract the estimated intercept and slope
estimated_intercept <- coef(model)["(Intercept)"]
estimated_slope <- coef(model)["x_i"]

# Print the estimated intercept and slope
estimated_intercept
estimated_slope

# Step 1: Obtain the OLS residuals
residuals_u_hat <- resid(model)  # OLS residuals

# Step 2: Verify that the sum of the residuals is approximately zero
sum_residuals <- sum(residuals_u_hat)

# Step 3: Verify that the sum of x_i multiplied by the residuals is approximately zero
sum_x_u_hat <- sum(x_i * residuals_u_hat)

# Print the results
sum_residuals
sum_x_u_hat








