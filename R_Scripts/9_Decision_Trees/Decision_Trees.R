#### 9. DECISION TREES ####


### ISLR Chapter 8 Lab: Decision Trees

# Decision trees are mainly used for classification models, but they can also be used for association problems with regression trees. We focus primarily on classification trees, but we cover regression trees below for completeness.


## Regression Trees

library(MASS) # Contains the Boston data set
library(tree) # Needed to fit decision trees

# Say, for example, that you have 2 predictors. A regression tree will find which of the two variables divides the observations more accurately into two portions, and at which value of that variable, and then assigns a predicted value for each of the two portions equal to their respective response value mean. It then takes each of the two portions and further subdivides them, either with the same variable or the other variable, whichever separates the portion better. 

# The criteria for evaluating which variable to use for the split and at which value is based on minimizing the MSE. The process continues with further subdivisions of the data. Each subdividision portion is called a "leaf" and the splitting point is called a "node". In principle, one could continue the data splitting until each data point is a leaf, but this would overfit the data. The methods below help decide where to stop "growing" the tree using cross validation methods.

# Let's illustrate a regression tree with the Boston data set

set.seed(1) # To get replicable results

# Training set using the first 1/2 of the data
train = sample(1:nrow(Boston), nrow(Boston)/2) 

# Fit a regression tree on all the variables in the training set using the tree(){tree} function
tree.boston=tree(medv~.,Boston,subset=train) 

# Get a quick summary of variables used, terminal nodes and mean deviance (sum of squared errors)
summary(tree.boston) 
# The summary shows the number of terminal nodes and it's respective residual mean deaviance

# Now let's visualize the tree
plot(tree.boston) # Plot the tree
# Oops!! No labels
text(tree.boston,pretty=0) # Let's make it pretty and add labels

# Cross validation of tree results. Let's explore the CV for various pruned trees
cv.boston=cv.tree(tree.boston) 

# Let's plot tree size (number of terminal nodes) vs. deviance
# Note: type='b' is for "both", points and lines
plot(cv.boston$size,cv.boston$dev,type='b') 
# Notice that the lowest deviance is for the most complex tree

# But let's prune to just 5 terminal nodes
prune.boston=prune.tree(tree.boston,best=5) 
plot(prune.boston)
text(prune.boston,pretty=0)

# Now let's test the trained model on the other 1/2 test data (i.e., -train)

yhat=predict(tree.boston,newdata=Boston[-train,]) 
boston.test=Boston[-train,"medv"] # These are the actual values
boston.test # Take a quick look
plot(yhat,boston.test) # Let's plot predicted vs. actual
abline(0,1) # And draw a line
mean((yhat-boston.test)^2) # And calculate the MSE

# Note: the square root of the MSE is the standard error on the predicted values


## Classification Trees

# Classification trees work just like regression trees, but the response variable is binary (i.e., a classification). While decision are generally not as precise as logistic regression models, and despite the fact that they are not very useful for interpretation there is an abundance of sophisticated decision tree methods (e.g., Bootstrap Aggregation, Random Forests, Boosting, etc.), which can be quite accurate for prediction. 

# These tree methods differ on things like: how the tree branching happens; how much to grow a tree; when to prune the tree; which variables to use for splitting leaves; etc. We discuss some of these methods below. But first we start with just plain trees.

install.packages("tree") # If not installed already
library(tree) # Needed to fit classification trees
library(ISLR) # Contains the Carseats data set

# Carseats is simulated data set of child car seat sales in 400 stores
attach(Carseats) 
head(Carseats) # Take a quick look at the data

# For classification trees, if the response variable is not binary, we need to convert it to binary using some criteria,  for example Sales<=8K

# ifelse is a useful function for this
High=ifelse(Sales<=8,"No","Yes") # Storing the results in object "High"

# Add the results of "High" to the data
Carseats=data.frame(Carseats,High) 
head(Carseats) # Check out that the "High" variable was added

# Let's fit a tree on all the data, except Sales 

tree.carseats=tree(High~.-Sales,Carseats) 
# Inspect the number of knots, deviance and training error
summary(tree.carseats) 

# Note: the residual mean deviance is based on the log likelyhood function, the smaller the better. By itself, it is not a very useful fit statistic, but it is excellent to compare various tree modesl -- the model with the smallest deviance (between actual and predicted values is better)

# Now let's analyze the tree visually

plot(tree.carseats) # Display tree
text(tree.carseats, pretty=0) # Display data labels

# pretty=0 displays category names for categorical variables, rather than just a letter. please refer to
?text.tree
tree.carseats # Display the data for every leaf

# Let's now evaluate the test error

set.seed(2)

# Take 200 observations for the training set (you can try other training/test samplings)

