# install.packages("wooldridge")
# install.packages("car")


################################################
library(car)
library(dplyr)
data(vote1, package='wooldridge')

# Estimating the model
model1 <- lm(voteA ~ lexpendA + lexpendB + prtystrA, data = vote1)
summary(model1)

# Test the hypothesis that beta1 + beta2 = 0
linearHypothesis(model1, "lexpendA + lexpendB = 0")

# Create a new variable that is the sum of lexpendA and lexpendB
vote1 <- vote1 %>% mutate(sum_expend = lexpendA + lexpendB)

# Estimate the model
model2 <- lm(voteA ~ sum_expend + prtystrA, data = vote1)

# Summary of the model
summary(model2)

###############################################
data(hprice1, package='wooldridge')

# Estimating the model
model <- lm(lprice ~ sqrft + bdrms, data = hprice1)

# Extract the coefficients and standard errors
beta_1 <- coef(model)["sqrft"]
beta_2 <- coef(model)["bdrms"]
var_beta_1 <- vcov(model)["sqrft", "sqrft"]
var_beta_2 <- vcov(model)["bdrms", "bdrms"]
cov_beta_1_beta_2 <- vcov(model)["sqrft", "bdrms"]

# Calculate theta_1
theta_1 <- 150 * beta_1 + beta_2

# Calculate the standard error for theta_1 considering the covariance
se_theta_1 <- sqrt((150^2) * var_beta_1 + var_beta_2 + 2 * 150 * cov_beta_1_beta_2)

# Construct the 95% confidence interval for theta_1
ci_lower <- theta_1 - 1.96 * se_theta_1
ci_upper <- theta_1 + 1.96 * se_theta_1

# Print results
cat("Estimated theta_1:", round(theta_1, 4), "\n")
cat("95% Confidence Interval for theta_1:", round(ci_lower, 4), "to", round(ci_upper, 4), "\n")


# Create the transformed variable for the regression
hprice1$sqrft_minus_150_bdrms <- hprice1$sqrft - 150 * hprice1$bdrms

# Estimate the model
model_b <- lm(lprice ~ sqrft_minus_150_bdrms + bdrms, data = hprice1)

# Summary of the model
summary(model_b)

##############################################################
data(k401ksubs, package='wooldridge')

# Filter the data for single-person households
single_person_households <- subset(k401ksubs, fsize == 1)

# Count the number of single-person households
num_single_person_households <- nrow(single_person_households)
num_single_person_households

# Estimate the model using OLS
model <- lm(nettfa ~ inc + age, data = single_person_households)

# Display the summary of the regression results
summary(model)

# Perform a one-sided t-test for H0: beta_2 = 1 against H1: beta_2 < 1
# Extracting the estimate and standard error for the age coefficient
beta_2_hat <- coef(summary(model))["age", "Estimate"]
se_beta_2 <- coef(summary(model))["age", "Std. Error"]

# Calculate the t-statistic
t_stat <- (beta_2_hat - 1) / se_beta_2

# Calculate the p-value for the one-sided test
p_value <- pt(t_stat, df = df.residual(model), lower.tail = TRUE)
p_value

# Determine if you reject H0 at the 1% significance level
reject_H0 <- p_value < 0.01
reject_H0

# Simple regression of nettfa on inc
simple_model <- lm(nettfa ~ inc, data = single_person_households)

# Display the summary of the simple regression
summary(simple_model)
