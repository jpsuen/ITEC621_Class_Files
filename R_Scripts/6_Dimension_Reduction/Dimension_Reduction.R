#### 6. DIMENSION REDUCTION ####


### ISLR Chapter 6 (2) Lab: Regularization (Ridge, LASSO, PCR, pLS)

# In this section we explore popular modeling approaches for models with high-dimensionality. The first 2 (Ridge and LASSO) are "shrinkage" methods, which aim to shrink the coefficients of less important variables instead of removing them from the model. The magnitude of the shrinkage can be controlled with a tuning parameter called "shinkage factor" or simply "Lambda".

# The last 2 yield models that use linear combinations of variables, rather than the actual variables. The concept is that by finding directions in which the data have the highest variance (i.e., principal components), maybe the first few directions can explain most of the variability in the data, so that we don't need to use all dimensions.


## ISLR Lab 6.2 (1): Ridge Regression

# Ridge regression computes different coefficients than OLS, so they tend to be more biased than OLS. But by shrinking coefficients that may cause multi-collinearity, we reduce the variance of the model.

# OLS vs. Ridge

# The relationship between the Ridge and OLS coefficients is: Beta(Ridge) = Beta(OLS)/(1+Lambda), where Lambda is a tuning parameter that can take any value:

# If Lambda = 0, ridge and OLS regressions produce the exact same coefficients. 1/(1+Lambda) is the "shrinkage" factor: As Lamda gets largers, the smaller (and less significant) the reulting coefficients get "crushed) by the Lambda weight. If Lambda is extremely large, then all coefficients get crushed. Because the Lambda is not applied on the intercept, extreme values of Lambda yield the null model (just the intercept).

# Because Lambda causes the coefficients to shrink, they are "biased" compared to the unbiased OLS coefficients. So, Ridge regression will generally imrprove the MSE accuracy, but beyond a certain point (usually around 10) the coefficients will be too biased to be useful. Generally speaking Ridge regression works best when OLS estimates have high variance.

install.packages("glmnet") # If not installed already
library(glmnet) # Contains functions for Ridge and LASSO
library(ISLR) # Contains the Hitters data set

# Like we did above, we need to omit records with missing data
Hitters=na.omit(Hitters) 
# Do it again only if you just oppened the Hitters table

# Note: this package has a different syntax and it requires defining an X matrix (predictors) and a Y vector (response values) because this package does not use the y ~ x1 + x2 etc. syntax. we can use the model.matrix(){stats} function to create model matrices with just the predictor variables. Also, we need to remove qualitative variables because glmnet() only takes numerical data.

# X matrix with last column (qualitative) removed
x=model.matrix(Salary~.,data=Hitters[,-1]) 
x # Take a look

y=Hitters$Salary # y vector with just the outcome variable
y # Take a look

# alpha = 0 fits a Ridge Regression for a variety of descending lambda values

ridge.mod=glmnet(x,y,alpha=0) 
# Lambda = 0 --> OLS regression; 
# Lamda = very large --> large shrinkage --> null model (just intercept)

ridge.mod # take a look

# If you want a single value of lambda, for example 0 (i.e., same as OLS regression:

ridge.mod.0=glmnet(x,y,alpha=0, lambda=0) 
coef(ridge.mod.0) # take a look

# Note: Ridge regression standardizes the coefficients to avoid issues of scale invariance (i.e., OLS coefficients are scale invariant, so if we change inches with feet, the coefficients change proportionally; because of the shrinkage factor, Ridge coefficients are not scale invariant, thus the need to standardize the regression). However, Ridge regression can be run without standardizing coefficients simply by specifying "standardize=FALSE".

# Let's try one very large shrinkage penalty (i.e., null model):
ridge.mod=glmnet(x,y,alpha=0, lambda=100000)
coef(ridge.mod) # take a look

# You can also fit models with a sequence of lambda values
ridge.mod=glmnet(x,y,alpha=0, lambda=c(100000,10000,1000,100,10,5,0)) 
coef(ridge.mod) # take a look

# Note that the coefficients are listed from highest to lowest shrinkage (starting with lambda=100000), so it is customary to list a decreasing sequence of lambda values.


ridge.mod$lambda # Take a look
ridge.mod$lambda[3] # List the third lambda
coef(ridge.mod)[,3] # And the resulting coefficients

# Another way to try various Lambda values in a series of Ridge regressions is to create a sequence, for example the command below generates 100 sequence values stored in the object "grid". The sequence takes values from 10 to -2 and grid takes a range of values from 10^10 to 10^-2.

grid=10^seq(10,-2,length=100) 
grid # Take a look

# This command fits a model for each of the 100 lambda values in grid

ridge.mod=glmnet(x,y,alpha=0,lambda=grid) 
ridge.mod # Check it out

# Note: the ridge regression object is a matrix with one row for each predictor and one column for each value of lambda:

coef(ridge.mod)
str(ridge.mod) # To further inspect of the ridge.mod object
dim(coef(ridge.mod)) # Shows the coefficient matrix dimensions
# 20 (variables) x100 (lambdas) matrix

