### Introduction to Statistical Learning ###
### Book by James, Witten, Hastie and Tibshirani ###

# INDEX

### General Information About ISLR
### Chapter 2 Lab: Introduction to R
### Chapter 3 Lab: Linear Regression
### Chapter 4 Lab: Classification
### Chapter 5 Lab: Cross-Validation and the Bootstrap
### Chapter 6 Lab: Model Selection and Regularization (Ridge, Lasso, PCR, pLS)
### Chapter 7 Lab: Non-linear Modeling
### Chapter 8 Lab: Decision Trees
### Chapter 9 Lab: Support Vector Machines
### Chapter 10 Lab: Principal Components Analysis & Clustering

### General Information About ISLR

# I ISLR Book

# Book Website
shell.exec("http://www-bcf.usc.edu/~gareth/ISL/index.html")

setwd("C:/AU/Courses/ITEC621/R")

# These scripts require the ISLR package (for the ISRL book)
install.packages("ISLR")

# Datasets needed for ISLR labs

# Contained in the ISLR package:

# Auto: Gas mileage, horsepower, and other information for cars. 
# Boston: Housing values and other information about Boston suburbs. 
# Caravan: Information about individuals offered caravan insurance. 
# Carseats: Information about car seat sales in 400 stores. 
# College: Demographic characteristics, tuition, and more for USA colleges. 
# Default: Customer default records for a credit card company. 
# Hitters: Records and salaries for baseball players. 
# Khan: Gene expression measurements for four cancer types. 
# NCI60: Gene expression measurements for 64 cancer cell lines. 
# OJ: Sales information for Citrus Hill and Minute Maid orange juice. 
# Portfolio: Past values of financial assets, for use in portfolio allocation. 
# market: Daily percentage returns for S& P 500 over a 5-year period. 
# SArrests: Crime statistics per 100,000 residents in 50 states of USA. 
# Wage: Income survey data for males in central Atlantic region of USA. 
# Weekly: 1,089 weekly stock market returns for 21   years.

# Contained in the MASS package:
# Boston: Boston housing data

# Contained in the R Base package:

# Available in the textbook website:
# Advertising.csv  
# Auto.data 
# Auto.csv 
# College.csv 
# Ch10Ex11.csv 
# Credit.csv 
# Income1.csv (Figure 2.2)
# Income2.csv (Figure 2.3) 
# Heart.csv 


### Chapter 2 Lab: Introduction to R

# 2.1 Basic Commands

x <- c(1,3,2,5)
x
x = c(1,6,2)
x
y = c(1,4,3)
length(x)
length(y)
x+y
ls()
rm(x,y)
ls()
rm(list=ls())
?matrix
x=matrix(data=c(1,2,3,4), nrow=2, ncol=2)
x
x=matrix(c(1,2,3,4),2,2)
matrix(c(1,2,3,4),2,2,byrow=TRUE)
sqrt(x)
x^2
x=rnorm(50)
y=x+rnorm(50,mean=50,sd=.1)
cor(x,y)
set.seed(1303)
rnorm(50)
set.seed(3)
y=rnorm(100)
mean(y)
var(y)
sqrt(var(y))
sd(y)

# 2.2 Graphics

x=rnorm(100)
y=rnorm(100)
plot(x,y)
plot(x,y,xlab="this is the x-axis",ylab="this is the y-axis",main="Plot of X vs Y")
pdf("Figure.pdf")
plot(x,y,col="green")
dev.off()
x=seq(1,10)
x
x=1:10
x
x=seq(-pi,pi,length=50)
y=x
f=outer(x,y,function(x,y)cos(y)/(1+x^2))
contour(x,y,f)
contour(x,y,f,nlevels=45,add=T)
fa=(f-t(f))/2
contour(x,y,fa,nlevels=15)
image(x,y,fa)
persp(x,y,fa)
persp(x,y,fa,theta=30)
persp(x,y,fa,theta=30,phi=20)
persp(x,y,fa,theta=30,phi=70)
persp(x,y,fa,theta=30,phi=40)

# 2.3 Indexing Data

A=matrix(1:16,4,4)
A
A[2,3]
A[c(1,3),c(2,4)]
A[1:3,2:4]
A[1:2,]
A[,1:2]
A[1,]
A[-c(1,3),]
A[-c(1,3),-c(1,3,4)]
dim(A)

# 2.4 Loading Data

Auto=read.table("Auto.data")
fix(Auto)
Auto=read.table("Auto.data",header=T,na.strings="?")
fix(Auto)
Auto=read.csv("Auto.csv",header=T,na.strings="?")
fix(Auto)
dim(Auto)
Auto[1:4,]
Auto=na.omit(Auto)
dim(Auto)
names(Auto)

# 2.5 Additional Graphical and Numerical Summaries

plot(cylinders, mpg)
plot(Auto$cylinders, Auto$mpg)
attach(Auto)
plot(cylinders, mpg)
cylinders=as.factor(cylinders)
plot(cylinders, mpg)
plot(cylinders, mpg, col="red")
plot(cylinders, mpg, col="red", varwidth=T)
plot(cylinders, mpg, col="red", varwidth=T,horizontal=T)
plot(cylinders, mpg, col="red", varwidth=T, xlab="cylinders", ylab="MPG")
hist(mpg)
hist(mpg,col=2)
hist(mpg,col=2,breaks=15)
pairs(Auto)
pairs(~ mpg + displacement + horsepower + weight + acceleration, Auto)
plot(horsepower,mpg)
identify(horsepower,mpg,name)
summary(Auto)
summary(mpg)


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


### Chapter 4 Lab: Classification -- Logistic Regression, LDA, QDA, and KNN

# 4.1 The Stock Market Data

library(ISLR)
names(Smarket)
head(Smarket)
dim(Smarket) # To retrieve the dimensions of the Smarket data table
summary(Smarket)
pairs(Smarket) # To plot correlation scaterplots of the data
cor(Smarket) # Will give an error because the variable Direction is not numeric
cor(Smarket[,-9]) # Remove Direction from the correlation matrix
attach(Smarket)

# 4.2 Logistic Regression

# The syntax for logistic regression is the same as glm, but it specifies family=binomial
glm.fit=glm(Direction~Lag1+Lag2+Lag3+Lag4+Lag5+Volume,data=Smarket,family=binomial)
summary(glm.fit)
coef(glm.fit) # To get just the coefficients
odds <- exp(coef(glm.fit)) # To convert Log-Odds to multiplicative change in odds
odds
confint(glm.fit) # To get the 95% confidence intervals of Log-Odds coefficients
exp(confint(glm.fit)) # To (exp a power of e) get the 95% confidence interval of the multiplicative odds

# The predict() function outputs (by default) predicted values for all observations in the training data
glm.probs=predict(glm.fit,type="response") # type = "response" gives the "probability" of Y=1
glm.probs[1:10] # List first 10 
contrasts(Direction) # To display what 0 and 1 mean in the response variable

# Let's convert predicted values into a label "Up" if the probability is > 50%, "Down" othersies
glm.pred=rep("Down",1250) # First make all values "Down"
glm.pred
glm.pred[glm.probs>.5]="Up" # Then replace with "Up" for probability > 50%
# Alternatively, you can use the ifelse() function
glm.pred = ifelse(glm.probs>0.5, "Up", "Down")
glm.pred

# 4.3  Let's build a confusion matrix

table(glm.pred,Direction) # To cross tabulate Prediction (probabilities) with Direction (actual)
(507+145)/1250 # Proportion of observations in the diagonal (i.e., correct predictions)
mean(glm.pred==Direction) # Mean when prediction values match the actual Direction
# Note that both calculations above yield the same value, 52.16%
1-mean(glm.pred==Direction) # Gives the "training error rate" (proportion of off diagonal values)
mean(glm.pred!=Direction) # Same thing

# 4.4 Now, let's create a training model with part of the data and test it with the holdout data

train=(Year<2005) # Creates a vector mamed "train"
# The train vector above contains TRUE/FAlse values for each observation, TRUE for Year<2005
# and FALSE otherwise. This is called a "Boleean" vector. Take a look:
train # Check it out
# Boolean vectors are very useful to partition the data. For example:
Smarket.2005=Smarket[!train,] # Creates a holdout set with all obvervations not on the training set
dim(Smarket.2005) # Inspect the test data set, it has 252 observations and 9 variables
# Use train to get the data in the training set an !train to get data not in the training set
# For example, this creates a vector with the values of the Direction variable for the hold out data set
# Which we will use shortly to build the confusion matrix
Direction.2005=Direction[!train] 
Direction.2005 # Check it out

# 4.5 Let's train the model using only the training data set
glm.fit=glm(Direction~Lag1+Lag2+Lag3+Lag4+Lag5+Volume,data=Smarket,family=binomial,subset=train)
summary(glm.fit)
# Let's predict values in the holdout set
glm.probs=predict(glm.fit,Smarket.2005,type="response")
glm.pred=rep("Down",252) # First, create a test vector with all values equal to "Down"
glm.pred[glm.probs>.5]="Up" # Change the value to "Up" of the predicted probability is > 0.5
table(glm.pred,Direction.2005) # Confusion matrix predicted vs. actual (i.e., Direction)
mean(glm.pred==Direction.2005) # Correct rate
mean(glm.pred!=Direction.2005) # Error rate

# 4.6 Let's do some predictions with a reduced model with only Lag1 and Lag2
glm.fit=glm(Direction~Lag1+Lag2,data=Smarket,family=binomial,subset=train)
glm.probs=predict(glm.fit,Smarket.2005,type="response")
glm.pred=rep("Down",252)
glm.pred[glm.probs>.5]="Up"
table(glm.pred,Direction.2005)
mean(glm.pred==Direction.2005) # Correct rate
mean(glm.pred!=Direction.2005) # Error rate
# Let's make a prediction for 3 observations with data on Lag1 and Lag2
predict(glm.fit,newdata=data.frame(Lag1=c(1.2,1.5),Lag2=c(1.1,-0.8)),type="response")

