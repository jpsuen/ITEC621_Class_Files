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