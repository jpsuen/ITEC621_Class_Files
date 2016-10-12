#### 5.1 MACHINE LEARNING ####


### ISLR Chapter 5 Lab: Cross Validation (CV) and the Bootstrap


## The Cross Validation Set (CVS) Approach

library(ISLR) # Contains the Auto data set
attach(Auto)
head(Auto)
?Auto # Take a look at the variables

# Set the seed to a fixed value to be able to replicate results

# Note: any routined that does random sampling will give different results each time because the sample will be different. But if you want to re-create identical results, you can set the seed (i.e., first observation in the sample) fixed to any number and if you set the seed to the same number you will get the same result each time.

set.seed(1) 

# Let's get half of the data into the training set, randomly
nrow(Auto)
train=sample(392,196) # Note: we will use these numbers as indices
train # Take a look

# Now let's fit the model on the training data
lm.fit=lm(mpg~horsepower,data=Auto,subset=train) # Or
lm.fit=lm(mpg~horsepower,data=Auto[train,])
summary(lm.fit) # Check out the rsults

# Let's calculate the Mean Square Error (MSE) for ALL the data
lm.fit.mse <- mean((mpg-predict(lm.fit,Auto))^2)
lm.fit.mse

# Let's get the MSE on the training data only [train]
lm.fit.mse.train <- mean((mpg-predict(lm.fit,Auto))[train]^2) 
lm.fit.mse.train

# Notice that the MSE is lower. Why? Because we are calculating the MSE on the same data we use to train the model!!

# Now let's calculate the MSE on the test data [-train]
lm.fit.mse.test <- mean((mpg-predict(lm.fit,Auto))[-train]^2) 
lm.fit.mse.test

mse.all = c("MSE Full"=lm.fit.mse, 
            "MSE Train"=lm.fit.mse.train,
            "MSE Test"=lm.fit.mse.test )
mse.all

# Notice this most tipical pattern for MSE:
# MSE Train < MSE Full < MSE Train
# Why is that? 

# Note: the command above takes each mpg data point in the full data set and subtracts the corresponding predicted values, thus yielding the prediction error for each obsevation. Since we are only interested in the MSE for the test data, we apply [-train] to eliminate all the records corresponding to the training set. And we then square each observation and take the mean to yield the MSE. Follow closely the use of parentheses

# Let's do the same on various non-linear models

lm.fit2=lm(mpg~poly(horsepower,2),data=Auto,subset=train) 
lm.fit2.mse <- mean((mpg-predict(lm.fit2,Auto))[-train]^2)
lm.fit2.mse

lm.fit3=lm(mpg~poly(horsepower,3),data=Auto,subset=train)
lm.fit3.mse <- mean((mpg-predict(lm.fit3,Auto))[-train]^2)
lm.fit3.mse

mse.all = c(mse.all, 
            "MSE Poly 2"=lm.fit2.mse, 
            "MSE Poly 3"=lm.fit3.mse)
mse.all
# Which model has the lowest MSE

# If we want another random sample test with 196 observations we need to change the seed, otherwise we will get the exact same sample.

# Try this yourself

set.seed(2)
train=sample(392,196)
lm.fit=lm(mpg~horsepower,subset=train)
mean((mpg-predict(lm.fit,Auto))[-train]^2)
lm.fit2=lm(mpg~poly(horsepower,2),data=Auto,subset=train)
mean((mpg-predict(lm.fit2,Auto))[-train]^2)
lm.fit3=lm(mpg~poly(horsepower,3),data=Auto,subset=train)
mean((mpg-predict(lm.fit3,Auto))[-train]^2)


## Leave-One-Out Cross-Validation (LOOCV)

# LOOCV can be done with the cv.glm() function in the {boot} package, which works well with the glm() function

library(boot) # Contains the cv.glm() function
library(ISLR) # Contains the Auto data set
attach(Auto)

# Note that the model below is a plain OLS model, but we need to use the glm() function because the cv.glm() requires a glm() object.

lm.fit=lm(mpg~horsepower,data=Auto)
summary(lm.fit)

# With identical result to
glm.fit=glm(mpg~horsepower,data=Auto)
summary(glm.fit)

# cv.glm,() Produces a list with the MSE results
?cv.glm()
cv.loo <- cv.glm(Auto,glm.fit) 

# Note: the cv.glm() function above usually has a third argument indicating the value of K which is the number of partitions for K-Fold validation. When omitted, as in this case, K is set to n (total observations) by default, thus applying LOOCV

# The delta component contains the MSE cross validation results 

cv.loo$delta 

# Note: delta has 2 numbers and they should be almost identical. If not, see below. The first delta value is the actual raw cross-validation MSE. To list just the CV MSE:

cv.loo$delta[1]

# Let's write a for loop to do 5 polinomials and storing results in a vector

# First, let's initialize the cv.error vector with 5 zeros
cv.error=rep(0,5) 
cv.error # Check it out

# Note: the loop below may take a little while to run

for (i in 1:5){ 
  glm.fit=glm(mpg~poly(horsepower,i),data=Auto) # fit for polinomial i
  cv.error[i]=cv.glm(Auto,glm.fit)$delta[1] # cv.error for polinomial i
}