# 4.7 Linear Discriminant Analysis
require(ISLR)
require(MASS)
# Let's fit the model with the training data
lda.fit=lda(Direction~Lag1+Lag2,data=Smarket,subset=train) # LDA function
lda.fit=lda(Direction~Lag1+Lag2,data=Smarket,subset=Year<2005) # Alternative for subset
lda.fit # Show the output (including the coefficients)
plot(lda.fit) # Let's inspect the plots, shows the LDA combinations that yield Up and Down
# Let's now predict with the test data
lda.pred=predict(lda.fit, Smarket.2005)
names(lda.pred) # Print lda.pred attributes for reference
# Note: predict() returns 3 elements:
# (1) the predicted variable (i.e., "class" in this case)
lda.pred$class # Check out the predicted values
# (2) "posterior" which is actually a matrix, with each column showing the posterior
#     probability that the observation belongs to the first, second, etc. column; and 
head(lda.pred$posterior) # In this case it has 2 columns, for "Down" and "Up"
# (3) "x" which contains the linear discriminants (i.e., linear combination of the
#     coefficients (beta1*lag1+beta2*lag2) reported in lda.fit above
head(lda.pred$x) # Check the posterior probabilities, in this case it has 2 columns, for Down and Up
# x>0.5 predicts "Up", x<0.5 predicts "Down
# Let's build the confusion matrix
lda.class=lda.pred$class # Create a vector with just the predicted values of "class"
table(lda.class,Direction.2005) # Confusion matrix with predicted vs. actual (i.e., Direction)
mean(lda.class==Direction.2005) # Correct rate
mean(lda.class!=Direction.2005) # Error rate

sum(lda.pred$posterior[,1]>=.5)
sum(lda.pred$posterior[,1]<.5)
lda.pred$posterior[1:20,1]
lda.class[1:20]
sum(lda.pred$posterior[,1]>.9)

# 4.8 Quadratic Discriminant Analysis

# The syntax for the qda() function is identical to lda().
attach(Smarket)
train=(Year<2005)
qda.fit=qda(Direction~Lag1+Lag2,data=Smarket,subset=train)
qda.fit # It does not provide linear discriminants like LDA
qda.class=predict(qda.fit,Smarket.2005)$class
table(qda.class,Direction.2005) # Confusion matrix
mean(qda.class==Direction.2005) # Accuracy rate
mean(qda.class!=Direction.2005) # Error rate

# 4.9 K-Nearest Neighbors

# KNN does estimation and prediction in one step, as opposed to Logistic, LDA and QDA
# It requires 4 matrices: (1) training predictors; (2) testing predictors; 
# (3) training class vector (the y's); and (4) value of K (how many near neighbors to use)

library(class) # needed for the knn() function
train.X=cbind(Lag1,Lag2)[train,] # (1) Column bind the two training predictor variables
test.X=cbind(Lag1,Lag2)[!train,] # (2) Column bind the two test predictor variables
train.Direction=Direction[train] # (3) Vector with response values ("Up" or "Down") in the training set
train.Direction # Check it out
set.seed(1) # Set a seed for (to be used by R to break ties if more than K neighbors are equally close)
# Note: this seed is not really necessary, but using it ensures that the results can be reproduced
knn.pred=knn(train.X,test.X,train.Direction,k=1) # knn() function with its 4 matrix parameters
table(knn.pred,Direction.2005) # Confusion matrix
mean(knn.pred==Direction.2005) # Accuracy rate
(83+43)/252 # Same result
mean(knn.pred!=Direction.2005) # Error rate
knn.pred=knn(train.X,test.X,train.Direction,k=3) # Let's try 3 nearest neighbors
table(knn.pred,Direction.2005)
mean(knn.pred==Direction.2005) # Better
# Note: low K is more overfitting; larger K provides a smoother classifier boundary

# 4.10 An Application to Caravan Insurance Data

dim(Caravan)
attach(Caravan)
head(Caravan)
summary(Purchase)
348/5822
# Note on standardization -- when the scale of items may be an issue, it is customary to standardize
# variables, by subtracting the mean and dividing by the standard deviation, so that the mean of the
# stanardized variable is now 0 and the standard deviation is 1 -- scale is no longer an issue
standardized.X=scale(Caravan[,-86]) # The scale() standardizes data (exclude col 86, which is qualitative)

var(Caravan[,1]) # Check the variance of the first column
var(Caravan[,2]) # Check the variance of the first column
var(standardized.X[,1]) # Variance of the standardized variable is 1
mean(standardized.X[,1]) # Mean is zero (or very, very small)
var(standardized.X[,2]) # Same thing

test=1:1000 # Let's use the first 1000 observations as the test set
train.X=standardized.X[-test,] # Matrix (1)
test.X=standardized.X[test,]  # Matrix (2)
train.Y=Purchase[-test] # Matrix (3)
test.Y=Purchase[test]
set.seed(1)
knn.pred=knn(train.X,test.X,train.Y,k=1)
mean(test.Y!=knn.pred) # Error rate
mean(test.Y!="No") # Number of people who buy insurance
table(knn.pred,test.Y)
10/(68+10) # Accuracy of Yes predictions only
knn.pred=knn(train.X,test.X,train.Y,k=3)
table(knn.pred,test.Y)
5/26
knn.pred=knn(train.X,test.X,train.Y,k=5)
table(knn.pred,test.Y)
4/(11+4) # Accuracy of Yes predictions only

# 4.11 Let's use logistic regression with the same data
glm.fit=glm(Purchase~.,data=Caravan,family=binomial,subset=-test)
glm.probs=predict(glm.fit,Caravan[test,],type="response")
glm.pred=rep("No",1000) # Set all responses to "No"
glm.pred[glm.probs>.5]="Yes" # Use the classifier probability>0.5 set to "Yes"
table(glm.pred,test.Y) # We are wrong about predicting "Yes" EVERY TIME
glm.pred=rep("No",1000)
glm.pred[glm.probs>.25]="Yes" # Let's solve this problem by lowering the classifier threshold
table(glm.pred,test.Y)
11/(22+11) # Accuracy rate is 33.3% which is better


### Chapter 5 Lab: Cross-Validation and the Bootstrap

# 5.1 The Validation Set Approach

library(ISLR)
attach(Auto) # Let's use the Auto data
head(Auto)
set.seed(1) # Set the seed to a fixed value to be able to replicate results
train=sample(392,196) # Let's get half of the data into the training set, randomly
lm.fit=lm(mpg~horsepower,data=Auto,subset=train) # Fit the model
summary(lm.fit) # Check out the rsults
mean((mpg-predict(lm.fit,Auto))[-train]^2) # Let's calculate the Mean Square Error (MSE) on the test data
# Note: this command above takes each mpg data point in the full data set and subtracts the
#       corresponding predicted values, thus yielding the prediction error for each obsevation. 
#       Since we are only interested in the MSE for the test data, we apply [-train] to eliminate all the
#       records corresponding to the training set. And we then square each observation and take the
#       mean to yield the MSE. Follow closely the use of parentheses
lm.fit2=lm(mpg~poly(horsepower,2),data=Auto,subset=train) # Let's do the same on various non-linear models
mean((mpg-predict(lm.fit2,Auto))[-train]^2)
lm.fit3=lm(mpg~poly(horsepower,3),data=Auto,subset=train)
mean((mpg-predict(lm.fit3,Auto))[-train]^2)

# If we want another random sample test with 196 observations we need to change the seed,
# otherwise we will get the exact same sample.
set.seed(2)
train=sample(392,196)
lm.fit=lm(mpg~horsepower,subset=train)
mean((mpg-predict(lm.fit,Auto))[-train]^2)
lm.fit2=lm(mpg~poly(horsepower,2),data=Auto,subset=train)
mean((mpg-predict(lm.fit2,Auto))[-train]^2)
lm.fit3=lm(mpg~poly(horsepower,3),data=Auto,subset=train)
mean((mpg-predict(lm.fit3,Auto))[-train]^2)

# 5.2 Leave-One-Out Cross-Validation

# This is done with the cv.glm() function, which works with the glm() function
library(ISLR)
attach(Auto) # Let's use the Auto data
glm.fit=glm(mpg~horsepower,data=Auto)
coef(glm.fit)
library(boot) # This is where the cv.glm is housed
cv.err=cv.glm(Auto,glm.fit) # cv.glm,() Produces a list with the MSE results
# Note: the cv.glm() function above usually has a third argument indicating the value of K
#       which is the number of partitions for K-Fold validation. When omitted, as in
#       this case, K is set to n (total observations) by default, thus yielding a 
#       leave-one-out cross validation

cv.err$delta # The delta component contains the cross validation result
# Note: delta has 2 numbers and they should be almost identical. If not, see below

# 5.3 Let's write a for loop to do 5 polinomials and storing results in a vector

cv.error=rep(0,5) # First, let's initialize the cv.error vector with 5 zeros
cv.error # Check it out
for (i in 1:5){ 
  glm.fit=glm(mpg~poly(horsepower,i),data=Auto) # glm fit for polinomial i
  cv.error[i]=cv.glm(Auto,glm.fit)$delta[1] # cv.error for polinomial i
}
cv.error # Check out the vector with MSE values for each of the 5 polinomials

# 5.4 k-Fold Cross-Validation

set.seed(17) # Set arbitrarily to 17, can be any number
cv.error.10=rep(0,10) # Initialze error vector to 10 zeros for a 10 polinomial for loop this time
cv.error.10 # Check it out

# Note: the for loop below runs 10 regression models, one for each polinomiak, so it may take a while
for (i in 1:10){
  glm.fit=glm(mpg~poly(horsepower,i),data=Auto)
  cv.error.10[i]=cv.glm(Auto,glm.fit,K=10)$delta[1] # 10-Fold validation
  # Note: K is the number of folds, usually 5 to 10.
}
cv.error.10 # Check out the MSE's for the 10 different polinomials

# 5.5 The Bootstrap

# This is not very useful, I think

require(boot) # Contains the bood() function below

# This is a function to compute alpha, per 5.7
alpha.fn=function(data,index){
  X=data$X[index]
  Y=data$Y[index]
  return((var(Y)-cov(X,Y))/(var(X)+var(Y)-2*cov(X,Y)))
}
alpha.fn(Portfolio,1:100) # Computes the alpha for all 100 observations in Portfolio
set.seed(1)
alpha.fn(Portfolio,sample(100,100,replace=T)) # Creates 100 observations of size 100 with replacement
# The procedure above is the long way. Below is the fast way using the boot() function
boot(Portfolio,alpha.fn,R=1000) # Produces 1000 bootstrap estimates for alpha

# 5.6 Estimating the Accuracy of a Linear Regression Model

# Here we use the bootstrap approach to evaluate the variability of regression coefficients
# First we create a function to run regressions on the Auto data set and return the coefficients
boot.fn=function(data,index)
  return(coef(lm(mpg~horsepower,data=data,subset=index)))
boot.fn(Auto,1:392) # We then apply this regression to all 392 observations (a single regression)
# The steps below are the long way
set.seed(1)
boot.fn(Auto,sample(392,392,replace=T))
boot.fn(Auto,sample(392,392,replace=T))
boot(Auto,boot.fn,1000) # This is the fast way with bootstrapping to compute standard errors on 1000 bootstraps
summary(lm(mpg~horsepower,data=Auto))$coef # This provides the coefficients for a single regression model
# Note both methods, plain regression and bootstrap give coefficients and standard errors,
# but the regression method is parametric and the boostrap is not
# Now, let's run a bootstrap regression on the quadratic model
boot.fn=function(data,index)
  coefficients(lm(mpg~horsepower+I(horsepower^2),data=data,subset=index))