# Aside: l1 Norm (LASSO) vs. l2 Norm (Ridge)

# - l2 Norm: is the sum of the squared coefficients in a Ridge
#      regression. It measures the total amount of shrinkage
#      provided by the particular lambda value used. The smaller
#      l2, the larger the shrinkage. l2 Norm = sum of the model's 
#      squared coefficients

# - l1 Norm: is the sum of the absolute values of the coefficients 
#      in a LASSO regression. Like l2, it measures the total amount
#      of shrinkage obtained by a particular lambda value used. The
#      smaller l1 the larger the shrinkage

# Example: 50th Lambda
ridge.mod$lambda[50] # List the 50th lambda
coef(ridge.mod)[,50] # And its respective coefficients


l2.norm=sqrt(sum(coef(ridge.mod)[-1,50]^2)) 
l2.norm

# You can plot the l2 Norm
plot(ridge.mod)
# For some reason, it reports l1 Norm, but the visual representation of shrinkage is similar to l2 Norm.

# Example: 60th Lambda
ridge.mod$lambda[60]
coef(ridge.mod)[,60]
sqrt(sum(coef(ridge.mod)[-1,60]^2)) # l2 Norm
# l2 Norm[60] = 56.912

# Notice that the l2 Norm 50th Lambda are much smaller (i.e., shrunk) than those of the 60th Lambda (remember that the lambdas are sorte in descending order, so the 50th lambda is larger than the 60th)

# Prediction with Ridge Regression, but first:

# Note: the predict() function with Ridge regression can not only be used to make predictions, but for example, it can be used to obtain coefficients for a new value of lambda by including the keyword type="coefficients"; predict() with newx=[test,] generates predictions for the test data.

# Let's get Ridge coefficients for for lambda=50
predict(ridge.mod,s=50,type="coefficients")[1:20,] 

# The [1:20,] index yields the first 20 predictions. Since we are extracting coefficients for the new lambda it will yield the coefficients for all 20 predictors in the model

# Now let's do some predictions with test data

# Let's break up the data into 1/2 training and 1/2 test
set.seed(1)

# Let's get the random sample for the training data with numbers from 1/2 of the numbers 1 to nrows to be used as indices

train=sample(1:nrow(x), nrow(x)/2) 
train # Take a look
test=(-train)
test # Take a look

# Let's apply the random sample as indices for the response variable

y.test=y[test] 
y.test # Take a look

# Let's fit the Ridge regression model on the training data

# Note: the ISLR text authors use command below, but with a parameter thresh=1e-12. This is a convergence threshold and its explanation is too technical and beyond the scope of this class. The default thresh value is 1e-07, so I use the glmnet() function below without changing the default thresh value.

ridge.mod=glmnet(x[train,], y[train],alpha=0,lambda=grid)
# Check the coefficients, with fewer decimals
print(coef(ridge.mod), digits=2)
plot(ridge.mod)

# Now let's predict on the test data with lambda=4 (i.e., s=4)

ridge.pred=predict(ridge.mod,s=4,newx=x[test,]) # Get predictions (newx) on the test data
ridge.pred # Take a look

# Cross Validation MSE
mean((ridge.pred-y.test)^2) # Calculate the MSE on the test data

# Let's test a very large lambda -- i.e., close to the Null model
ridge.pred=predict(ridge.mod,s=1e10,newx=x[test,]) 
# Note 1e10 means 10 to the 10th power

mean((ridge.pred-y.test)^2) # Calculate the MSE
# The MSE is larger than for the null model than for lambda=4

# Let's try OLS with lambda=0 -- i.e., the OLS model
ridge.pred=predict(ridge.mod,s=0,newx=x[test,],exact=T) 
mean((ridge.pred-y.test)^2)
# The MSE is also larger than for the OLS model than for lambda=4

# OLS regression model yields the same coefficients
lm(y~x, subset=train) 

# compare the 2, they are the same (or very close)
predict(ridge.mod,s=0,exact=T,type="coefficients")[1:20,] 

# Ridge Regression Cross Validation with {glmnet}

# The {glmnet} library comes with the cv.glmnet() function to do cross validation testing of Ridge regressions

set.seed(1) # To get replicable results

# 10-fold cross validation (the default validation). The k-fold value can be changed with the folds argument

# With the training data only
cv.out=cv.glmnet(x[train,],y[train],alpha=0) 

# With the full data
cv.out.full=cv.glmnet(x,y,alpha=0) 

# This function creates the glmnet cross validation object. You can then get information from this object, for example:

# Plotting the MSE against log(lambda)
plot(cv.out)
plot(cv.out.full)

# To find the best lambda where mean cross-validated error is minimized:

bestlam=cv.out$lambda.min 
bestlam # Take a look

bestlam.full=cv.out.full$lambda.min 
bestlam.full # Take a look


# Now you can make predictions with the best lambda

ridge.pred=predict(ridge.mod,s=bestlam,newx=x[test,]) 
mean((ridge.pred-y.test)^2) # Calculate its MSE