train=sample(1:nrow(Carseats), 200) 
Carseats.train=Carseats[train,]
Carseats.train # Take a look
Carseats.test=Carseats[-train,] # And the rest for the test set.
Carseats.test # Take a look

# Let's create the "High.test" object from the "High (Yes/No)" object we computed for all the response values
High.test=High[-train]

# Note, the command above does not yield the opposite of High. Rather it creates the High.test vector with all the observations that are not in the training set (i.e., the test set). Remember that the brackets [] are used as an index, not for math operations

# Let's do some machine learning

# Fit the model on the training set
tree.carseats=tree(High~.-Sales,Carseats,subset=train) 
tree.carseats=tree(High~.-Sales,Carseats.train) # Alternatively
# Predict the test set
tree.pred=predict(tree.carseats,Carseats.test,type="class") 
table(tree.pred,High.test) # Confusion matrix
(86+57)/200 # Accuracy rate = 71.3%

# Let's explore pruning the tree

set.seed(3)

# cv.tree() does the cross validation of the various pruned trees

# Note: FUN=prune.misclass uses the misclassification error for cross validation and prunning. Othewise, the default is deviance

cv.carseats=cv.tree(tree.carseats,FUN=prune.misclass)
names(cv.carseats)

# Note: "dev" reports the cross validation error rate
cv.carseats 
# Note the tree with the smallest cross validation error ("dev")

# Let's inspect the tree visually

par(mfrow=c(1,2)) # Let's split the graphics screen

# Let's plot CV for each tree size
plot(cv.carseats$size,cv.carseats$dev,type="b") 

# Plot CV for various k-fold values
plot(cv.carseats$k,cv.carseats$dev,type="b") 

# Now prune tree back to 9 nodes
prune.carseats=prune.misclass(tree.carseats,best=9) 
plot(prune.carseats) # Plot the tree
text(prune.carseats,pretty=0) # With labels

# Let's evaluate the tree

# Predict on the test set
tree.pred=predict(prune.carseats,Carseats.test,type="class") 
table(tree.pred,High.test) # Confusion matrix
(94+60)/200 
# 77%, which is an improvement over the full tree and more interpretable


## Bootstrap Aggregation -- Bagging

# The tree methods illustrated in the remainder of this section rely on the modeling of more than one tree and then aggregating the result. The methods differ in what varies from tree to tree.

# Bagging stands for "bootstrap aggregation". Bootstrap means to draw a random sample to fit a tree, and then repeat this many times with new samples with replacement. Each tree includes all variables in the model and a subset of observations. The results are then aggregated. The rationale behind this method is that bootstrapping and aggregating reduces variance and tends to produce more accurate and stable results than single trees. The main tuning parameter in Bagging is the size of the random sample and the number of trees fitted and aggregated.

# As we discuss below, Bagging is a special case of Random Forest. The main difference is that in Random Forest, the number of variables m used to fit the individual trees is a subset of all the available variables p, so m<=p. In Bagging, m=p, thus a special case of Random Forest. Therefore, both methods use the same library and function randomForest(){randomForest}.

library(randomForest) 
?randomForest()
library(MASS) # Contains the Boston housing data set
set.seed(1) # To get repeatable results

# Let's re-create the Boston training subset we created above. No need to do this if you have not quit R since you computed the training sample above. Otherwise, re-creat "train"

train = sample(1:nrow(Boston), nrow(Boston)/2) 
boston.test=Boston[-train,"medv"]

# Let's fit a Bagging model (i.e., Random Forest with all variables included in the training data. 

# IMPORTANT: we are fitting a bagged regression tree, but the same method applies to bagged classification trees

bag.boston=randomForest(medv~.,data=Boston,subset=train,
                        mtry=13,importance=TRUE)

# Note: mtry=13 tells Random Forest to use 13 predictors, which is the full set, thus a Bagging model with m=p. The importance attribute is set to TRUE to obtain each variable's importance in reducing error

bag.boston # Take a quick look

# Notice that the model was fit on 13 variables and 500 trees

# Let's do predictions on the test set

yhat.bag = predict(bag.boston,newdata=Boston[-train,]) 
plot(yhat.bag, boston.test) # Then plot predicted vs. actual
abline(0,1) # Draw a line
mean((yhat.bag-boston.test)^2) # Get the mean squared error
# Notice that the MSE is almost 1/2 of the regression tree MSE

# To fit a model with a different number of trees, use the ntree=25 (for 25 trees, or any other number of trees)

bag.boston=randomForest(medv~.,data=Boston,subset=train,
                        mtry=13,ntree=25)

yhat.bag = predict(bag.boston,newdata=Boston[-train,])

mean((yhat.bag-boston.test)^2)
# Notice that the MSE is a bit higher than with 500 trees