set.seed(1)
boot(Auto,boot.fn,1000)
summary(lm(mpg~horsepower+I(horsepower^2),data=Auto))$coef
# Note that because the quadratic model fits the data better, the bootstrap and the plain regression
# produce very similar results


### Chapter 6 Lab: Model Selection and Regularization (Ridge, Lasso, PCR, pLS)

# Lab 1: Subset Selection Methods

# 6.1 ASIDE -- NOT IN THE TEXTBOOK -- Comparing Models with an F-Test

# The sections below explore a number of methods to select variables to include in
# a model. Often the selection will be between a smaller model (i.e., reduced model)
# and one that includes additional variables (i.e., full model). Reduced models
# are more biased, but full models can have problems of multi-dimensionality, like
# multicollinearity. So, it is a balancing act. A commonly used approach is to select
# the best predictor variables based on business knowledge and then test adding a few
# additional variables. When new variables are entered in a model they should be 
# tested with an F-Test to see if thee added variables provide "significant" additional
# predictive power. If the test fails, then they should be removed. There is an easy
# way to do this with the ANOVA function.

# Let's use the baseball data to illustrate
library(ISLR)
head(Hitters) # Baseball data
Hitters=na.omit(Hitters) # To omit records with missing variables

# First fit both models, reduced and full (e.g.):
lm.reduced <- lm(Salary ~ AtBat + Hits + Walks, data=Hitters)
summary(lm.reduced) # Take a look
lm.full <- lm(Salary ~ AtBat + Hits + Walks + Division + PutOuts, data=Hitters)
summary(lm.full) # Take a look
# Use the anova() function to compare models, which performs an F-Test
anova(lm.reduced, lm.full) # Added variables add significant explanatory power
# Note: when the F-Test is significant, most of the coefficients of the added variables
#       should be significant too
lm.fuller <- lm(Salary ~ AtBat + Hits + Walks + Division + PutOuts + Errors, data=Hitters)
summary(lm.fuller) # Take a look
anova(lm.full, lm.fuller) # Added variable does not add significant explanatory power

# 6.2 Best Subset Selection

library(ISLR)
names(Hitters) # Baseball data
head(Hitters)
fix(Hitters) # Only if you need to edit the data
dim(Hitters) # Check the number of records and variables
sum(is.na(Hitters$Salary)) # Count empty salary records (i.e., is.na=TRUE)
Hitters=na.omit(Hitters) # To omit records with missing variables
# Note: this is how the authors do it. I would have created a new table named
#       something like HittersFullData, just to distinguish the two. This example
#       works fine for this data set, but it can be problematice with tables with
#       many variables, where there are always missing values in various fields
sum(is.na(Hitters)) # The sum shouldbe 0 because there should be no more empty fields

install.packages("leaps") # Package that performs subset selection
library(leaps) 
regfit.full=regsubsets(Salary~.,Hitters) # regsubset() searches for the best predictive subsets
# Note: best is based on minimizing RSS; the syntax is identical to regression lm()
summary(regfit.full) # Yields 8 subsets, with the respective variables marked with "*"
# Unless specified by "nvmax" the max number of variables in the subset is 8 by default:
regfit.full=regsubsets(Salary~.,data=Hitters,nvmax=19) # Up to 19 variables in the subset
reg.summary=summary(regfit.full) # Let's save the summary in an object
reg.summary
names(reg.summary) # Check out the subset data names
reg.summary$rsq # Let's inspect R-squares

# Let's plot the subset stats
par(mfrow=c(2,2)) # 2 x 2 layout
plot(reg.summary$rss,xlab="Number of Variables",ylab="RSS",type="l")
plot(reg.summary$adjr2,xlab="Number of Variables",ylab="Adjusted RSq",type="l")
which.max(reg.summary$adjr2) # This command (like which.min) finds the maximum (minimum) value in a vector
points(11,reg.summary$adjr2[11], col="red",cex=2,pch=20) # Draws a single red dot on record 11, which is the max

# Let's keep plotting
plot(reg.summary$cp,xlab="Number of Variables",ylab="Cp",type='l')
which.min(reg.summary$cp)
points(10,reg.summary$cp[10],col="red",cex=2,pch=20)
which.min(reg.summary$bic)
plot(reg.summary$bic,xlab="Number of Variables",ylab="BIC",type='l')
points(6,reg.summary$bic[6],col="red",cex=2,pch=20)

# The regsubsets() function has a built in plot() command to display subset variables (ordered worst to best)
?plot.regsubsets
par(mfrow=c(1,1)) # Back to 1 x 1 layout
plot(regfit.full,scale="r2")
plot(regfit.full,scale="adjr2")
plot(regfit.full,scale="Cp")
plot(regfit.full,scale="bic")
coef(regfit.full,6) # List coefficients for model #6

# 6.3 ASIDE -- NOT IN THE TEXTBOOK

# Here is how to run the full lm() regression models on the subsets
install.packages("HH") # This package (Heiberger & Holland) is a general stats package
# HH works well with regsubsets()
require(HH)
# Note: we will use lm.regsubsets{HH} to pass the model to lm()
regfit.full <- regsubsets(Salary~.,Hitters) # First, get the subsets
regfit.sum <- summary(regfit.full) # Create the corresponding summary object
regfit.sum
regfit.lm <- lm.regsubsets(regfit.full, 3) # For example, runs model #3
summary(regfit.lm)
# IMPORTANT: It does not work well with categorical variables
# In that case it is best to write lm() model by hand, for example
which.min(regfit.sum$bic) # Yields model #6
regfit.sum # Then read the variables with "*" and enter them in the lm() model:
summary(lm(Salary~AtBat+Hits+Walks+CRBI+Division+PutOuts, data=Hitters))

# 6.4 Forward and Backward Stepwise Selection using regsubsets()

regfit.full <- regsubsets(Salary~.,Hitters,nvmax=19) # Uses the "exhaustive" method by default
summary(regfit.full)
regfit.fwd=regsubsets(Salary~.,data=Hitters,nvmax=19,method="forward")
summary(regfit.fwd)
regfit.bwd=regsubsets(Salary~.,data=Hitters,nvmax=19,method="backward")
summary(regfit.bwd)
coef(regfit.full,7)
coef(regfit.fwd,7)
coef(regfit.bwd,7)

# 6.5 ASIDE -- NOT IN THE TECXTBOOK: 

# You can also use lm() or glm() for stepwise regression -- these work better

# First, specify the smallest (null) and largest (full) models
Hitters.null <- lm(Salary ~ 1, data=Hitters) # Null model with only the intercept
Hitters.full <- lm(Salary ~., data=Hitters) # Full model with all variables
# You can inpsect both models:
summary(Hitters.null); summary(Hitters.full)

# Forward selection, start with NULL model as a baseline
Hitters.forward <- step(Hitters.null, scope=list(lower=Hitters.null, upper=Hitters.full), direction="forward", test="F")

# Backward selection, start with FULL model as a baseline
Hitters.backward <- step(Hitters.full, scope=list(lower=Hitters.null, upper=Hitters.full), direction="backward", test="F")

# Stepwise selection, forward starts with NULL model; backward starts with FULL model
Hitters.step.forward <- step(Hitters.null, scope=list(lower=Hitters.null, upper=Hitters.full), direction="both", test="F")
Hitters.step.backward <- step(Hitters.full, scope=list(lower=Hitters.null, upper=Hitters.full), direction="both", test="F")

# We can now treat the results like any lm() object:
summary(Hitters.forward)
summary(Hitters.backward)
summary(Hitters.step.forward)
summary(Hitters.step.backward)

# 6.6 Choosing Among Models using cross-validation

# We need a train and a test set -- we do this randomly in this example
set.seed(1)
# Create a sample of TRUE and FALSE values for the number of rows in the Hitters table with replacement
train=sample(c(TRUE,FALSE), nrow(Hitters),rep=TRUE)
train # Check out the results
test=(!train) # Opposite of the training set
test # Check out the results
regfit.best=regsubsets(Salary~.,data=Hitters[train,],nvmax=19) # Fit on the training subset
summary(reg.fit) # Check it out
test.mat=model.matrix(Salary~.,data=Hitters[test,]) # First make a model X matrix from the test data
# Note: the model.matrix function builds an X matrix (i.e., predictor variable matrix) from the data
test.mat # Check out the text X matrix

# What follows is too tedious, but in essence, it is a loop that runs 19 times, one for each of the
# regsubset() models.

val.errors=rep(NA,19) # This creates a vector with 19 NA's

# Note: in this loop below the number of rows in the test set has to match the
# number of rows in the set predicted below. This will only happen if we eliminate
# all the NA's with the na.omitt() function above

for(i in 1:19){
  coefi=coef(regfit.best,id=i) # Get the coefficients for the i-th model
  pred=test.mat[,names(coefi)]%*%coefi # This multiplies the X values from the test matrix
  # that match coefficient names times the respective coefficients for model i.
  # This is necessary because there is no predict() function for regsubsets()
  # Remember that the prediction is X times the beta coefficients
  # Note the %*% operator is used to multiply 2 "conformable" matrices that can be multiplied)
  val.errors[i]=mean((Hitters$Salary[test]-pred)^2) # Compute the MSE for the i-th model
}

# To see how the i-th pass of the loop works, check it out, for example for i=6

coefi=coef(regfit.best,id=6) # Coefficients for the 6th model
coefi # Take a look
pred=test.mat[,names(coefi)]%*%coefi # Multiply the X time the coefficients
pred # Take a look
val.errors[6]=mean((Hitters$Salary[test]-pred)^2) # Compute the MSE for the i-th model
val.errors[6] # Take a look

val.errors # Take a look at all the 19 MSE values computed by the loop above
which.min(val.errors) # Now find the smallest of the 19 MSE's
# The result is model 10
coef(regfit.best,10) # Get the coefficients for that model

# 6.7 The following creates a function to do the same steps above. Not important for this class

predict.regsubsets=function(object,newdata,id,...){
  form=as.formula(object$call[[2]])
  mat=model.matrix(form,newdata)
  coefi=coef(object,id=id)
  xvars=names(coefi)
  mat[,xvars]%*%coefi
}

# The final predictive model to be used should be re-fitted using the full
# data set, not just the training set. But because the cross validation found
# the 10-variable model to be the best, we now just focus on finding the best
# 10-variable model

# 6.8 The next few lines in Lab 1 are very involved. It is included here only as a reference

regfit.best=regsubsets(Salary~.,data=Hitters,nvmax=19) # Run regsubsets() on the full data
coef(regfit.best,10) 
k=10
set.seed(1)
folds=sample(1:k,nrow(Hitters),replace=TRUE)
cv.errors=matrix(NA,k,19, dimnames=list(NULL, paste(1:19)))

