#### 3. REGRESSION REFRESHER ####


## Correlation

# Let's look at the diamonds data in the ggplot package:

install.packages("ggplot2") # If not already installed
require(ggplot2)
data(diamonds)
head(diamonds)

# Some functions like the cor() function, which displays a correlation matrix require the data frame to be converted into matrix form You can specify the variables you want to include this way:

MyDiamondData <- as.matrix(data.frame(diamonds$price,diamonds$carat, diamonds$depth))
head(MyDiamondData)

# Or you can just specify the column numbers this way, all rows, columns 7, 1 and 5

MyDiamondData <- as.matrix(data.frame(diamonds[, c(7,1,5)]))
head(MyDiamondData)

cor(MyDiamondData, use="complete.obs") # Discard rows with incomplete data
cor(MyDiamondData, use="pairwise.complete.obs") # Discard pairs without data

# Unfortunately the cor() function only gives correlations, not p-values. For p-values, rcorr() function in the "Hmisc" package does the job It returns the #observations plus 2 matrices -> correlation and p-values

install.packages("Hmisc") # Do this once only to install the package
require(Hmisc) # Note the H is upper case
rcorr(MyDiamondData, type="pearson")

# Note: rcorr sometimes returns an error, like:
#    (list) object cannot be coerced to type 'double'
#    If this happens, convert the data file to a matrix 
#    (rcorr was written to work with matrices):

rcorr(as.matrix(MyDiamondData), type="pearson")

# You can display correlations (above the diagonal), distributions (diagonal) and scatterplots (below the diagonal) all together with GGally and ggpairs():

install.packages("GGally") # Package with useful graphics displays
require(GGally)

ggpairs(MyDiamondData) # It can be a bit slow
# WARNING -- the ggpairs() can take a long time to run
ggpairs(diamonds) # Works with categorical data too
# The pairs() function from the base graphics package works well too

pairs(MyDiamondData) # Summary plot of all pairs of variables
pairs(diamonds) # With the full data set (takes a long time)

# Example with the mtcars data:

head(mtcars)
rcorr(as.matrix(mtcars))
ggpairs(mtcars) # Takes a bit of time
pairs(mtcars) # A bit quicker, but not as nice

# Some visual correlation functions

install.packages("corrplot") # If not installed already
library(corrplot) # Library for correlation plots
mtCorr <- cor(mtcars) # Store the correlation object
corrplot(mtCorr, method = "circle") # Then plot it
corrplot(mtCorr, method = "ellipse") # Slanted left/right for +/- 
corrplot(mtCorr, method = "number") # Show correlation

# Order variables clustered by correlation values
# and omit the diagonal
corrplot(mtCorr, method = "number", 
         order = "hclust", diag = FALSE,
         title = "MT Cars Correlation Matrix")
?corrplot # See all the methods

# Changing the annoying scientific notation (the "scipen" keyword stands for "scientific notation penalty"). 

options(scipen="4") # To limit displays in scientific notation
# i.e., if a value has more than 4 zeros after the decimal point it will be printed in scientific notation. 

## ANOVA

# The "aov()" function does ANOVA testing for fitted models, which is useful to compare a continuous variable (e.g., price) across various categories (e.g., clarity, color). In a nutshell, it tests whether the variance across groups is larger than within groups. The larger the F statistic, the more confidence we have that the variance across groups is significant

aov(price~clarity, data=diamonds) # Run the ANOVA on a single factor

# The "anova()" function is different and it is useful for comparing models:

fit1 = lm(price~carat, data=diamonds)
fit2 = lm(price~carat+clarity, data=diamonds)
anova(fit1, fit2)
# p-value is significant ->
# fit2 has more predictive power than fit1

summary(aov(price~clarity, data=diamonds)) # Show the ANOVA results
MyAOV <- aov(price~clarity, data=diamonds) # Store results in an object
summary(MyAOV) # Show the ANOVA object result summary
summary(aov(price~clarity+color, data=diamonds)) # ANOVA on 2 factors
summary(aov(price~clarity+color+cut, data=diamonds)) # On 3 factors

# Let's visualize the differences