## Random Forest

# Note: Again, Bagging is a special case of Random Forest. In Random Forest we use m sample predictors from a set of p available predictors such that m<=p. We also vary the m predictors from tree to tree to to reduce the correlation among the trees. The limitation of Bagging is that all trees are fitted with the same predictors, so results are likely to be somewhat correlated. Random Forest with m<p helps correct for this because every tree will be different.

# We use the same randomForest() function, but specify a smaller number of sampled predictors with "mtry" than the number of available predictors, i.e., m<p. If not specified, m=p/3 is the default.

set.seed(1) # To get replicable results

rf.boston=randomForest(medv~.,data=Boston,
                       subset=train,mtry=6,importance=TRUE)
rf.boston # Inspect the results

plot(rf.boston) # Notice how MSE declines as more trees are sampled
# It seems like 150 trees may be sufficient.

# Let's do predictions with the test data
yhat.rf = predict(rf.boston,newdata=Boston[-train,])

mean((yhat.rf-boston.test)^2)

# Note that the MSE for this model is even smaller than for the Bagged model

# One shortcoming of trees is that there are no coefficients or p-values to ascertain which variables have stronger effects. The importance() function helps overcome this problem by displaying the importance of each variable to the tree model.

importance(rf.boston) # To view the importance of each variable

# The 2 values of importance reported are:

# (1) Mean decreases in accuracy when the variable is 
#     excluded from the model

# (2) Decrease in "impurity" when the data is split by 
#     that variable, averaged over all trees

# Higher values are best for either

varImpPlot(rf.boston) # We can also plot the results

# The results show that overall community wealth (lstat) and house size (rm) are the most important predictors.


## Boosting

install.packages("gbm") # If not installed already
library(gbm) # Generalized Boosted Regression Models 
library(MASS) # Contains the Boston data set

# Like Bagging and Random Forest, Boosting models several trees and aggregates the result. Unlike Bagging and Random Forest, Boosting does not fit several random trees, but it fits an initial tree and then fit another one to explain the residuals (errors), then again, etc. 

# Bagging and Random Forest are considered "fast" learning methods because the best model is generated in the first few samples and subsequent trees may or may not improve the MSE, whereas Boosting is considered to be a "slow" learning method because every new tree builds upon and improves the prior tree. 

# The tunning parameter "lambda" (works just like shrinkage in Ridge and LASSO) controls the speed of learning.

# Aside: to understand this concept, imagine that you run an OLS regression with certain variables and you get some fairly large residuals (i.e., errors). You can then build another OLS regression model to explain (i.e., predict) those residuals. This new regression will explain some of the error variance, but will also yield new errors (smaller than the first ones, becasue some of the variance in the errors is already explained with the second model). 

# Then you can fit a third regression model to explain the new residuals, and so on. You can then aggregate all the regression models, which on the aggregate, will have small residuals. Boosting applies this concept when generating trees.

set.seed(1) # To get replicable results

# Let's fit a Boosting model on the Boston data. Use:

# - distribution="gaussian" (i.e., normal distribution) 
#   for regression models.

# - distribution="bernoulli" for classification models

# Let's fit a model with 5000 trees, limitting the depth of each tree to 4 and using all available predictors

boost.boston=gbm(medv~.,data=Boston[train,],
                 distribution="gaussian",n.trees=5000,
                 interaction.depth=4)

summary(boost.boston) # Provides relative influence stats and plot
# Note again, that lstat and rm are the most important variables

# Let's plot their partial dependencies to see how predicted price houses vary with lstat and rm

par(mfrow=c(1,2))
plot(boost.boston,i="rm")
plot(boost.boston,i="lstat")

# Let's now do predictions with the test data

yhat.boost=predict(boost.boston,newdata=Boston[-train,],n.trees=5000)
mean((yhat.boost-boston.test)^2) # Computing the means squared error
# The MSE is 14.62 (you may get a sligthtly different value), which is not much different than Bagged and Random Forest models

# Shrinkage -- Boosting has a similar "shrinkage" effect on variables just like Ridge and LASSO regression. The shrinkage applies over each tree model, including the first one. A small lambda shrinks he prior tree model more, thus making it less important for the final aggregated model (i.e., slow learning). Large lambdas give more weithg to the initial trees, thus learning fast.

# To vary the shrinkage factor (lambda) use the shrinkage attribute (the default is 0.01).

boost.boston=gbm(medv~.,data=Boston[train,],
                 distribution="gaussian",n.trees=5000,
                 interaction.depth=4,shrinkage=0.2,verbose=F)

# Now let's do predictions wiht the test data

yhat.boost=predict(boost.boston,newdata=Boston[-train,],n.trees=5000)
mean((yhat.boost-boston.test)^2)
# Not much different