for(j in 1:k){
  best.fit=regsubsets(Salary~.,data=Hitters[folds!=j,],nvmax=19)
  for(i in 1:19){
    pred=predict(best.fit,Hitters[folds==j,],id=i)
    cv.errors[j,i]=mean( (Hitters$Salary[folds==j]-pred)^2)
  }
}

mean.cv.errors=apply(cv.errors,2,mean)
mean.cv.errors
par(mfrow=c(1,1))
plot(mean.cv.errors,type='b')
reg.best=regsubsets(Salary~.,data=Hitters, nvmax=19)
coef(reg.best,11)

# Lab 2: Ridge Regression and the Lasso

# 6.9 Ridge Regression

# Quick note on Ridge regressions. It computes different coefficients:
# Beta(ridge)=Beta(OLS)/(1+Lambda), where Lambda can take any value
# If Lambda = 0, ridge and OLS regressions produce the same coefficients.
# 1/(1+Lambda) is the "shrinkage" factor:
# As Lamda gets largers, the smaller (and less significant) coefficients
# get "crushed) by the Lambda weight. If Lambda is extremely high, then
# all coefficients get crushed. Because the Lambda is not applied on the
# intercept, extreme values of Lambda yield the null model (just the intercept).
# Because Lambda causes the coefficients to shrink, they are "biased" compared to
# the unbiased OLS coefficients. So, Ridge regression will generally imrprove
# the MSE accuracy, but beyond a certain point (usually around 10) the coefficients
# will be too biased to be useful. Generally speaking Ridge regression works best
# when OLS estimates have high variance

install.packages("glmnet")  # We will use the glmnet package
library(glmnet)
Hitters=na.omit(Hitters) # We did this above to omit records with missing variables
# Do it again if you just oppened the Hitters table

# Note: this package has a different syntax and it requires defining
#       an X matrix (predictors) and a Y vector (response values)
#       because this package does not use the y ~ x1 + x2 etc. syntax.
#       Also, we need to remove qualitative variables because glmnet() only takes numerical data 
x=model.matrix(Salary~.,data=Hitters[,-1]) # X matrix with last column (qualitative) removed
x # Take a look
y=Hitters$Salary # y vector
y # Take a look

ridge.mod=glmnet(x,y,alpha=0) # alpha = 0 fits a Ridge Regression for a variety of lambda values
# Lambda = 0 --> OLS regression; Lamda = very large --> large shrinkage --> null model (just intercept)
# It also standardizes the coefficients to avoid issues of scale, but this can be turned off
# with standardize=FALSE
ridge.mod # take a look
ridge.mod=glmnet(x,y,alpha=0, lambda=0) # forces a lambda value of 0 -- i.e., OLS regression
coef(ridge.mod) # take a look
ridge.mod=glmnet(x,y,alpha=0, lambda=100000) # large shrinkage penalty -- i.e., null model
coef(ridge.mod) # take a look
ridge.mod=glmnet(x,y,alpha=0, lambda=c(0,5,10,100,1000,10000,100000)) # Test a few lambdas
coef(ridge.mod) # take a look
# Please note that the coefficients are listed backwards (starting with lambda=100000)
ridge.mod$lambda # Take a look
ridge.mod$lambda[3] # List the third lambda
coef(ridge.mod)[,3] # And the resulting coefficients

grid=10^seq(10,-2,length=100) # This creates a sequence of lambda values to try
grid # Take a look
ridge.mod=glmnet(x,y,alpha=0,lambda=grid) # Fits a model for each lambda in grid
# Note: the ridge regression object is a matris with one row for each predictor
# and one column for each value of lambda
dim(coef(ridge.mod)) # Shows a 20x100 matrix
ridge.mod$lambda[50] # List the 50th lambda
coef(ridge.mod)[,50] # And its respective coefficients
sqrt(sum(coef(ridge.mod)[-1,50]^2))
ridge.mod$lambda[60]
coef(ridge.mod)[,60]
sqrt(sum(coef(ridge.mod)[-1,60]^2))

# 6.10 Prediction with Ridge Regression

# Note: predict() with type="coefficients" provides coefficients for a new lambda
#       predict() with newx=[test,] produces predictions for the test data
predict(ridge.mod,s=50,type="coefficients")[1:20,] # ridge coefficients for for lambda=50
# Note: type="coefficients" will produce coefficients for a new lambda
#       to get actual predictions use the newx attribute shown below
# Let's break up the data into 1/2 training and 1/2 test
set.seed(1)
train=sample(1:nrow(x), nrow(x)/2) # random sample of numbers from 1 to n to be used as indices
train # Take a look
test=(-train)
test # Take a look

y.test=y[test] # Applying the random sample as indices for the response variable
y.test # Take a look
# Let's apply the ridge regression on the training data
ridge.mod=glmnet(x[train,],y[train],alpha=0,lambda=grid, thresh=1e-12)
# And then predict on the test data with lambda=4 (i.e., s)
ridge.pred=predict(ridge.mod,s=4,newx=x[test,]) # Get predictions (newx) on the test data
ridge.pred # Take a look
mean((ridge.pred-y.test)^2) # Calculate the MSE on the test data
ridge.pred=predict(ridge.mod,s=1e10,newx=x[test,]) # Let's test a very large lambda
# Note 1e10 means 10 to the 10th power
mean((ridge.pred-y.test)^2) # Calculate the MSE
ridge.pred=predict(ridge.mod,s=0,newx=x[test,],exact=T) # Let's try OLS with lambda=0
mean((ridge.pred-y.test)^2)

lm(y~x, subset=train) # OLS regression model yields the same coefficients
predict(ridge.mod,s=0,exact=T,type="coefficients")[1:20,] # compare the 2, they are the same

# 6.11 Ridge regression and cross validation using the cv.gemnet() function

set.seed(1)
cv.out=cv.glmnet(x[train,],y[train],alpha=0) # The default is 10-fold validation
# The k-fold value can be changed with the folds argument
plot(cv.out) # Plot log(lambda) against MSE
bestlam=cv.out$lambda.min # Finds the best lambda where mean cross-validated error is minimized
bestlam # Take a look
ridge.pred=predict(ridge.mod,s=bestlam,newx=x[test,]) # Make predictions with the best lambda
mean((ridge.pred-y.test)^2) # Calculate its MSE
out=glmnet(x,y,alpha=0) # Now, let's re-fit the model with the full data set
predict(out,type="coefficients",s=bestlam)[1:20,] # And get coefficients for the best lambda

# 6.12 The Lasso -- identical syntax to Ridge, but uses alpha=1

# Notice that we follow the same sequence than for Ridge above
# but also notice that some coefficients become 0 with Lasso (not with Ridge)
# and you can list non-zero coefficients at the end
lasso.mod=glmnet(x[train,],y[train],alpha=1,lambda=grid)
plot(lasso.mod)
set.seed(1)
cv.out=cv.glmnet(x[train,],y[train],alpha=1)
plot(cv.out)
bestlam=cv.out$lambda.min
bestlam
lasso.pred=predict(lasso.mod,s=bestlam,newx=x[test,])
mean((lasso.pred-y.test)^2)
out=glmnet(x,y,alpha=1,lambda=grid)
lasso.coef=predict(out,type="coefficients",s=bestlam)[1:20,]
lasso.coef
lasso.coef[lasso.coef!=0] # List only coefficients different than 0

# Lab3: PCR and PLS Regression

# 6.13 Principal Components Regression -- need pcr{pls}

install.packages("pls")
library(pls)
set.seed(2)
# The pcr syntax is similar to lm
pcr.fit=pcr(Salary~., data=Hitters,scale=TRUE,validation="CV")
# Note: scale=TRUE is needed to standardize predictors, which is necessary
#       when variables are in different scales (e.g., lbs, feet, etc.).
#       also, validation="CV" does 10-fold cross validation. 
#       validation="LOO" does leave-one-out cross validation
summary(pcr.fit) # Take a look at the results with CV scores and % variance explained for each factor
# Note: CV scores are root MSE, not MSE -- you can square the Root MSE's
validationplot(pcr.fit,val.type="MSEP") # Pring Scree plot using MSE's
# Now, let's do PCR in the training data only and evaluate it in the test data set
set.seed(1)
pcr.fit=pcr(Salary~., data=Hitters,subset=train,scale=TRUE, validation="CV")
validationplot(pcr.fit,val.type="MSEP") # Lowest MSE is with 7 components
pcr.pred=predict(pcr.fit,x[test,],ncomp=7) # So, let's predict on the test set with 7 components
pcr.pred # Take a look
summary(pcr.pred) # Take a look
mean((pcr.pred-y.test)^2) # Compute the MSE
pcr.fit=pcr(Salary~., data=Hitters,scale=TRUE, ncomp=7)
summary(pcr.fit)

# 6.13 ASIDE -- NOT IN TEXTBOOK -- COMMON FACTOR ANALYSIS USING PRINCIPAL COMPONENTS

# Note: Principal Components Analysis (PCA) and Common Factor Analysis (CFA) are two very
#       different things, but they are often confused because they are often used together.
#       PCA is about finding an axis in the data, along wich the variance in the data is
#       maximized, then finding the next orthogonal axis with the second highest variance
#       and so on. The idea is the first few components may explain a high proportion of
#       the variance, which can allow us to build a predictive model with k components,
#       rather than p variables (where k<n). If the p variables are largely uncorrelated
#       k will be very close or equal to p and PCA won't be very useful. Conversely, if 
#       the p variables are largely correlated, then k will be much smaller than p and
#       pCA will be desirable.
#       CFA usually starts with CFA (thus the confusion) to identify the k orthogonal
#       principal components (there are many methods to extract orthogonal components
#       so PCA is only one, but the most popular method). But in CFA the PCA axes are
#       rotated (with the Varimax rotation methdod being the most popular), so that the
#       axes are no longer orthogonal (i.e., perpendicular), but the rotation aims to find
#       stronger commonality among variables, which can be grouped into factors. CFA is most
#       popular in analytics methods for survey data (i.e., to group answers to the many
#       questions asked into a few groups of correlated variables, or factors)

# The example below illustrates CFA with Varimax Rotated PCA, retaining k=5 components

install.packages("psych")
library(psych)
names(Hitters)
# Let's get an example X data frame to illustrate factor analysis
x.Hitters <- data.frame(Hitters$AtBat, Hitters$Hits, Hitters$HmRun, Hitters$Runs, Hitters$RBI,
                        Hitters$Walks,Hitters$CAtBat,Hitters$CHits,Hitters$CHmRun, Hitters$CRuns,
                        Hitters$CRBI, Hitters$CWalks)
