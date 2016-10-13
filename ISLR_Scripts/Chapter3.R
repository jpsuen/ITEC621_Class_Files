### Chapter 3 Lab: Linear Regression

library(MASS)
library(ISLR)

# 3.1 Simple Linear Regression

fix(Boston) # View and edit the data
names(Boston) # View the data names
lm.fit=lm(medv~lstat,data=Boston) # Simple regression model for Boston housing data
attach(Boston) # Or you can attach the data first
?bolm.fit=lm(medv~lstat) # And then run the regression
lm.fit # Display the regression output object
summary(lm.fit) # Display the summary of results
names(lm.fit)
coef(lm.fit) # Coefficients only
confint(lm.fit) # Confidence intervals only

# Predict medv for 3 values of lstat
predict(lm.fit,data.frame(lstat=(c(5,10,15))), interval="confidence")
predict(lm.fit,data.frame(lstat=(c(5,10,15))), interval="prediction")

# Plot the data
plot(lstat,medv) # Plot the data
abline(lm.fit) # Draw the regression line on the plot
abline(lm.fit,lwd=3) # Change the line weight to 3
abline(lm.fit,lwd=3,col="red") # Change the line's color and weight

# Change other line attributes
plot(lstat,medv,col="red") 
plot(lstat,medv,pch=20)
plot(lstat,medv,pch="+")
plot(1:20,1:20,pch=1:20)
plot(lm.fit) # Display 4 important regression diagnostic plots
par(mfrow=c(2,2)) # Divide the output into a 2x2 frame
plot(lm.fit) # And display the plots again in the new frames
plot(predict(lm.fit), residuals(lm.fit)) # Plot specific diagrams
plot(predict(lm.fit), rstudent(lm.fit))
plot(hatvalues(lm.fit))
which.max(hatvalues(lm.fit))

# 3.2 Multiple Linear Regression

lm.fit=lm(medv~lstat+age,data=Boston) # Multiple regression model with 3 variables on the Boston housing data
summary(lm.fit) # Display regression output summary
lm.fit=lm(medv~.,data=Boston) # Run multiple regression on all available variables
summary(lm.fit) # Review the results
?summary.lm # To see which specific summary data can be displayed
# For example
summary(lm.fit, correlation = TRUE) # Review the results with correlation matrix
summary(lm.fit)$r.squared # Display the R-squared only
# Other data available in the linear model (lm) object
coef(lm.fit)
confint(lm.fit)
plot(lm.fit) # 4 key diagnostic plots
# For a correlation matrix with p-values we need rcorr{Hmisc}
install.packages("Hmisc")
require(Hmisc)
rcorr(as.matrix(Boston), type="pearson") # Data sometimes needs to be converted to a matrix for rcorr()
install.packages("car") # Install Companion to Applied Regression (car) package
library(car) # Invoke the library
vif(lm.fit) # Print variance inflation factors
lm.fit1=lm(medv~.-age,data=Boston) # Regression with all variables, except age (use . and -)
summary(lm.fit1)
lm.fit1=update(lm.fit, ~.-age) # The update function does the same, removing age from the full model

# 3.3 Interaction Terms

summary(lm(medv~lstat*age,data=Boston)) # Output includes 2 main effects (lstat, age) and their interaction
summary(lm(medv~.+lstat*age,data=Boston)) # All variables plus 1 interaction term lstat x age

# 3.4 Non-linear Transformations of the Predictors

# Include a quadratic term in the model
lm.fit2=lm(medv~lstat+I(lstat^2), data=Boston) # The "as is" function I() is needed for this for some reason
summary(lm.fit2)
lm.fit=lm(medv~lstat) # Model withouth quadratic term
anova(lm.fit,lm.fit2) # Test if quadratic model is superior

# ANOVA's F-Test is significant -> Full model (2) provides significan additional explanatory power
par(mfrow=c(2,2)) # Lets split the screen into 2 x 2 frame
plot(lm.fit2) # Display diagnostic plots
lm.fit5=lm(medv~poly(lstat,5), data=Boston) # This will add quadratic, cube, etc. terms up to the 5th power
summary(lm.fit5)
anova(lm.fit,lm.fit5) # Test if quadratic model is superior

# Both, p-values and F-test supports the polinomial variables
summary(lm(medv~log(rm),data=Boston)) # Try a log transformation of the independent variable
summary(lm(log(medv)~log(rm),data=Boston)) # Try a log-log (elasticity) model

# 3.5 Qualitative Predictors

library(ISLR) # Invoke the ISLR library if not already active
data() # This is a useful command to see al the data available in your R environment
data(Carseats) # Load the Carseats data set, which has qualitative variables
fix(Carseats) # Only if you want to edit the data
names(Carseats) # Briefly inspect the variable names

# In the model below, qualitative variables will be converted into multiple dummy variables
# Note: The qualitative variable ShelveLoc has 3 values: Bad, Medium and Good. Because statistics
#       don't work with qualitative variables, R will convert this into 2 variables:
#       ShelveLocGood and ShelveLocMedium. R automatically drops the first value (alphabetically),
#       which would be ShelveLocBad. This necessary to avoid the dummy variable trap because
#       the value of ShelveLocBad depends fully on the values of ShelveLocGood and ShelveLocMedium.
#       When you run this model, the intercept represents the effect for ShelveLocBad and the
#       coefficients for ShelveLocGood and ShelveLocMedium represent the effect increase (decrease)
#       of that variable, relative to ShelveLocBad (the omitted variable). It is important to note
#       that R leaves out the first variable alphabetically, but you can leave out another dummy
#       variable instead if you wish to have a different baseline.

lm.fit=lm(Sales~.+Income:Advertising+Price:Age,data=Carseats)
summary(lm.fit)
attach(Carseats)
contrasts(ShelveLoc) # Provides a quick reference for hos to interpret coefficients

# 3.Aside: Writing Functions

LoadLibraries
LoadLibraries()
LoadLibraries=function(){
  library(ISLR)
  library(MASS)
  print("The libraries have been loaded.")
}
LoadLibraries
LoadLibraries()
