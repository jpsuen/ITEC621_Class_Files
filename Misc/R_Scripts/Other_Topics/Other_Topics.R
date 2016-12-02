#### Other Topics ####

# We will not cover these topics in this class, although I may give you a quick overview if time permits. But I provide the R code for these methods for you to explore if you wish. This code is mostly from the ISLR book and the topics are well explained in the book.


### ISLR Chapter 9 Lab: Support Vector Machines


## Support Vector Classifier

install.packages("e1071") # Contains several machine learning methods
library(e1071)

# Let's generate some observations in two classes, X and Y
set.seed(1)
x=matrix(rnorm(20*2), ncol=2)
y=c(rep(-1,10), rep(1,10))
x[y==1,]=x[y==1,] + 1
plot(x, col=(3-y)) 

# Note that the randomly generated data is not separable by a straight line

# We need to encode the response as a factor variable
dat=data.frame(x=x, y=as.factor(y)) 
# We now use the svm() function to fit a support vector classifier
svmfit=svm(y~., data=dat, kernel="linear", cost=10,scale=FALSE)

# the kernel="linear" argument is used to fit a support vector classifier the scale=FALSE tells SVM NOT to stadardize the variables. In some cases we may want to standardize the data and use scale=TRUE

# Let's plot the SVC fit
plot(svmfit, dat)

# svmfit is the fitted model output and the input data

# Note: the jagged line is really a straight line

# Also, note that the support verctors as noted as crosses -- to find out which ones they are:

svmfit$index

# To get some basic information on the model
summary(svmfit) 
# e.g., 7 support vectors, cost=10, 2 classes, 4 support vectors in 1 and 3 in the other

# Let's try a different cost, e.g., 0.1
svmfit=svm(y~., data=dat, kernel="linear", cost=0.1,scale=FALSE)
plot(svmfit, dat)
svmfit$index
summary(svmfit)

# Let's do cross validation with the tune() function available in the "e1071" library
set.seed(1)

# This is how we can test various cost values

tune.out=tune(svm,y~.,data=dat,kernel="linear",
              ranges=list(cost=c(0.001, 0.01, 0.1, 1,5,10,100)))

# This will display the cross validation errors for each model
summary(tune.out) 
# Note: the cross validation was done with 10-fold

# Best performance is with cost=0.1, but you can list the best model with these 2 commands:

bestmod=tune.out$best.model
summary(bestmod)

# We can use the predict() function to predict the class label of test observations

xtest=matrix(rnorm(20*2), ncol=2)
ytest=sample(c(-1,1), 20, rep=TRUE)
xtest[ytest==1,]=xtest[ytest==1,] + 1
testdat=data.frame(x=xtest, y=as.factor(ytest))

# Using the best model to predict with the test data
ypred=predict(bestmod,testdat) 
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


## Support Vector Machine

# We proceed just like with support vector classifier, but using kernel="polynomial" or kernel="radial" depending on the desired fit method.

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
svmfit=svm(y~., data=dat[train,], kernel="radial", gamma=1, cost=1)
plot(svmfit, dat[train,])
summary(svmfit)

# Given the large number of training errors in the fitted model. So, let's try a larger cost (at the expense of a more irregular decision boundary).

svmfit=svm(y~., data=dat[train,], kernel="radial",gamma=1,cost=1e5)
plot(svmfit,dat[train,])

# Let's inspect the cross validation errors for a few costs and gamma values

set.seed(1)
tune.out=tune(svm, y~., data=dat[train,], kernel="radial", 
              ranges=list(cost=c(0.1,1,10,100,1000),
                          gamma=c(0.5,1,2,3,4)))
summary(tune.out)

# Best model is with cost=1 and gamma=2

# Now let's predict on the test set (i.e., -train)

table(true=dat[-train,"y"], 
      pred=predict(tune.out$best.model,newx=dat[-train,]))


## ROC Curves

install.packages("ROCR") # Needed for ROC curves
library(ROCR)

# Quick function to plot and ROC curve for a given vector
rocplot=function(pred, truth, ...){
  predob = prediction(pred, truth)
  perf = performance(predob, "tpr", "fpr")
  plot(perf,...)}

# Note: use decision.values=T to obtain fitted values. Positive fitted values then the observations are assigned to one class. 