cor.Hitters <- cor(x.Hitters) # Get a correlation matrix for X first
cor.Hitters # Take a look
# You can compute the eigenvectors and eigenvluse for any correlation matrix
eigen.vectors.Hitters <- eigen(cor.Hitters)
eigen.vectors.Hitters # Take a look
# Note: the sum of eigenvector scores squared any row or column is always 1
#       i.e., by definition, eigenvectors have a lenght of 1
eigen.values.Hitters <- eigen(cor.Hitters, only.values = TRUE)
eigen.values.Hitters # Take a look

# Then run factor analysis on the correlation matrix
# Let's first look at all 12 PCA's without rotation
factor.Hitters.all <- principal(x.Hitters, nfactors=12, scores=TRUE) # Extract all PCA's
factor.Hitters.all # print results 
# See how the PCA weights decline progressively
factor.Hitters.5 <- principal(x.Hitters, nfactors=5, rotate="varimax", scores=TRUE) # 5 Factor solution

# Note: the solution above forces 5 factors and varimax rotation
factor.Hitters.5 # print results 
factor.Hitters.5$values # Best solutions when eigen values become <1, 3 in this case
factor.Hitters.5$scores # Display factor scores for each observation
factor.Hitters.5$weights # Display factor weights to construct the factor scores
scree(cor.Hitters, factors=TRUE) # Draw a scree plot for the factors
# Let's try a 3-factor solution, which the Scree plot and eigen value<1 suggest
factor.Hitters.3 <- principal(x.Hitters, nfactors=3, rotate="varimax", scores=TRUE)
factor.Hitters.3 # print results 

# 6.14 Partial Least Squares -- need plsr{pls}

set.seed(1)
# The plsr() syntax is identical to the pcr() syntax
pls.fit=plsr(Salary~., data=Hitters,subset=train,scale=TRUE, validation="CV") # Fit on training set
summary(pls.fit)
validationplot(pls.fit,val.type="MSEP") # Lowest MSE with 2 components
pls.pred=predict(pls.fit,x[test,],ncomp=2) # Predict on the test set
mean((pls.pred-y.test)^2) # Calculate MSE for the test set
pls.fit=plsr(Salary~., data=Hitters,scale=TRUE,ncomp=2) # Re-fit the full data set with 2 components
summary(pls.fit)


### Chapter 7 Lab: Non-linear Modeling

# 7.1 The Wage Data

library(ISLR)
attach(Wage)
head(Wage)
# Be careful when you type. The table name is Wage with capital W. Within this table, there is 
# a variable called wage also, but with lower cap "w" which contains the wage for each person
plot(wage, age) # Take a look at the data, visually
Wage$wage # Take a look at all the wages
Wage$age # and all the ages

# 7.2 Polynomial Regression

# Let's fit a polynomial up to the power of 4
fit.poly4=lm(wage~poly(age,4),data=Wage)
coef(summary(fit.poly4))
# Note: the poly() function does not give coefficients for
# x, x-square, x-cube, etc., but for an "orthogonal polinomial" of these
# variables. This sounds complicated, but it is simply like the principal
# components of these variables, such that all 4 variables have a correlation
# of 0. This is important because x and x-square will be highly correlated.
# So, orthogonal polynomials will have less problems with multi-collinearity
# and produce more stable models. However, the interpretation of orthogonal
# polynomials is tricky because it is hard to relate them to the original
# variable x.

# In order to fit the model using the raw variables x, x-squared, x-cube, etc.,
# without converting these variables into an orthogonal polynomial, just us
# the attribute raw=TRUE or raw=T
fit.poly4.raw=lm(wage~poly(age,4,raw=T),data=Wage)
coef(summary(fit.poly4.raw))

# Alternatively, you can elevate to the respective power manually
fit.poly4.I=lm(wage~age+I(age^2)+I(age^3)+I(age^4),data=Wage)
coef(summary(fit.poly4.I))

# Let's do some predictions
# The range function below computes the lower and upper valuse of the age variable range
agelims=range(age)
agelims # Take alook
# This command creates a list of all ages within the age range
age.grid=seq(from=agelims[1],to=agelims[2])
age.grid # Take a look

# Now let's run the predict() function for all the ages in the, including standard errors
preds=predict(fit.poly4.raw,newdata=list(age=age.grid),se=TRUE)
preds # Take a look at the predicted valuse and standard errors for these predictions
# Let's create a confidence interval equal to +/- 2 standard errors
# This produces a matrix with two columns with the lower and upper values for the confidence interval
se.bands=cbind(preds$fit+2*preds$se.fit,preds$fit-2*preds$se.fit)
se.bands # Take a look

# Let's split the plot frame and do some visualization
par(mfrow=c(1,2),mar=c(4.5,4.5,1,1),oma=c(0,0,4,0)) # mar() and oma() control the margins
plot(age,wage,xlim=agelims,cex=.5,col="darkgrey") # Do the plot first
title("Degree-4 Polynomial",outer=T) # Add a title
lines(age.grid,preds$fit,lwd=2,col="blue") # Draw a line with the ages and predicted wage values
matlines(age.grid,se.bands,lwd=1,col="blue",lty=3) # Plot the confidence interval line with age

# One important observation: whether you use the raw x, x=squared, x-cube, etc. or orthogonal
# polynomials, the predicted values will be identica. Take a look
preds2=predict(fit2,newdata=list(age=age.grid),se=TRUE)
max(abs(preds$fit-preds2$fit)) # Notice how small are the differences

# If you would like to dedice the power of the polynomial, you can test how much predictive
# power you add every time you add a higher polynomial term, using the anova() function,
# as explained above for testing reduced vs. extended sets:
fit.1=lm(wage~age,data=Wage) # Just x
fit.2=lm(wage~poly(age,2,raw=T),data=Wage) # Add x-squared
fit.3=lm(wage~poly(age,3,raw=T),data=Wage) # etc.
fit.4=lm(wage~poly(age,4,raw=T),data=Wage)
fit.5=lm(wage~poly(age,5,raw=T),data=Wage)
anova(fit.1,fit.2,fit.3,fit.4,fit.5) # Now let's do an F-Test with ANOVA
# The results support model 3, which has x-cube -- beyond that the power does not increase significantly
# Important note: we used raw variables, but the book example uses orthogonal polynomials.
# This means that the coefficients will be different, but the ANOVA F-Tests should yield similar results
coef(summary(fit.3)) # Note that all coefficients are significant
coef(summary(fit.5)) # But when we add higher power coefficients the model breaksdown

# You can try adding other variables and testing them with F-tests:
fit.1=lm(wage~education+age,data=Wage)
fit.2=lm(wage~education+poly(age,2, raw=T),data=Wage)
fit.3=lm(wage~education+poly(age,3, raw=T),data=Wage)
anova(fit.1,fit.2,fit.3)

# 7.3 Polynomial Logistic Regression

# Let's try the same method with Logistic regression with the dependent variable
# as the probability that Wage is greater than 250K using orthogonal polynomial
fit.logit=glm(I(wage>250)~poly(age,4),data=Wage,family=binomial)
coef(summary(fit.logit)) # Take a look
# Now let's do predictions on the same age range we used above
preds=predict(fit.logit,newdata=list(age=age.grid), se=T)
preds # Take a look
# We can also convert them into probabilities like this:
pfit=exp(preds$fit)/(1+exp(preds$fit)) # Converting log odds to probabilities of Wage>250K
pfit # Take a look
# Now let's compute the confidence interval as predicted value +/- 2 standard errors
# And let's use the log odds
se.bands.logit = cbind(preds$fit+2*preds$se.fit, preds$fit-2*preds$se.fit)
se.bands.logit # Take a look
# And also let's do the same for probabilities:
se.bands = exp(se.bands.logit)/(1+exp(se.bands.logit))

preds=predict(fit.logit,newdata=list(age=age.grid), type="response", se=T)
# Note" type="response" causes the predicted values to be the probabilities
preds # Take a look
# If we don't include this type, the default is the log-odds values
preds=predict(fit,newdata=list(age=age.grid),type="response",se=T)
preds # Take a look
# Now let's do the plotting
plot(age,I(wage>250),xlim=agelims,ylim=c(0,1))
lines(age.grid,pfit,lwd=2, col="blue")
matlines(age.grid,se.bands,lwd=1,col="blue",lty=3)

# We can blow up the plot by changing the ylim to 0,0.2 and dividing the I by 5
# just so that the 1's show up in the 0,0.2 range
plot(age,I(wage>250)/5,xlim=agelims,ylim=c(0,0.2))
lines(age.grid,pfit,lwd=2, col="blue")
matlines(age.grid,se.bands,lwd=1,col="blue",lty=3)

# 7.4 Step Functions

# If we want to fit a Step function, rather than a polynomial we can use the cut() function
# to arbitrarily divide the age data into 4 partitions
table(cut(age,4))
fit.step=lm(wage~cut(age,4),data=Wage)
coef(summary(fit.step)) # Take a look
preds=predict(fit.step,newdata=list(age=age.grid),se=T)
preds # Take a look
plot(age,wage,xlim=agelims,cex=.5,col="darkgrey") # Do the plot first
title("Step Regression",outer=T) # Add a title
lines(age.grid,preds$fit,lwd=2,col="blue") # Draw a line with the ages and predicted wage values
se.bands=cbind(preds$fit+2*preds$se.fit,preds$fit-2*preds$se.fit)
matlines(age.grid,se.bands,lwd=1,col="blue",lty=3) # Plot the confidence interval line with age

# 7.5 ASIDE -- NOT IN TEXTBOOK -- Piecewise Linear Regression

library(ISLR) # Needed to acces the Wage data set
library(splines)
attach(Wage)
# To fit a sequence of regression lines sequentially along the data, we first
# need to figure out the "knots", that is the points where the regression slope
# changes. Take a look at the data first:
plot(age,wage,col="gray")
# Visually, it appears that the data changes directions at ages 25, 40 and 60
# Let' build a linear regression model with 3 knots with 4 different but connected
# regression model to the right and left of each knot.
# To do this, simply, create dummy variables that are 0 to the left of each knot
# and 1 to the right. Then add the interaction term of this dummy variable with age
fit.piecewise=lm(wage~age+I((age-25)*(age>25))+I((age-40)*(age>40))+I((age-60)*(age>60)),data=Wage)
# Note the I() function above creates the respective dummy variables and interaction terms
# Notice that we we first take (age-25), which is like moving the Y axis to age=25
# and then multiply it by (age>25), which will yield 0 for age<=25 and age for age>25
# we then apply the I() function to the whole operation
summary(fit.piecewise)