# Check out the vector with MSE values for each of the 5 polinomials
cv.error 
# Looks like the 5th polynomial is the best, but the second is not bad 


## k-Fold Cross-Validation (KFCV)

# Let's start with a simple k-fold CV for, say K=10

library(boot) # Contains the cv.glm() function
library(ISLR) # Contains the Auto data set
attach(Auto)

glm.fit=glm(mpg~horsepower,data=Auto) # Fit a glm model
summary(glm.fit)

# TO view the full cv.glm output:
cv.10K <- cv.glm(Auto,glm.fit,K=10)
# The first $delta value is the raw cross-validation estimate of the prediction error

# TO view just the cross-validation MSE:
cv.10K$delta[1]

# Now let's do a loop to fit 10 polynomial models and calculate the respective cross validation MSE's.

set.seed(17) # Set arbitrarily to 17, can be any number

# Initialze error vector to 10 zeros for a 10 polinomial for loop this time

cv.error.10=rep(0,10) 
cv.error.10 # Check it out

# Note: the for loop below runs 10 regression models, one for each polinomial, so it may take a while too

for (i in 1:10){
  glm.fit=glm(mpg~poly(horsepower,i),data=Auto)
  cv.error.10[i]=cv.glm(Auto,glm.fit,K=10)$delta[1] # 10-Fold validation
  # Note: K is the number of folds, usually 5 to 10.
}

# Check out the MSE's for the 10 different polinomials
cv.error.10

# Looks like the 6th polynomial is the best (this may change with different samplings), but I think such a model would be too complex to interpret. You should use this polynomial if your goal is prediction accuracy, but you would be better off with the second polynomial if your goal is interpretation.

# Now let's try 4 different values of K=5,10,15,20 for a simple linear regression

set.seed(1) # Set arbitrarily to 1, can be any number
cv.error.4=rep(0,4) # Initialze error vector with 4 zeros
cv.error.4 # Check it out

# Initialze another vector to keep the values of K for plotting
cv.k=rep(0,4) 
cv.k # Check it out

glm.fit=glm(mpg~horsepower,data=Auto) # Fit a glm model
summary(glm.fit)

# Note: the for loop below runs 4 regression models, one for each value of K

for (i in 1:4){
  cv.k[i]=i*5
  cv.error.4[i]=cv.glm(Auto,glm.fit,K=i*5)$delta[1]
} 
# i*5-Fold (5,10,15,20) validation

cv.k # Check out the K values
cv.error.4 # Check out the MSE's for the 10 different polinomials
cbind(cv.k,cv.error.4) # List K values with their MSE side by side

# "l" yields a line
plot(cv.k, cv.error.4,"l", ylab="MSE", xlab="K-Fold") 

# How about LOOCV?

cv.error.LOOCV=cv.glm(Auto,glm.fit)$delta[1]
cv.error.LOOCV 
# Not much better than K=10 and slightly worse than K=20


## The Bootstrap

# Try on your own -- not covered in class, but I provide the code for you to explore if you wish

require(boot) # Contains the boot() function below

# This is a function to compute alpha, per 5.7

alpha.fn=function(data,index){
  X=data$X[index]
  Y=data$Y[index]
  return((var(Y)-cov(X,Y))/(var(X)+var(Y)-2*cov(X,Y)))
}

# Computes the alpha for all 100 observations in Portfolio
alpha.fn(Portfolio,1:100) 

set.seed(1)

# This creates 100 observations of size 100 with replacement
alpha.fn(Portfolio,sample(100,100,replace=T)) 

# The procedure above is the long way. Below is the fast way using the boot() function

# This produces 1000 bootstrap estimates for alpha
boot(Portfolio,alpha.fn,R=1000) 

# Estimating the Accuracy of a Linear Regression Model with the bootstrap method

# Here we use the bootstrap approach to evaluate the variability of regression coefficients. First we create a function to run regressions on the Auto data set and return the coefficients

boot.fn=function(fndata,index)
  return(coef(lm(mpg~horsepower,data=fndata,subset=index)))

# We then apply this regression to all 1 to 392 observations (a single regression)

boot.fn(Auto,1:392) 

# The steps below are the long way
set.seed(1)
boot.fn(Auto,sample(392,392,replace=T))

# This is the fast way with bootstrapping to compute standard errors on 1000 bootstraps
boot(Auto,boot.fn,1000) 

# This provides the coefficients for a single regression model
summary(lm(mpg~horsepower,data=Auto))$coef 

# Note both methods, plain regression and bootstrap give coefficients and standard errors, but the regression method is parametric and the boostrap is not. Now, let's run a bootstrap regression on the quadratic model 

boot.fn=function(data,index)
  coefficients(lm(mpg~horsepower+I(horsepower^2),data=data,subset=index))
set.seed(1)
boot(Auto,boot.fn,1000)
summary(lm(mpg~horsepower+I(horsepower^2),data=Auto))$coef

# Note that because the quadratic model fits the data better, the bootstrap and the plain regression produce very similar results