boxplot(price~clarity, data=diamonds)
boxplot(price~color, data=diamonds)
boxplot(price~cut, data=diamonds)


### ISLR Chapter 3 Lab: Linear Regression

# Most of the material covered on regression in this course is covered in the ISLR book. This section of the script contain most of the code in the ISLR book, but I have added additional code (for example, to  compute collinearity statistics) and a substantial amount of comments.

## Simple Linear Regression

options(scipen = "4") # Limit the use of scientific notation

install.packages(c("MASS", "ISLR")) # If not installed already

# Modern Applied Statistics with S {MASS}
library(MASS) # Contains the Boston data set
library(ISLR) # Package companion to the textbook

# The Boston data set contains data for the Boston area housing market

?Boston # Let's check the variables in the data file
names(Boston) # View the data names
head(Boston) # View a few records

# Simple regression model for Boston housing data for housing values as a function of % low status population

lm.fit=lm(medv~lstat,data=Boston) # Using the fixed data set Boston.f
attach(Boston) # Or you can attach the data first
lm.fit=lm(medv~lstat) # And then run the regression
lm.fit # Display the regression output object
summary(lm.fit) # Display the summary of results
names(lm.fit) # List all the properties of the lm.fit object
coef(lm.fit) # Coefficients only
confint(lm.fit) # Confidence intervals only

# Predict medv for 3 values of lstat

# Get predicted values for all data points with confidence intervals
predict(lm.fit, interval="confidence") 
# Get predicted values for 3 new data points
predict(lm.fit, data.frame(lstat=(c(5,10,15))), interval="confidence")
predict(lm.fit, data.frame(lstat=(c(5,10,15))), interval="prediction")

# Note: the "confidence" interval is range of values representing a 95% probability (by default, but this can be changed) that the our model will predict values within that interval. If the interval does not include 0, then the coefficients are significant at the p < 0.5 level. In contrast, the "prediction" interval gives us the probability that an "actual prediction" will fall in the interval range. Generally, prediction intervals are larger that confidence intervals because they need to account for the variance in Y.

# Plot the data

plot(lstat,medv) # Plot the data
abline(lm.fit) # Draw the regression line on the plot
abline(lm.fit,lwd=3) # Change the line weight to 3
abline(lm.fit,lwd=3,col="red") # Change the line's color and weight

# Change other line attributes

plot(lstat,medv,col="red") 
plot(lstat,medv,pch=20)
plot(lstat,medv,pch="+")
plot(1:20,1:20,pch=1:20) # This is just a simple line illustration
plot(lm.fit) # Display 4 important regression diagnostic plots
par(mfrow=c(2,2)) # Divide the output into a 2x2 frame by row
par(mfcol=c(2,2)) # Divide the output into a 2x2 frame by column
plot(lm.fit) # And display the plots again in the new frames

plot(predict(lm.fit), residuals(lm.fit)) # Plot specific diagrams

# Quick simple regression example

lm.simple=lm(medv~rm, data=Boston)
summary(lm.simple)
par(mfrow=c(1,1)) # Reset screen display to a single graph
plot(rm, medv, main = "Regression for Boston House Values", 
     xlab = "No Rooms", 
     ylab = "Median Value $000")
abline(lm.simple, col="red" )


## Multiple Linear Regression

library(MASS) # Needed for the Boston data set

# Multiple regression model with 3 variables on the Boston housing data

lm.fit=lm(medv~lstat+age,data=Boston) 
summary(lm.fit) # Display regression output summary

# Run multiple regression on all available variables

lm.fit=lm(medv~.,data=Boston) 
summary(lm.fit) # Review the results
?summary.lm # To see which specific summary data can be displayed

# For example, to review the results with correlation matrix

summary(lm.fit, correlation = TRUE) 
summary(lm.fit)$r.squared # Display the R-squared only

# Other data available in the linear model (lm) object

coef(lm.fit) # Display only the regression coefficients
confint(lm.fit) # Display only the confidence intervals
plot(lm.fit) # 4 key diagnostic plots

# For a correlation matrix with p-values we need rcorr{Hmisc}

install.packages("Hmisc")
require(Hmisc)
# Data sometimes needs to be converted to a matrix for rcorr()
rcorr(as.matrix(Boston), type="pearson") 