# Interpretation: the intercept is at -42.47. The regression slope starts with 5.38K more wage
# dollars for every additional year of age, up to age 25. At that point the slope changes to
# 5.38-3.50=1.88K more wage per year of age, upt to age 40. Then, it changes to 1.88-1.98=-0.10K
# less wage dollars for every additional year of age (i.e., almost flat), up to age 60. After that
# it declines at the rate of -0.10-1.40=-1.50K fewer dollars for each additional year of age.
# Let's look at it graphically:
pred=predict(fit.piecewise,newdata=list(age=age.grid),se=T)
plot(age,wage,col="gray")
lines(age.grid,pred$fit,lwd=2)

# 7.6 Splines -- need the "splines" library

# The piecewise linear model above is very interpretable, but if all we want is to make predictions
# Spline regressions are easier to formulate and we can not only fit linear models, but also polynomials,
# so we can connect the knots with curves, rather than lines. Interpretation becomes almost impossible as
# we include polynomial splines, but the prediciton can be more accurate because the regression line can
# follow the data more precisely (but be careful with overfitting). Let's take a look.

library(ISLR) # Needed to acces the Wage data set
library(splines)
attach(Wage)
# Let's start with simple linear spline regression
fit.x1=lm(wage~bs(age,knots=c(25,40,60), degree=1),data=Wage)
# Note: The bs() function builds polynomial splines at the specified cut points
# The "degree" argument specifies the power of the polynomial
# For example, degree=1 models age just linear, so it will produce 4 coefficients:
# 1 for age and then 1 for each of the three segments after each knot. That is,
# if d=1 (degree 1) and K=3 (knots) -- there will be K+1=4 coefficients.

# Take a look:
summary(fit.x1)
pred=predict(fit.x1,newdata=list(age=age.grid),se=T)
plot(age,wage,col="gray")
lines(age.grid,pred$fit,lwd=2)
# You should see 4 different regression lines changing at the knots, almost identical to the
# piecewise linear model above.

# Note: in the model above we arbitrarily set the knots at ages 25, 40 and 60. However if we
# would like to split the spline segments and knots evenly we can use the "df" (degrees of 
# freedom) parameter, rather than the "knots" parameter. If df=4, this means that there are
# 4 spline segments with 3 knots in between. Take a look:
dim(bs(age,df=4, degree=1)) # Creates 4 partitions with 3 knots
attr(bs(age,df=4, degree=1),"knots") # Check out the knot locations
attr(bs(age,df=6),"knots") # Defalut degree is 3 or cubic
# Notice that this also provides 3 knots because 3 df's are taken by the 3 powers of age

fit.x1.df=lm(wage~bs(age,df=4,degree=1),data=Wage)
summary(fit.x1.df)
pred=predict(fit.x1.df,newdata=list(age=age.grid),se=T)
plot(age,wage,col="gray")
lines(age.grid,pred$fit,lwd=2)
# You should see a similar piecewise linear model but with 4 knots evenly spaced.

# 7.7 Polynomial and Cubic Splines

# For some reason "cubic" splines are very popular. One of the reasons is that a polynomial of
# power 3 provides enough curves, inflexion points, peaks and valleys to fit most data sets. Beyond
# the power of 3 the spline becomes too "wiggly", overfitting, and almost impossible to 
# interpret. This is why the B-Spline function bs() uses a polynomial of 3, or "cubic splines"
# as the default, but you can change this with the "degree" attribute.
fit.x3=lm(wage~bs(age,knots=c(25,40,60)),data=Wage) # Fits a cubic spline, i.e., degree=3
# A cubic spline with d=3 degree and k=3 knots will report 1+d+k=7 coefficients: 
# 1 for the intercept; 3 for x, x squared and x cube; and 3 for each of the knots.
# Take a look:
summary(fit.x3)

# Now let's calculate the predicted values and plot them:
pred=predict(fit.x3,newdata=list(age=age.grid),se=T)
plot(age,wage,col="gray")
lines(age.grid,pred$fit,lwd=2)
# Notice that we have a curvilinear model, but it really contains 4 separate curves joined
# at the knots. Let's add confidence interval bands:
lines(age.grid,pred$fit+2*pred$se,lty="dashed")
lines(age.grid,pred$fit-2*pred$se,lty="dashed")

# 7.8 Natural Cubic Splines

# The ns() function produces cubic splines (so there is no "degree" attribute)
fit.natural=lm(wage~ns(age,df=4),data=Wage)
pred=predict(fit.natural,newdata=list(age=age.grid),se=T)
lines(age.grid, pred2$fit,col="red",lwd=2)
plot(age,wage,xlim=agelims,cex=.5,col="darkgrey")
title("Natural Cubic Spline")
lines(age.grid,pred$fit,lwd=2)

# 7.9 Smoothing Spline

fit.smooth1=smooth.spline(age,wage,df=16) # This model specifies an arbitrary df=16
fit.smooth1 # See how the model find the lambda and CV corresponding to df=16
fit.smooth2=smooth.spline(age,wage,cv=TRUE) # This model lets cross-validation find:
fit.smooth2$lambda # The best lambda
fit.smooth2$df # And the corresponding degrees of freedom
plot(age,wage,xlim=agelims,cex=.5,col="darkgrey")
lines(fit.smooth1,col="red",lwd=2)
lines(fit.smooth2,col="blue",lwd=2)
legend("topright",legend=c("16 DF","6.8 DF"),col=c("red","blue"),lty=1,lwd=2,cex=.8)
title("Smoothing Spline")

# 7.10 Local Regression -- using the loess() function

fit=loess(wage~age,span=.2,data=Wage)
fit2=loess(wage~age,span=.5,data=Wage)
plot(age,wage,xlim=agelims,cex=.5,col="darkgrey")
title("Local Regression")
lines(age.grid,predict(fit,data.frame(age=age.grid)),col="red",lwd=2)
lines(age.grid,predict(fit2,data.frame(age=age.grid)),col="blue",lwd=2)
legend("topright",legend=c("Span=0.2","Span=0.5"),col=c("red","blue"),lty=1,lwd=2,cex=.8)

# 7.11 Generalized Additive Models (GAMs)

# Note: in OLS regression, if the predictors are truly independent with 0 correlation, then
# it makes no difference to fit several individual simple linear regression models, one for each
# variable, than fitting a multivariate model with all the variables. The coefficients in both
# modeling options should be identical. Also, the sub of R squares from the individual single
# models will equal the R square of the multivariate model. However, when there is some
# correlation among the predictors, this does not hold true any more. Reduced models will be
# more biased due to corrlation, and larger models will begin to experience multicollinearity
# and other dimensionality problems.

# The idea behind GAMs is that, since we can add individual single models into a multivariate
# full model, you could add instead different transformations (i.e., basis functions) for each 
# variable. Some variables can be modeled as polynomials, some as splines, others as natural
# cubic splines, and so on.

# We can simply use the lm() function with a different basis function for each variable or not, as needed
gam1=lm(wage~ns(year,4)+ns(age,5)+education,data=Wage)

# But the "gam" library provides more options

install.packages("gam")
library(gam)

# We use the s() function for smoothing splines:
# Year with 4 df's and age with 5 df's
# We leave education as is (it is a qualitative variable)
gam.m3=gam(wage~s(year,4)+s(age,5)+education,data=Wage) 
par(mfrow=c(1,3))
plot(gam.m3, se=TRUE,col="blue") # Plot each variable in gam.m3
# We can plot non-gam objects (such as gam1 which is an lm object) with plot.gam
plot.gam(gam1, se=TRUE, col="red")

# we can fit a number of models
gam.m1=gam(wage~s(age,5)+education,data=Wage)
gam.m2=gam(wage~year+s(age,5)+education,data=Wage)

# And then test them with an F test with anova()
anova(gam.m1,gam.m2,gam.m3,test="F")
# Note that gam.m2 is superior to gam.m1, but gam.m3 does not increase predictive power
summary(gam.m3) # Take a look at the summary

# Now let's make some predictions
preds=predict(gam.m2,newdata=Wage) # Predicting on the full training set

# To include local regression in GAM use the lo() function
# Notice that we use both, the s() function on year and lo() on age
gam.lo=gam(wage~s(year,df=4)+lo(age,span=0.7)+education,data=Wage)
plot.gam(gam.lo, se=TRUE, col="green")

gam.lo.i=gam(wage~lo(year,age,span=0.5)+education,data=Wage)
install.packages("akima")
library(akima)
plot(gam.lo.i)

# 7.12 GAM and Logistic Regression

# We can easily fit a logistic model using the I() function in the dependent variable
gam.lr=gam(I(wage>250)~year+s(age,df=5)+education,family=binomial,data=Wage)
summary(gam.lr)
par(mfrow=c(1,3))
plot(gam.lr,se=T,col="green")
table(education,I(wage>250))
gam.lr.s=gam(I(wage>250)~year+s(age,df=5)+education,family=binomial,data=Wage,subset=(education!="1. < HS Grad"))
plot(gam.lr.s,se=T,col="green")



### Chapter 8 Lab: Decision Trees

# 8.1 Fitting Classification Trees -- using the "tree" package

install.packages("tree")
library(tree)
library(ISLR)
attach(Carseats) # A simulated data set of child car seat sales in 400 stores
head(Carseats) # Take a quick look at the data
# For classification trees, we need to convert the predicted variable to binary based on Sales<=8K
High=ifelse(Sales<=8,"No","Yes") # ifelse is a useful function for this
Carseats=data.frame(Carseats,High) # Add the results of "High" to the data
head(Carseats) # Take a look
tree.carseats=tree(High~.-Sales,Carseats) # Fit a tree on all the data, except Sales
summary(tree.carseats) # Take a look at the variables, number of knots, deviance and training error
# Note: the residual mean deviance is based on the log likelyhood function, the smaller the better
plot(tree.carseats) # Display tree
text(tree.carseats,pretty=0) # Display data labels
text(tree.carseats) # Display data labels
tree.carseats # Display the data for every leaf

# Let's now evaluate the test error
set.seed(2)
train=sample(1:nrow(Carseats), 200) # Take 200 observations for the training set
Carseats.train=Carseats[train,]
Carseats.train # Take a look
Carseats.test=Carseats[-train,] # And the rest for the test set.
Carseats.test # Take a look
High.test=High[-train] # Not sure why we need this
tree.carseats=tree(High~.-Sales,Carseats,subset=train) # Fit on the training set
tree.carseats=tree(High~.-Sales,Carseats.train) # Alternatively
tree.pred=predict(tree.carseats,Carseats.test,type="class") # Predict the test set
table(tree.pred,High.test) # Confusion matrix
(86+57)/200 # Accuracy rate = 71.3%

