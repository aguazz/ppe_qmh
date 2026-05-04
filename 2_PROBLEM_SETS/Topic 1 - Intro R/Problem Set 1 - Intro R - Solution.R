## Load datasets
kenya <- read.csv("Kenya.csv")
sweden <- read.csv("Sweden.csv")
world <- read.csv("World.csv")

####
## Q1 - CBR
####

## Aggregate the person-year metric for both genders.
kenya$py <- kenya$py.men + kenya$py.women
sweden$py <- sweden$py.men + sweden$py.women
world$py <- world$py.men + world$py.women

## Explore the periods 
kenya$period; sweden$period; world$period
# OBSERVATION: there are 2 periods in all the datesets:
# 1. "1950-1955", ranging from observations 1 to 15
i1 <- 1:15 # saving the indexes of period 1
# 2. "2005-2010", ranging from observations 16 to 30
i2 <- 16:30 # saving the indexes of period 2
# More advanced
# i1 <- which(kenya$period == "1950-1955")
# i2 <- which(kenya$period == "2000-2005")
# Saving periods
periods <- unique(kenya$period)

## Create CBR in both periods
# Kenya’s
kc1 <- sum(kenya[i1, "births"]) / sum(kenya[i1, "py"])
kc2 <- sum(kenya[i2, "births"]) / sum(kenya[i2, "py"])
kCBR <- c(kc1, kc2)
names(kCBR) <- periods
# Sweden’s
sc1 <- sum(sweden[i1, "births"]) / sum(sweden[i1, "py"])
sc2 <- sum(sweden[i2, "births"]) / sum(sweden[i2, "py"])
sCBR <- c(sc1, sc2)
names(sCBR) <- periods
# World’s
wc1 <- sum(world[i1, "births"]) / sum(world[i1, "py"])
wc2 <- sum(world[i2, "births"]) / sum(world[i2, "py"])
wCBR <- c(wc1, wc2)
names(wCBR) <- periods
# Print CBRs
kCBR; sCBR; wCBR

## CONCLUSIONS: 
# 1. Kenya’s CBR declined from 0.052 to 0.039 between 1950–1955 and 2005–2010.
# 2. Sweden’s CBR also declined, but remained far more stable, going from 0.015 to 0.012 in between periods.
# 3. The world’s CBR also declined, from 0.037 to 0.020.

####
## Q2 - ASFR
####

## Explore the age groups
kenya$age; sweden$age; world$age
# Saving age groups
age_groups <- unique(kenya$age)

## Compute ASFR in both periods
# Kenya's
K.ASFR1 <- kenya$births[i1] / kenya$py.women[i1]
K.ASFR2 <- kenya$births[i2] / kenya$py.women[i2]
# Creating data
K.ASFR <- data.frame(row.names = age_groups, "1950-1955" = K.ASFR1, "2000-2005" = K.ASFR2, check.names = FALSE) 
# Sweden's
S.ASFR1 <- sweden[i1, "births"] / sweden[i1, "py.women"] # different way of subsetting
S.ASFR2 <- sweden[i2, "births"] / sweden[i2, "py.women"]
# Creating data
S.ASFR <- data.frame(row.names = age_groups, "1950-1955" = S.ASFR1, "2000-2005" = S.ASFR2, check.names = FALSE) 
# World's
W.ASFR1 <- world[i1, "births"] / world[i1, "py.women"]
W.ASFR2 <- world[i2, "births"] / world[i2, "py.women"]
# Creating data
W.ASFR <- data.frame(row.names = age_groups, "1950-1955" = W.ASFR1, "2000-2005" = W.ASFR2, check.names = FALSE) 

## Printing results
K.ASFR
S.ASFR
W.ASFR

## OBSERVATION:
# 1. From age groups 0-14 and 50-80+ (no fertile periods), there is no brith