## Multicollinearity

# Condition Index (CI): general collinearity statistic for the full model
#    CI<30 -- collinearity is not a concern
#    30<CI<50 -- Collinearity may be a concern, but may be OK
#    50<CI -- Collinearity is severe -- must fix

# Note: we will see this later with machine learning, but when collinearity is severe, some coefficients may still be highly significant and you may get a false sense of confidence that your results are OK. But the problem is that the standard errors of the coefficients are very high and these coefficients become unstable. With severe collinearity, if you drop a few variables the coefficiens will change substantially. We will learn how to test for this with machine learning and cross validation

install.packages("perturb") # If not installed already
library(perturb) # Contains the colldiag() function to compute the CI

# Run multiple regression on all available variables
lm.fit=lm(medv~.,data=Boston) 
# The colldiag(){perturb} function provides CI collinearity diagnostics
collin.diag = colldiag(mod=lm.fit, scale=FALSE, center=FALSE, 
                       add.intercept=TRUE)
collin.diag # Check out the severe collinearity

# Sometimes standardized regressions reduce collinearity: use scale=TRUE or center=TRUE view collinearity diagnostics with standardized and/or centered variables

collin.diag = colldiag(mod=lm.fit, scale=TRUE, center=FALSE, 
                       add.intercept=TRUE)
collin.diag # Check out the high but less severe collinearity

# If the CI is high but the VIF's (see below) are not so high, then the intercept may be the culprit. Some times the intercept is highly collinear with a variable that stays relatively flat with respect to Y. If this is the case, you can center variables or standardize. Check the condition index when the intercept is removed:

collin.diag = colldiag(mod = lm.fit, scale = TRUE, center = FALSE, 
                       add.intercept = FALSE)
collin.diag # Not so severe any more

# Variance Inflation Factors (VIF): each variable's contribution to multicollinearity

install.packages("car") # # If not installed alread
# {car} is the "Companion to Applied Regression" package
library(car) # Contains the vif() function

# Once you determine the collinearity is a problem, as indicated by the CI the next step is to evaluate the VIF for each variable, to see which variable contributes the most. Think of the VIF of a variable as the R-square you would get by regressing that predictor on all other predictor. But, instead of yielding a 0-1 value (like the R-Square) the VIF converts this R-Square into a formula that provides a factor of how much the standard error is amplified due to its contribution to multicollinearity:

# VIF<5 -- No concern, little or no contribution to collinearity
# 5<VIF<10 -- Some concern, but tolerable
# 10<VIF -- The variable contributes significantly to collinearity
#           The coefficients have a high standard error and are 
#           unstable and unreliable.

# Print variance inflation factors with the vif(){car} function

vif(lm.fit) 

# To model all predictors (.) except age (-):

lm.fit1=lm(medv~.-age,data=Boston) 
summary(lm.fit1)

# The update function allows you to add or remove variables from the model

lm.fit1=update(lm.fit, ~.-age) 
summary(lm.fit1)
vif(lm.fit1)


## Weighted Least Squares (WLS) Regression 

# This material is not in the ISLR textbook

library(MASS) # To read the Boston housing market data

lm.formula <- medv~. 

# If you plan to use the regression formula in various parts of the script, it helps to store the the formula in an object. This is a regression formula for median house values on all other variables

lm.fit=lm(lm.formula,data=Boston) # Fit the model using the formula
summary(lm.fit) # Take note of the R-square

# If you suspect that your model suffers from heteroscedasticity (i.e., uneven error variance), you should inspect the residual plot against perdicted values and also test for heteroscedasticity with the Breush-Pagan bptest{lmtest} test. If the p-value is significant this means that the errors squared are highly correlated with the predicted values, which means that the errors increase or decrease systematically.

# To test for heteroscedasticity

install.packages("lmtest") # If not installed already
library(lmtest) # This package has several tests for lm objects
# Perform a Breusch-Pagan test for Heteroscedasticity
bptest(lm.formula, data=Boston) 
# The p-value is highly significant, so heteroscedasticity is present
plot(lm.fit) # See the residual plot

