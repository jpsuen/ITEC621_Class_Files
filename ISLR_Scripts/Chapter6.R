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