# Negative fitted values are assigned to the other class
svmfit.opt=svm(y~., data=dat[train,], kernel="radial",
               gamma=2, cost=1,decision.values=T)

# Now, the predict() function will output the fitted values
fitted=attributes(predict(svmfit.opt,dat[train,],
                          decision.values=TRUE))$decision.values

par(mfrow=c(1,2))
rocplot(fitted,dat[train,"y"],main="Training Data")

# Let's increase the gamma value to 50

svmfit.flex=svm(y~., data=dat[train,], kernel="radial",
                gamma=50, cost=1, decision.values=T)

fitted=attributes(predict(svmfit.flex,dat[train,],
                          decision.values=T))$decision.values

rocplot(fitted,dat[train,"y"],add=T,col="red")
# This gives a better model (hugging the corner more closely)

# Let's now try the ROC curves on the test data

fitted=attributes(predict(svmfit.opt,dat[-train,],
                          decision.values=T))$decision.values

rocplot(fitted,dat[-train,"y"],main="Test Data")

fitted=attributes(predict(svmfit.flex,dat[-train,],
                          decision.values=T))$decision.values
rocplot(fitted,dat[-train,"y"],add=T,col="red")

# Gamma=2 (svmfit.opt) does better with the test data


## Support Vector Machine with Multiple Classes

# svm() will use one vs. one approach for multiple classes. Let's generate some data

set.seed(1)

x=rbind(x, matrix(rnorm(50*2), ncol=2))
y=c(y, rep(0,50))
x[y==0,2]=x[y==0,2]+2
dat=data.frame(x=x, y=as.factor(y))
par(mfrow=c(1,1))
plot(x,col=(y+1))

svmfit=svm(y~., data=dat, kernel="radial", cost=10, gamma=1)
plot(svmfit, dat)

# Application to Gene Expression Data

library(ISLR)

# the Khan data set has xtrain, xtest, ytrain and ytest data sets already prepared

names(Khan) 
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


### ISLR Chapter 10 Lab: Principal Components Analysis & Clustering


## Principal Components for Descriptive Analytics

# Note: we have covered Principal Components for two applications in this class -- Principal Components Regression and Factor Analysis. But Principal Components is a popular statistical method that simply rotates the covariance matrix of a data set and it is used in a number of statistical applications. This section discusses the use of Principal Components for Descriptive Analytics. This is not the focus of this course but the R code is provide below for your enjoyment.

# Also note that the libraries and functions described in this section are different than the ones covered earlier. There are many paths to Rome.

# Let's look at the USArrests data in the base R pacakge
USArrests
# Rows in this data set are named by states in alphabetical order
states=row.names(USArrests)
states
names(USArrests) # These are the variables collected for each state

# Get the mean for each column (using 1 instead of 2 to get means by row)

apply(USArrests, 2, mean) 
apply(USArrests, 2, var) # Get the variance for each column

# Note that means and variances differ widely. This means that we need to scale variables before doing PCA. Otherwise the Assault variable would dominate the analysis.

# The prcomp() function does principal components in the base R package
pr.out=prcomp(USArrests, scale=TRUE) 

# Notice that we are scaling the variables to have standard deviation of 1. Also note: by default, prcomp() centers variables to have mean of 0

names(pr.out) # Check out the output variables for prcomp()
class(pr.out) # It shows that pr.out is a prcomp() object
summary(pr.out) # Shows various statistics of the principal components

pr.out$sdev # Standard deviations of the principal components

# Squaring the standard deviations gives us the variance explained or "eigenvalues"

pr.out.eigen = pr.out$sdev^2 
pr.out.eigen # Display the eigen values

# Note: one important reason to display eigen values is because it is used by the "Kaiser" criteria to decide how many principal componenents are good enoug. The Kaiser criteria is one of the most popular methods for this. Simply, the average eigen values equal 1 (because variables were scaled). The Kaiser criteria says that you should retain all the principal components with eigenvalues > 1 (i.e., above average variance). In this example, only PC1 meets this criteria.

pr.out$center # Variable means before centering
# Standard deviation (i.e., square root of variance) before scaling
pr.out$scale 
pr.out$rotation # Shows all the rotated principal components

# Display the scree plot
screeplot(pr.out, main="Scree Plot", xlab="Components") 
# Display the scree plot as a line diagram
screeplot(pr.out, type="line", main="Scree Plot") 
# Shows the data and the principal components in one diagram