# Now, let's re-fit the model with the full data set
out=glmnet(x,y,alpha=0)

# Extract the coefficients for the best lambda
predict(out,type="coefficients",s=bestlam)[1:20,] 


## ISLR Lab 6.2 (2): LASSO Regression

# Identical syntax to Ridge, but uses alpha=1

# Notice that we follow the same sequence than for Ridge above but also notice that some coefficients become 0 with Lasso (which is not the case with Ridge); you can also list non-zero coefficients at the end

# The syntax for LASSO models is identical to the one for Ridge, but with alpha=1

lasso.mod=glmnet(x[train,],y[train],alpha=1,lambda=grid)
plot(lasso.mod) # Plot the coefficient shrinkage visual

set.seed(1)
cv.out=cv.glmnet(x[train,],y[train],alpha=1)
plot(cv.out) # Plot the MSE against log(lambda)

# To find the best lambda where mean cross-validated error is minimized:

bestlam=cv.out$lambda.min #
bestlam # Check it out

# Now you can do cross validation with the best lambda

lasso.pred=predict(lasso.mod,s=bestlam,newx=x[test,])
mean((lasso.pred-y.test)^2)

# Now you can fit the model with all the data

out=glmnet(x,y,alpha=1,lambda=grid)
lasso.coef=predict(out,type="coefficients",s=bestlam)[1:20,]
lasso.coef

# Notice that, in contrast to Ridge, some coefficients shrink all the way down to 0

lasso.coef[lasso.coef!=0] # List only coefficients different than 0


## Principal Components Regression (PCR)

# We will use the {pls} package for PCR and PLS

install.packages("pls") # If not installed already
library(pls) # Has the Principal Components Regression pcr() function
library(ISLR) # Has the Hitters data set

set.seed(2) # To get repeatable results

# The pcr syntax is similar to lm
pcr.fit=pcr(Salary~., data=Hitters,scale=TRUE,validation="CV")

# Note: scale=TRUE is needed to standardize predictors, which is necessary when variables are in different scales (e.g., lbs, feet, etc.).

# Also, validation="CV" does 10-fold cross validation. validation="LOO" does leave-one-out cross validation

# Take a look at the results with CV scores and % variance explained for each factor
summary(pcr.fit) 

# Notes: 

# 1. CV values are root MSE, not MSE, but you can square them

# 2. CV's RMSE's go down as more components are included but notice that after the first few components, the further reduction in RMSE with one more component is not substantial

# 3. Same thing for variance explained; it increases with each addional component, but as you can see, the first few components explain a large proportion of the variance

# This can be visualized with the Scree plot using MSE's
validationplot(pcr.fit,val.type="MSEP") 
validationplot(pcr.fit,val.type="RMSEP") # Or with RMSE 

# Cross validation with PCR

# Let's do PCR in the training data only and evaluate it with the test data set

# Since we previously remove NA's from the Hitters data set, let's remove it from the work environment and re-open it

rm(Hitters)
data(Hitters)
head(Hitters)

set.seed(1)
pcr.fit=pcr(Salary~., data=Hitters,subset=train,scale=TRUE, 
            validation="CV")
validationplot(pcr.fit,val.type="MSEP") 

# Lowest MSE is with 7 components. So, let's predict on the test set with 7 components

pcr.pred=predict(pcr.fit,x[test,],ncomp=7) 
pcr.pred # Take a look at the predicted values
mean((pcr.pred-y.test)^2) # Compute the MSE

# We can now fit the model with 7 components on the full data set
pcr.fit.7=pcr(Salary~., data=Hitters,scale=TRUE, ncomp=7)
summary(pcr.fit.7)

# The command above provides statistic showing:

# 1. How much of the variance of the original predictors (X) is explained by the components (7 components explain 92.26% of the variance).

# 2. How much of the outcome variable variance is explained by the model (7 components explain 46.69% of the variance in Salary)

# The pcr() object is very complex and is full of information:

str(pcr.fit) # Show all the contents of pcr.fit, then for example:
pcr.fit$coefficients # For models using 1, 2 ... M components
pcr.fit$loadings # The linear weight of each variable on each component
pcr.fit$scores # Resulting from applying loadings to each data point


## Partial Least Squares (PLS) Regression

# For PLS we use the same {pls} library, but we use the plsr() function instead.

library(pls) # Contains the plsr() function

set.seed(1)

# The plsr() syntax is identical to the pcr() syntax

pls.fit=plsr(Salary~., data=Hitters,subset=train,scale=TRUE, 
             validation="CV") # Fit the model on training set
summary(pls.fit)

validationplot(pls.fit,val.type="MSEP") # Lowest MSE with 2 components
pls.pred=predict(pls.fit,x[test,],ncomp=2) # Predict on the test set
mean((pls.pred-y.test)^2) # Calculate MSE for the test set

# Now you can re-fit the model with the full data set and 2 components
pls.fit.2=plsr(Salary~., data=Hitters,scale=TRUE,ncomp=2) 
summary(pls.fit.2)