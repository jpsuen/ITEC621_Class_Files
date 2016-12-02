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