# Let's explore pruning the tree
set.seed(3)
# The cv.tree does the cross validation of the various pruned trees
# Note: FUN=prune.misclass uses the missclassification error for cross validation and prunning
# Othewise, the defualt is deviance
cv.carseats=cv.tree(tree.carseats,FUN=prune.misclass)
names(cv.carseats)
cv.carseats # Despite the name, "dev" reports the cross validation error rate
# Note that the tree with 9 nodes has the smallest cross validation error
par(mfrow=c(1,2))
plot(cv.carseats$size,cv.carseats$dev,type="b") # Plot CV for each tree size
plot(cv.carseats$k,cv.carseats$dev,type="b") # Plot CV for each value of alpha
prune.carseats=prune.misclass(tree.carseats,best=9) # Now prune tree back to 9 nodes
plot(prune.carseats) # Plot the tree
text(prune.carseats,pretty=0) # With labels

# Let's evaluate the tree
tree.pred=predict(prune.carseats,Carseats.test,type="class") # Predict on the test set
table(tree.pred,High.test) # Confusion matrix
(94+60)/200 # 77%, which is an improvement over the full tree and more interpretable

# 8.2 Fitting Regression Trees -- using the Boston{MASS} housing market data set

library(MASS)
library(tree)
set.seed(1)
train = sample(1:nrow(Boston), nrow(Boston)/2) # Training set using the first 1/2 of the data
tree.boston=tree(medv~.,Boston,subset=train) # Fit a regression tree on all the variables in the training set
summary(tree.boston) # Get a quick summary of variables used, terminal nodes and mean deviance (sum of squared errors)
plot(tree.boston) # Plot the tree
text(tree.boston,pretty=0) # And labels
cv.boston=cv.tree(tree.boston) # Let's explore the CV for various pruned trees
plot(cv.boston$size,cv.boston$dev,type='b') # Let's plot size vs. deviance
# The lowest deviance is for the most complex tree
prune.boston=prune.tree(tree.boston,best=5) # But let's prune to 5 terminal nodes
plot(prune.boston)
text(prune.boston,pretty=0)
# Now let's test the trained model on the other 1/2 test data (i.e., -train)
yhat=predict(tree.boston,newdata=Boston[-train,]) # These are the predicted values
boston.test=Boston[-train,"medv"] # These are the actual values
plot(yhat,boston.test) # Let's plot predicted vs. actual
abline(0,1) # And draw a line
mean((yhat-boston.test)^2) # And calculate the means squared error
# Note: the result is 25.05. So, the square root is 5.005 or $5,005 standard error on the prediction

# 8.3 Bagging -- using the randomForest library

?randomForest()

# Note: Bagging is a special case of Random Forest. In Random Forest we use m sample predictors
# from a set of p available predictors and vary the sample predictors from tree to tree to minimize
# correlation among the trees. Bagging is a Random Forest with m=p (i.e., using all predictors)

library(randomForest) # This library contains the Random Forest functions
set.seed(1)
# Let's fit a Random Forest model on all the variables in the training data 
# Note: mtry=13 tells Random Forest to use 13 predictors, which is the full set, thus a Bagging model m=p
# The importance attribute is set to TRUE to obtain each variable's importance in reducing error
bag.boston=randomForest(medv~.,data=Boston,subset=train,mtry=13,importance=TRUE)
bag.boston
# Notice that the model was fit on 13 variables and 500 trees
yhat.bag = predict(bag.boston,newdata=Boston[-train,]) # Let's predict on the test data
plot(yhat.bag, boston.test) # Then plot predicted vs. actual
abline(0,1) # Draw a line
mean((yhat.bag-boston.test)^2) # Get the mean squared error
# Notice that the MSE is almost 1/2 of the regression tree MSE

# To fit a model with a different number of trees, use the ntree=25 (e.g., for 25 trees)
bag.boston=randomForest(medv~.,data=Boston,subset=train,mtry=13,ntree=25)
yhat.bag = predict(bag.boston,newdata=Boston[-train,])
mean((yhat.bag-boston.test)^2)

# 8.4 Random Forests

# Use the same randomForest() function, but specify a smaller number of sampled predictors with mtry
# than the number of available predictors, i.e., m<p. If not specified, m=p/3 is the default

set.seed(1)
rf.boston=randomForest(medv~.,data=Boston,subset=train,mtry=6,importance=TRUE)
yhat.rf = predict(rf.boston,newdata=Boston[-train,])
mean((yhat.rf-boston.test)^2)
# Note that the MSE for this model is even smaller than for the Bagged model
importance(rf.boston) # To view the importance of each variable
# Note that 2 values of importance are reported: 
# (1) Mean decreases in accuracy when the variable is excluded from the model
# (2) Decrease in "impurity" when the data is split by that model, averaged over all trees
# Higher values are best for either
varImpPlot(rf.boston) # We can also plot the results
# The results show that overall community wealth (lstat) and house size (rm) are the most important predictors

# 8.5 Boosting -- using the gbm() package and gbm() function

install.packages("gbm")
library(gbm)
library(MASS)
set.seed(1)
# Let's fit a Boosting model on the Boston data
# Note: distribution="gaussian" (i.e., normal distribution) is used for regression models.
#       For classification problems use distribution="bernoulli"
# Let's fit a model with 5000 trees, limitting the depth of each tree to 4
# and using all available predictors
boost.boston=gbm(medv~.,data=Boston[train,],distribution="gaussian",n.trees=5000,interaction.depth=4)
summary(boost.boston) # Provides relative influence stats and plot
# Note again, that lstat and rm are the most important variables
# Let's plot their partial dependencies to see how predicted price houses vary with lstat and rm
par(mfrow=c(1,2))
plot(boost.boston,i="rm")
plot(boost.boston,i="lstat")
yhat.boost=predict(boost.boston,newdata=Boston[-train,],n.trees=5000) # Predicting on the test data
mean((yhat.boost-boston.test)^2) # Computing the means squared error
# The MSE is 14.62 (you may get a sligthtly different value), which is not much different
# than Bagged and Random Forest models

# To vary the shrinkage factor (lambda) use the shrinkage attribute (the default is 0.01)
boost.boston=gbm(medv~.,data=Boston[train,],distribution="gaussian",n.trees=5000,interaction.depth=4,shrinkage=0.2,verbose=F)
yhat.boost=predict(boost.boston,newdata=Boston[-train,],n.trees=5000)
mean((yhat.boost-boston.test)^2)
# Not much different

### Chapter 9 Lab: Support Vector Machines

# 9.1 Support Vector Classifier -- need the "e1071" package

install.packages("e1071") # Contains several machine learning methods
library(e1071)

# Let's generate some observations in two classes, X and Y
set.seed(1)
x=matrix(rnorm(20*2), ncol=2)
y=c(rep(-1,10), rep(1,10))
x[y==1,]=x[y==1,] + 1
plot(x, col=(3-y)) # Note that the randomly generated data is not separable by a straight line

dat=data.frame(x=x, y=as.factor(y)) # We need to encode the response as a factor variable
# We now use the svm() function to fit a support vector classifier
svmfit=svm(y~., data=dat, kernel="linear", cost=10,scale=FALSE)
# the kernel="linear" argument is used to fit a support vector classifier
# the scale=FALSE tells SVM NOT to stadardize the variables
# In some cases we may want to standardize the data and use scale=TRUE
plot(svmfit, dat) # Let's plot the SVC fit
# svmfit is the fitted model output and the input data
# Note: the jagged line is really a straight line
# Also, note that the support verctors as noted as crosses -- to find out which ones they are:
svmfit$index
summary(svmfit) # To get some basic information on the model
# e.g., 7 support vectors, cost=10, 2 classes, 4 support vectors in 1 and 3 in the other

# Let's try a different cost, e.g., 0.1
svmfit=svm(y~., data=dat, kernel="linear", cost=0.1,scale=FALSE)
plot(svmfit, dat)
svmfit$index
summary(svmfit)

# Let's do cross validation with the tune() function available in the "e1071" library
set.seed(1)
# This is how we can test various cost values
tune.out=tune(svm,y~.,data=dat,kernel="linear",ranges=list(cost=c(0.001, 0.01, 0.1, 1,5,10,100)))
summary(tune.out) # This will display the cross validation errors for each model
# Note: the cross validation was done with 10-fold
# Best performance is with cost=0.1, but you can list the best model with these 2 commands:
bestmod=tune.out$best.model
summary(bestmod)

# We can use the predict() function to predict the class label of test observations
xtest=matrix(rnorm(20*2), ncol=2)
ytest=sample(c(-1,1), 20, rep=TRUE)
xtest[ytest==1,]=xtest[ytest==1,] + 1
testdat=data.frame(x=xtest, y=as.factor(ytest))
ypred=predict(bestmod,testdat) # Using the best model to predict with the test data
table(predict=ypred, truth=testdat$y)

# Let's try to predict with different cost values
svmfit=svm(y~., data=dat, kernel="linear", cost=.01,scale=FALSE)
ypred=predict(svmfit,testdat)
table(predict=ypred, truth=testdat$y)

# Now let's try data that is separable by a straight line
x[y==1,]=x[y==1,]+0.5
plot(x, col=(y+5)/2, pch=19)
dat=data.frame(x=x,y=as.factor(y))
svmfit=svm(y~., data=dat, kernel="linear", cost=1e5)
summary(svmfit)
plot(svmfit, dat)
svmfit=svm(y~., data=dat, kernel="linear", cost=1)
summary(svmfit)
plot(svmfit,dat)

# 9.2 Support Vector Machine

# We proceed just like with support vector classifier, but using kernel="polynomial"
# or kernel="radial" depending on the desired fit method

# Let's generate some random data
set.seed(1)
x=matrix(rnorm(200*2), ncol=2)
x[1:100,]=x[1:100,]+2
x[101:150,]=x[101:150,]-2
y=c(rep(1,150),rep(2,50))
dat=data.frame(x=x,y=as.factor(y))
plot(x, col=y)
# Obviously, the separating boundary is not linear

# Separate 1/2 of the data for the training set
train=sample(200,100)
svmfit=svm(y~., data=dat[train,], kernel="radial",  gamma=1, cost=1)
plot(svmfit, dat[train,])
summary(svmfit)

# Given the large number of training errors in the fitted model
# So, let's try a larger cost (at the expense of a more irregular decision boundary)
svmfit=svm(y~., data=dat[train,], kernel="radial",gamma=1,cost=1e5)
plot(svmfit,dat[train,])

# Let's inspect the cross validation errors for a few costs and gamma values
set.seed(1)
tune.out=tune(svm, y~., data=dat[train,], kernel="radial", ranges=list(cost=c(0.1,1,10,100,1000),gamma=c(0.5,1,2,3,4)))
summary(tune.out)
# Best model is with cost=1 and gamma=2
# Now let's predict on the test set (i.e., -train)
table(true=dat[-train,"y"], pred=predict(tune.out$best.model,newx=dat[-train,]))

# 9.3 ROC Curves

# We use the "ROCR" package

install.packages("ROCR")
library(ROCR)