biplot(pr.out, scale=0) 
# x is a matrix that contains the calculation of the principal component for each data point

pr.out$x 

# ASIDE -- Not in the textbook -- Varimax Rotation

# Note: principal components are often further rotated to "tweak" and cleanup the components a bit more. The rotation makes large factor loadings larger and small factor loadings smaller, such that the most correlated variables are easier to identify because they have larger factor loadings when rotated. The most popular rotation method is the one developed by Kaiser and is called "Varimax". Think of this as further rotating the already rotated principal components just a tad. This is how to rotate the principal components

pr.out.varimax=varimax(pr.out$rotation) 

# Now compare the two sets of principal components and note the the rotated components does a better job at grouping variables. This is a most popular application in survey analysis methods

pr.out.varimax # Varimax rotated components
pr.out$rotation # Original principal components

# Interesting fact: you can rotate the principal components 180 degrees and get the same results

dim(pr.out$x)
biplot(pr.out, scale=0)
pr.out$rotation=-pr.out$rotation # Flip the signs
pr.out$x=-pr.out$x
# The direction changes, but not the line orientation
biplot(pr.out, scale=0) 

# To compute the proportion of variance explained by each principal component, enter:
pve = pr.out.eigen/sum(pr.out.eigen) 
pve # Take a look

# Notice that the first principal component explains 62% of the variance in the data, not bad.

# To plot the proportion of variance explained:
plot(pve, xlab="Principal Component", 
     ylab="Proportion of Variance Explained", ylim=c(0,1),type='b')

# The "cumulative" proportion of variance is useful because it shows how much variance is explained by the first x components. This can be obtained with the cumsum() function
cumsum(pve)

# Notice that the first 2 principal components explain 86.7% of the variance

# Now let's plot this

plot(cumsum(pve), xlab="Principal Component", 
     ylab="Cumulative Proportion of Variance Explained", 
     ylim=c(0,1),type='b')

# Notice that the first 2 principal components


## K-Means Clustering

set.seed(2)
x=matrix(rnorm(50*2), ncol=2)
x[1:25,1]=x[1:25,1]+3
x[1:25,2]=x[1:25,2]-4
km.out=kmeans(x,2,nstart=20)
km.out$cluster

plot(x, col=(km.out$cluster+1), 
     main="K-Means Clustering Results with K=2", 
     xlab="", ylab="", pch=20, cex=2)

set.seed(4)
km.out=kmeans(x,3,nstart=20)
km.out

plot(x, col=(km.out$cluster+1), 
     main="K-Means Clustering Results with K=3", 
     xlab="", ylab="", pch=20, cex=2)

set.seed(3)
km.out=kmeans(x,3,nstart=1)
km.out$tot.withinss
km.out=kmeans(x,3,nstart=20)
km.out$tot.withinss


## Hierarchical Clustering

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

plot(hclust(dist(xsc), method="complete"), 
     main="Hierarchical Clustering with Scaled Features")

x=matrix(rnorm(30*3), ncol=3)
dd=as.dist(1-cor(t(x)))

plot(hclust(dd, method="complete"), 
     main="Complete Linkage with Correlation-Based Distance",
     xlab="", sub="")

# NCI60 Data Example -- see textbook for explanation

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
plot(pve,  type="o", ylab="PVE", 
     xlab="Principal Component", col="blue")

plot(cumsum(pve), type="o", ylab="Cumulative PVE", 
     xlab="Principal Component", col="brown3")

# Clustering the Observations of the NCI60 Data -- see textbook for explanation

sd.data=scale(nci.data)
par(mfrow=c(1,3))
data.dist=dist(sd.data)

plot(hclust(data.dist), labels=nci.labs, 
     main="Complete Linkage", xlab="", sub="",ylab="")

plot(hclust(data.dist, method="average"), labels=nci.labs, 
     main="Average Linkage", xlab="", sub="",ylab="")

plot(hclust(data.dist, method="single"), labels=nci.labs,  
     main="Single Linkage", xlab="", sub="",ylab="")

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

plot(hc.out, labels=nci.labs, 
     main="Hier. Clust. on First Five Score Vectors")

table(cutree(hc.out,4), nci.labs)