## Compute TFR
K.TFR <- c(sum(K.ASFR1 * 5), sum(K.ASFR2 * 5))
S.TFR <- c(sum(S.ASFR1 * 5), sum(S.ASFR2 * 5))
W.TFR <- c(sum(W.ASFR1 * 5), sum(W.ASFR2 * 5))
# Naming
names(K.TFR) <- names(S.TFR) <- names(W.TFR) <- periods
# Print TFRs.
K.TFR; S.TFR; W.TFR

## OBSERVATIONS:
# 1. Kenya’s TFR declined significantly, from 7.6 to 4.9.
# 2. Sweden’s TFR slightly decreased from 2.2 to 1.9.
# 3. The world’s TFR dropped by half, from 5.0 to 2.5.

####
## Q3 - CDR
####

## Compute the CDR
# Kenya's
K.CDR1 <- sum(kenya[i1, "deaths"]) / sum(kenya[i1, "py"])
K.CDR2 <- sum(kenya[i2, "deaths"]) / sum(kenya[i2, "py"])
K.CDR <- c(K.CDR1, K.CDR2)
# Sweden's
S.CDR1 <- sum(sweden[i1, "deaths"]) / sum(sweden[i1, "py"])
S.CDR2 <- sum(sweden[i2, "deaths"]) / sum(sweden[i2, "py"])
S.CDR <- c(S.CDR1, S.CDR2)
# World's
W.CDR1 <- sum(world[i1, "deaths"]) / sum(world[i1, "py"])
W.CDR2 <- sum(world[i2, "deaths"]) / sum(world[i2, "py"])
W.CDR <- c(W.CDR1, W.CDR2)
# Naming
names(K.CDR) <- names(S.CDR) <- names(W.CDR) <- periods 
## Print CDRs.
K.CDR; S.CDR; W.CDR

## OBSERVATIONS:
# 1. Kenya’s CDR decreased from 0.024 to 0.016.
# 2. Sweden’s CDR remained relatively constant at 0.01.
# 3. The world’s CDR fell from 0.019 to 0.008.
# 4. Puzzling finding: The CDR of Kenya in 2000-2005 is about the same as Sweden!
#    CDR does not take into account the age composition of a population. See next question!

####
## Q4 - ASDR
####

## Compute ASDR within the period 2000-2005
K.ASDR <- kenya$deaths[i2] / kenya$py[i2] # Kenya's
S.ASDR <- sweden$deaths[i2] / sweden$py[i2] # Sweden's
W.ASDR <- world$deaths[i2] / world$py[i2] # World's

## Creating data
ASDR <- data.frame(row.names = age_groups, Kenya = K.ASDR, Sweden = S.ASDR, World = W.ASDR) 

## Printing results
ASDR # Hard to analize!

## Plotting results
barplot(as.matrix(t(ASDR[,1:3])), beside = TRUE, 
        col = c("firebrick3", "deepskyblue3", "darkolivegreen3"),
        legend.text = colnames(ASDR),  # Legend matches column names
        args.legend = list(x = "topleft"),
        main = "Comparison of Age-Specific Death Rate",
        ylab = "ASDR", xlab = "Age Group",
        names.arg = rownames(ASDR))  # Labels for each category

## OBSERVATIONS:
# 1. The ASDR of Kenya is significantly higher than the ones of Sweden for each age group, in the period 2000-2005
# 2. In the same period, the ASDR-gap between Kenya and Sweden is specially higher for younger age groups

####
## Q5: Counterfactual CDR
####

S.p <- sweden$py[i2] / sum(sweden$py[i2]) # Sweden Age-Specific Person Year Proportion
cfK.CDR <- sum(K.ASDR * S.p)
## Compare factual and counterfactual CDRs.
K.CDR[[2]]; cfK.CDR

## OBSERVATIONS:
# 1. Kenya’s counterfactual CDR, using Sweden’s age distribution, is 0.023, compared to its factual CDR of 0.01 (More than twice). 
# 2. This demonstrates that age distribution affects the comparison of CDRs between countries.