# Quick function to plot and ROC curve for a given vector
rocplot=function(pred, truth, ...){
  predob = prediction(pred, truth)
  perf = performance(predob, "tpr", "fpr")
  plot(perf,...)}

# Note: use decision.values=T to obtain fitted values
# Positive fitted values then the observations are assigned to one class
# Negative fitted values are assigned to the other class
svmfit.opt=svm(y~., data=dat[train,], kernel="radial",gamma=2, cost=1,decision.values=T)
# Now, the predict() function will output the fitted values
fitted=attributes(predict(svmfit.opt,dat[train,],decision.values=TRUE))$decision.values
par(mfrow=c(1,2))
rocplot(fitted,dat[train,"y"],main="Training Data")

# Let's increase the gamma value to 50
svmfit.flex=svm(y~., data=dat[train,], kernel="radial",gamma=50, cost=1, decision.values=T)
fitted=attributes(predict(svmfit.flex,dat[train,],decision.values=T))$decision.values
rocplot(fitted,dat[train,"y"],add=T,col="red")
# This gives a better model (hugging the corner more closely)

# Let's now try the ROC curves on the test data
fitted=attributes(predict(svmfit.opt,dat[-train,],decision.values=T))$decision.values
rocplot(fitted,dat[-train,"y"],main="Test Data")
fitted=attributes(predict(svmfit.flex,dat[-train,],decision.values=T))$decision.values
rocplot(fitted,dat[-train,"y"],add=T,col="red")
# Gamma=2 (svmfit.opt) does better with the test data

# 9.4 SVM with Multiple Classes

# svm() will use one vs. one approach for multiple classes
# Let's generate some data
set.seed(1)
x=rbind(x, matrix(rnorm(50*2), ncol=2))
y=c(y, rep(0,50))
x[y==0,2]=x[y==0,2]+2
dat=data.frame(x=x, y=as.factor(y))
par(mfrow=c(1,1))
plot(x,col=(y+1))
svmfit=svm(y~., data=dat, kernel="radial", cost=10, gamma=1)
plot(svmfit, dat)

# 9.4 Application to Gene Expression Data

library(ISLR)
names(Khan) # the Khan data set has xtrain, xtest, ytrain and ytest data sets already prepared
dim(Khan$xtrain)
dim(Khan$xtest)
length(Khan$ytrain)
length(Khan$ytest)
table(Khan$ytrain)
table(Khan$ytest)
dat=data.frame(x=Khan$xtrain, y=as.factor(Khan$ytrain))
# Let's try a linear kernel
out=svm(y~., data=dat, kernel="linear",cost=10)
summary(out)
table(out$fitted, dat$y)
# Note that there are no training errors (e.g., data is separable by a straight line)
# NOw let's try it in the test set
dat.te=data.frame(x=Khan$xtest, y=as.factor(Khan$ytest))
pred.te=predict(out, newdata=dat.te)
table(pred.te, dat.te$y)
# Now there are 2 test set errors


### Chapter 10 Lab: Principal Components Analysis & Clustering

# 10.1 Principal Components

# Let's look at the USArrests data in the base R pacakge
USArrests
# Rows in this data set are named by states in alphabetical order
states=row.names(USArrests)
states
names(USArrests) # These are the variables collected for each state
apply(USArrests, 2, mean) # Get the mean for each column (using 1 instead of 2 to get means by row)
apply(USArrests, 2, var) # Get the variance for each column
# Note that means and variances differ widely
# This means that we need to scale variables before doing PCA
# Otherwise the Assault variable would dominate the analysis

# The prcomp() function does principal components in the base R package
pr.out=prcomp(USArrests, scale=TRUE) # Notice that we are scaling the variables to have standard deviation of 1
# Note: by default, prcomp() centers variables to have mean of 0

names(pr.out) # Check out the output variables for prcomp()
class(pr.out) # It shows that pr.out is a prcomp() object
summary(pr.out) # Shows various statistics of the principal components
pr.out$sdev # Standard deviations of the principal components
pr.out.eigen = pr.out$sdev^2 # Squaring the standard deviations gives us the variance explained or "eigenvalues"
pr.out.eigen # Display the eigen values
# Note: one important reason to display eigen values is because it is used by the "Kaiser" criteria
#       to decide how many principal componenents are good enoug. The Kaiser criteria is one of the
#       most popular methods for this. Simply, the average eigen values equal 1 (because variables were scaled)
#       The Kaiser criteria says that you should retain all the principal components with eigenvalues > 1
#       (i.e., above average variance). In this example, only PC1 meets this criteria

pr.out$center # Variable means before centering
pr.out$scale # Standard deviation (i.e., square root of variance) before scaling
pr.out$rotation # Shows all the rotated principal components
screeplot(pr.out, main="Scree Plot", xlab="Components") # Display the scree plot
screeplot(pr.out, type="line", main="Scree Plot") # Display the scree plot as a line diagram
biplot(pr.out, scale=0) # Shows the data and the principal components in one diagram
pr.out$x # x is a matrix that contains the calculation of the principal component for each data point

# ASIDE -- Not in the textbook -- Varimax Rotation

# Note: principal components are often further rotated to "tweak" and cleanup the components 
#       a bit more. The rotation makes large factor loadings larger and small factor loadings
#       smaller, such that the most correlated variables are easier to identify because they
#       have larger factor loadings when rotated. The most popular rotation method is the one
#       developed by Kaiser and is called "Varimax". Think of this as further rotating the already
#       rotated principal components just a tad. This is how to rotate the principal components
pr.out.varimax=varimax(pr.out$rotation) 
# Now compare the two sets of principal components and note the the rotated components does
# a better job at grouping variables. This is a most popular application in survey analysis methods
pr.out.varimax # Varimax rotated components
pr.out$rotation # Original principal components

# Interesting fact: you can rotate the principal components 180 degrees and get the same results
dim(pr.out$x)
biplot(pr.out, scale=0)
pr.out$rotation=-pr.out$rotation # Flip the signs
pr.out$x=-pr.out$x
biplot(pr.out, scale=0) # The direction changes, but not the line orientation

# To compute the proportion of variance explained by each principal component, enter:
pve = pr.out.eigen/sum(pr.out.eigen) 
pve # Take a look
# Notice that the first principal component explains 62% of the variance in the data, not bad.

# To plot the proportion of variance explained:
plot(pve, xlab="Principal Component", ylab="Proportion of Variance Explained", ylim=c(0,1),type='b')

# The "cumulative" proportion of variance is useful because it shows how much variance
# is explained by the first x components. This can be obtained with the cumsum() function
cumsum(pve)
# Notice that the first 2 principal components explain 86.7% of the variance
# Now let's plot this
plot(cumsum(pve), xlab="Principal Component", ylab="Cumulative Proportion of Variance Explained", ylim=c(0,1),type='b')
# Notice that the first 2 principal components

# 10.2 K-Means Clustering -- see textbook for explanations

set.seed(2)
x=matrix(rnorm(50*2), ncol=2)
x[1:25,1]=x[1:25,1]+3
x[1:25,2]=x[1:25,2]-4
km.out=kmeans(x,2,nstart=20)
km.out$cluster
plot(x, col=(km.out$cluster+1), main="K-Means Clustering Results with K=2", xlab="", ylab="", pch=20, cex=2)
set.seed(4)
km.out=kmeans(x,3,nstart=20)
km.out
plot(x, col=(km.out$cluster+1), main="K-Means Clustering Results with K=3", xlab="", ylab="", pch=20, cex=2)
set.seed(3)
km.out=kmeans(x,3,nstart=1)
km.out$tot.withinss
km.out=kmeans(x,3,nstart=20)
km.out$tot.withinss

# 10.3 Hierarchical Clustering -- see textbook for explanations

hc.complete=hclust(dist(x), method="complete")
hc.average=hclust(dist(x), method="average")
hc.single=hclust(dist(x), method="single")
par(mfrow=c(1,3))
plot(hc.complete,main="Complete Linkage", xlab="", sub="", cex=.9)
plot(hc.average, main="Average Linkage", xlab="", sub="", cex=.9)
plot(hc.single, main="Single Linkage", xlab="", sub="", cex=.9)
cutree(hc.complete, 2)
cutree(hc.average, 2)
cutree(hc.single, 2)
cutree(hc.single, 4)
xsc=scale(x)
plot(hclust(dist(xsc), method="complete"), main="Hierarchical Clustering with Scaled Features")
x=matrix(rnorm(30*3), ncol=3)
dd=as.dist(1-cor(t(x)))
plot(hclust(dd, method="complete"), main="Complete Linkage with Correlation-Based Distance", xlab="", sub="")


# 10.4 NCI60 Data Example -- see textbook for explanation

# The NCI60 data
library(ISLR)
nci.labs=NCI60$labs
nci.data=NCI60$data
dim(nci.data)
nci.labs[1:4]
table(nci.labs)

# Principal components analysis on the NCI60 Data
pr.out=prcomp(nci.data, scale=TRUE)
Cols=function(vec){
  cols=rainbow(length(unique(vec)))
  return(cols[as.numeric(as.factor(vec))])
}
par(mfrow=c(1,2))
plot(pr.out$x[,1:2], col=Cols(nci.labs), pch=19,xlab="Z1",ylab="Z2")
plot(pr.out$x[,c(1,3)], col=Cols(nci.labs), pch=19,xlab="Z1",ylab="Z3")
summary(pr.out)
plot(pr.out)
pve=100*pr.out$sdev^2/sum(pr.out$sdev^2)
par(mfrow=c(1,2))
plot(pve,  type="o", ylab="PVE", xlab="Principal Component", col="blue")
plot(cumsum(pve), type="o", ylab="Cumulative PVE", xlab="Principal Component", col="brown3")

# Clustering the Observations of the NCI60 Data -- see textbook for explanation
sd.data=scale(nci.data)
par(mfrow=c(1,3))
data.dist=dist(sd.data)
plot(hclust(data.dist), labels=nci.labs, main="Complete Linkage", xlab="", sub="",ylab="")
plot(hclust(data.dist, method="average"), labels=nci.labs, main="Average Linkage", xlab="", sub="",ylab="")
plot(hclust(data.dist, method="single"), labels=nci.labs,  main="Single Linkage", xlab="", sub="",ylab="")
hc.out=hclust(dist(sd.data))
hc.clusters=cutree(hc.out,4)
table(hc.clusters,nci.labs)
par(mfrow=c(1,1))
plot(hc.out, labels=nci.labs)
abline(h=139, col="red")
hc.out
set.seed(2)
km.out=kmeans(sd.data, 4, nstart=20)
km.clusters=km.out$cluster
table(km.clusters,hc.clusters)
hc.out=hclust(dist(pr.out$x[,1:5]))
plot(hc.out, labels=nci.labs, main="Hier. Clust. on First Five Score Vectors")
table(cutree(hc.out,4), nci.labs)