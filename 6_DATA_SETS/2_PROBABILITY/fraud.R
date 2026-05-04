## Load data
load(file = "fraud.RData")

####
## Question 1: Frequent Fractions in Vote Shares
####
## (a) Compute United Russia’s vote share as a proportion of voters who turned out
russia2011$vote_share <- russia2011$votes / russia2011$turnout

## (b) Identify the 10 most frequently occurring fractions for the vote share
freq_table <- table(russia2011$vote_share)
top_10_fractions <- sort(freq_table, decreasing = TRUE)[1:10]
print(top_10_fractions)

## (c) Create a histogram with bins for unique fractions
unique_fractions <- unique(russia2011$vote_share)
hist(russia2011$vote_share, breaks = length(unique_fractions),
     main = "Histogram of Vote Shares", xlab = "Vote Share", ylab = "Frequency")

## (d) Briefly describe the distribution
# Observations suggest high frequencies at fractions with low
# numerators and denominators, such as 1/2 and 1/3.


####
## Question 2: Monte Carlo Simulation
####
## We assume a binomial distribution for turnout and vote shares
## (a) Conduct 1000 simulations
set.seed(123)
simulated_results <- c()
for (i in 1:100) {
  simulated_turnout <- rbinom(nrow(russia2011), size = russia2011$N,
                              prob = russia2011$turnout / russia2011$N)
  simulated_votes <- rbinom(nrow(russia2011), size = simulated_turnout,
                            prob = russia2011$vote_share)
  simulated_vote_share <- simulated_votes / simulated_turnout
  simulated_results <- c(simulated_results, simulated_vote_share)
}
## (c) Identify the 10 most frequent vote share values
simulated_freq_table <- table(simulated_results)
simulated_top_10 <- sort(simulated_freq_table, decreasing = TRUE)[1:10]
print(simulated_top_10)
## (d) Create a histogram similar to Question 1
unique_simulated <- unique(simulated_results)
hist(simulated_results, breaks = length(unique_simulated),
     main = "Histogram of Simulated Vote Shares",
     xlab = "Simulated Vote Share", ylab = "Frequency")
## (e) Comment on the comparison
# Simulated vote shares also show high frequencies at low fractions.
# This suggests that some patterns might occur by chance.