# Heteroskedasticity does not affect bias of the estimators, but the model is no longer BLUE. That is, it is not the most efficient (i.e., least variance) estimator. To correct for heteroskedasticity we use WLS, which is more efficent.

# If you suspect one predictor (e.g., age) may correlate with the errors you can use the inverse of that variable squared to weight the MSE by that variable

lm.fit.wls1=lm(lm.formula,data=Boston, weights=1/age^2)
summary(lm.fit.wls1) # Slight improvement in R-squared

# If you suspect that it is the dependent variable that is causing the errors to grow then you can use its square to weight the MSE.

lm.fit.wls2=lm(lm.formula,data=Boston, weights=1/medv^2)
summary(lm.fit.wls2) # Slight improvement in R-squared

# The most general, popular and efficient (i.e., lowest variance) WLS method involves 2 steps. Since it is the magnitude and systematic variability of the errors that causes heteroskedasticity, rather than the variables themselves, we can use the inverse of the errors squared as weights. As it turns out, this produces the most efficient WLS when heteroscedasticity is present. 

# Here are the 2 steps to do this:

# (1) Fit a plain OLS model on the data (which we already did above 
#     with lm.fit)

lm.fit=lm(lm.formula,data=Boston) # but we repeat here for convenience
summary(lm.fit)

# (2) Use the errors of the plain OLS fit to do the weighting for the 
#     WLS model.

lm.fit.wls3=lm(lm.formula,data=Boston, weights=1/lm.fit$residuals^2)
summary(lm.fit.wls3) # Slight improvement in R-squared

# Notice that the R-squared are almost pefectly close to 1. In fact, R-squared is no longer meaningful in WLS because it is no longer the proportion of explained variance, but the proportion of weighted variance, which is not very meaningful

# ASIDE

# There are many methods available for least sum of "weighted" least squares. The WLS method described above is pretty standard. But there are other methods and various weighting methods. Iterative Re-Weighted Least Squares (IRLS) is another popular method to compute "robust" estimators when heteroscedasticity is present.

# The MASS library has a residual linear model function rlm(), which does OLS with robust residuals. This method is equivalent to WLS, with one difference. Because the weights are calculated from residuals, but the final residuals are dependent on these weights, the IRLS solves this issue by itereating the model several times, calculating new residuals each time, re-weighting the model, and so on -- i.e., running WLS multiple times in iterations until the residuals don't change any more (the model converges). 

# For practical purposes the WLS method explained above is sufficient. However, IRLS is very effective at dealing with "valid outliers" which are outliers that pull the regression line in one direction or another, but if the data is valid you are not supposed to remove this outlier from the data. The rlm() function uses various weighting methods. Let's run the model above with rlm()

rlm.fit=rlm(lm.formula,data=Boston)
summary(rlm.fit) # Take a look 


## Generalized Linear Methods (GLM)

# The glm() function works just like the linear models function lm(), except that it can be used to fit models for a wider range of distributions, not just normal. For example, it is used to fit logistic regressions. First, let's read the South Africa heart disease data set from the authors' data site:

heart <- read.table(
  "http://statweb.stanford.edu/~tibs/ElemStatLearn/datasets/SAheart.data",
  sep=",",head=T,row.names=1)

# Note: the ISLR text authors have tons of data sets available at:
browseURL("http://statweb.stanford.edu/~tibs/ElemStatLearn/datasets/")
# To read this data, use the command above but change the respective 
# .data file name for the file you are interested.

# Now let's fit a logistic regression model (more on this later)

heart.fit = glm(chd ~ .,data=heart,family=binomial(link="logit"))
summary(heart.fit)

# Notice that the syntax is identical to the lm() function, except that we need to speciy the model family and link function 
# (family=binomial(link="logit"))

# You can also fit OLS regression models with either lm() or glm()

library(MASS) # Needed for the Boston data set
lm.fit=lm(medv~lstat+age,data=Boston) # OLS using lm()
summary(lm.fit) # Check it out

# Now try OLS with glm() using family=gaussian(link="identity")
glm.fit = glm(medv~lstat+age,data=Boston,
              family=gaussian(link="identity"))
summary(glm.fit) # Notice that the results are identical