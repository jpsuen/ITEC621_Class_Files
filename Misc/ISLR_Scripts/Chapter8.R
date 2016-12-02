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