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