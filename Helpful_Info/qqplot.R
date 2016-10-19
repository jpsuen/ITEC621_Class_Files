## Create Various Distributions
negative.skew <- rbeta(1000, 10, 3)
positive.skew <- rbeta(1000, 3, 10)
normal.distro <- rnorm(1000, mean = 0, sd = 1)

## Set up multiple graphs in one view
par(mfrow=c(3,2))

##Plot everything out
hist(normal.distro, main = "Normal Distribution")
qqnorm(normal.distro, main = "Normal Distribution")
qqline(normal.distro)

hist(negative.skew, main = "Negative Skew Distribution")
qqnorm(negative.skew, main = "Negative Skew Distribution")
qqline(negative.skew)

hist(positive.skew, main = "Positive Skew Distribution")
qqnorm(positive.skew, main = "Positive Skew Distribution")
qqline(positive.skew)

