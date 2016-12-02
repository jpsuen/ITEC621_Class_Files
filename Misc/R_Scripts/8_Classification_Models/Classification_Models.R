#### 8. CLASSIFICATION MODELS ####


### ISLR Chapter 4 Lab: Classification -- Logistic Regression, LDA, QDA, and KNN

# Classification models predict outcomes that are either binary or categorical. There are two broad categories of classification models -- association and tree based. In this section we cover association models based on regression and discriminant analysis methods.

# We will be using the Stock Market (Smarket) data set frequently in this section. A few notes are in order.

library(ISLR) # Contains the Smarket data set
attach(Smarket)

?Smarket # Review the variables in this data set.
dim(Smarket) # Retrieve the dimensions of the Smarket data table
# 1250 observations and 9 variables

# This data set does not yield very interesting results in logistic models but the results illustrate a few important points. It also illustrates the use of lag transformations in logistic models. Let's explore the data

names(Smarket)
head(Smarket)

# One important thing to note is that the variable "Direction" is categorical, not binary. So, we have two choices, create a binary variable called "Up" =1 when Direction is up and 0 otherwise. But in the example below we don't make conversions until later and we let R take care of this for us.

summary(Smarket)

# To plot correlation scaterplots of the data
pairs(Smarket) 

# Will give an error because the variable Direction is not numeric
cor(Smarket) 

# Remove that variable from the correlation matrix
cor(Smarket[,-9]) 

# We can use the ggpairs(){GGally} function instead, since it works with categorical variables too.

library(GGally)
ggpairs(Smarket)

## Binomial Logistic Regression

# The outcome in binary predictive logistic model is one of two values: 0 or 1; yes or no; success or failure; approve or disapprove; etc.

# The syntax for logistic regression is the same as lm(){stats}, but it uses the glm(){stats} function rather than the lm() function. glm() stands for "Generalized Linear Model", which covers a number of linear regression models and various transformations of the dependent variable (e.g., logistic). 

# A linear model with no transformation of the dependent variables estimated with glm() and a "gaussian" distribution yields the exact same results as OLS with the lm() function. But glm() supports other distributions and transformations of the dependent variable. The "link" function is the type of transformation of the dependent variable. 

# Different regression methods require specific "model family" and "link" function parameters:

# - Binomial Logistic regression is family=binomial(link="logit")
# - OLS regression is family=gaussian(link="identity")
# - Binomial Probit regression is family=binomial(link="probit")
#   Probit stands for "Probability Unit" and it works just like 
#   logistic, except that it uses a different transformation 
#   function for Y. 
# - Count data models uses family=poisson(link="log")

glm.fit = glm(Direction~
                Lag1+Lag2+Lag3+Lag4+Lag5+Volume,
              data=Smarket,
              family=binomial(link="logit"))

# Let's look at the coefficient plot

install.packages("coefplot") # If not installed already
require(coefplot)

coefplot(glm.fit) # Nice function to display coeffients visually

# Note that, visually, all the 95% confidence intervals cross the 0 mark, so none of the coefficients are significant whe all lag variables are included in the model.

# Let's look at fit statistics

summary(glm.fit) # Let's look at summary statistics

# Sure enough, none of the coefficients are significant

logLik(glm.fit) # Get the log-likelihood
-2*logLik(glm.fit) # Should be equal to the residual deviance, or just
deviance(glm.fit) # Should yield the same value

# AIC = deviance + penalty, so it should be somewhat higher than the deviance
AIC(glm.fit) 

# The penalty is 2*Number of variables in the model.Smaller deviance and AIC are better; it means that there is a smaller likelihood that the predicted values deviate from actual values (just like MSE), that is, how much it is not explained by the model.

log.odds = coef(glm.fit) # To get just the coefficients
log.odds # They are very close to 0

# To convert Log-Odds to multiplicative change in odds
odds <- exp(coef(glm.fit))
odds # Naturally, they are very close to 1

# TO convert odds to probabilities
prob = odds/(1+odds) 
prob # Around 50%, almost like flipping a coin

cbind(log.odds, odds, prob) # Check them out together

# To get the 95% confidence intervals of Log-Odds coefficients
confint(glm.fit)

# exp(x) = e^x -- converts log-odds into odds;The 95% confidence interval of odds:
exp(confint(glm.fit)) 

# 95% confidence interval for the probabilities
exp(confint(glm.fit))/(1+exp(confint(glm.fit))) 

# The predict() function outputs (by default) predicted values for all observations in the training data
glm.probs=predict(glm.fit,type="response")
# type="response" attribute gives the "probability" of Y=1

glm.probs[1:10] # List first 10

# To display what 0 and 1 mean in the response variable
contrasts(Direction) 

# Let's convert predicted values into a label "Up" if the probability is > 50%, "Down" othersies

glm.pred = ifelse(glm.probs>0.5, "Up", "Down")
glm.pred

# Confusion matrix

# To cross tabulate Prediction (probabilities) with Direction (actual)
conf.mat <- table(glm.pred,Direction) 
conf.mat

# Proportion of observations in the diagonal (i.e., correct predictions)
Error.Rate=(457+141)/1250 
Error.Rate # Check it out

# Instead of reading numbers, you can use the generic table indices for the off-diagonal table elements:

Error.Rate=(conf.mat[2,1]+conf.mat[1,2])/length(glm.pred)
Error.Rate

# Sensitivity -- rate of correct positives

glm.sensitivity=507/(141+507) # Proportion of correct positives
glm.sensitivity
# Or
glm.sensitivity=conf.mat[2,2]/(conf.mat[1,2]+conf.mat[2,2])
glm.sensitivity

# Specificity -- rate of correct negatives

glm.specificity=145/(145+457) # Proportion of correct negatives
glm.specificity
# Or
glm.specificity=conf.mat[1,1]/(conf.mat[1,1]+conf.mat[2,1])
glm.specificity

# False Positives -- 1 - specificity

glm.false.pos <- 1 - glm.specificity
glm.false.pos

glm.fit.stats <- 
  c(Error.Rate, glm.sensitivity, glm.specificity, glm.false.pos)
names(glm.fit.stats)=
  c("Error Rate", "Sensitivity", "Specificity", "False Positives")

glm.fit.stats

# Classification threshold (lambda)

# Note: the glm.probs>0.5 defines the "threshold" for classification of the predictive model.

# We can tune this value depending on the model needs. For example, if we want to be conservative in our predictions a value of glm.probs>0.6 will only classify an observation as "Up" or 1 if the predicted probability is greater than 60%.

glm.pred.cons <- ifelse(glm.probs>0.60, "Up", "Down")
glm.pred.cons

# To get the "training error rate" (proportion of off diagonal values):

1-mean(glm.pred.cons==Direction) 
mean(glm.pred.cons!=Direction) # Same thing

# Compare with the conservative prediction
conf.mat.cons <- table(glm.pred.cons,Direction)
conf.mat.cons # Check out the dramatic changes
# Conclusion -- the threshold really matters

# Mean when prediction values match the actual Direction
mean(glm.pred.cons==Direction) 

# Mean when prediction values DON'T match the actual Direction
# i.e., the Error Rate
mean(glm.pred.cons!=Direction) 

# Let's build a confusion matrix for the conservative predictions

Error.Rate.cons <- (conf.mat.cons[2,1]+conf.mat.cons[1,2])/length(glm.pred.cons)
Error.Rate.cons # Same as above

glm.sensitivity.cons <- 
  conf.mat.cons[2,2]/(conf.mat.cons[1,2]+conf.mat.cons[2,2])

glm.specificity.cons <- 
  conf.mat.cons[1,1]/(conf.mat.cons[1,1]+conf.mat.cons[2,1])

glm.false.pos.cons <- 
  1 - glm.specificity.cons

glm.fit.stats.cons <- 
  c(Error.Rate.cons, glm.sensitivity.cons, glm.specificity.cons, glm.false.pos.cons)
names(glm.fit.stats.cons)=
  c("Error Rate", "Sensitivity", "Specificity", "False Positives")

glm.fit.stats.cons

glm.fit.stats.compare <- rbind(glm.fit.stats, glm.fit.stats.cons)
glm.fit.stats.compare

# Now, let's create a training model with part of the data and test it with the holdout data.

# In this example, we will use data before 2005 for the training subsample and everything else for testing

train=(Year<2005) # Creates a vector mamed "train"

# The train vector above contains TRUE/FAlse values for each observation, TRUE for Year<2005 and FALSE otherwise. This is called a "Boleean" vector. Take a look:

train # Check it out

# Boolean vectors are very useful to partition the data. For example, to creates a holdout set with all obvervations not on the training set

Smarket.2005=Smarket[!train,] 

# Inspect the test data set, it has 252 observations and 9 variables
dim(Smarket.2005) 

# Use train to get the data in the training set an !train to get data not in the training set. For example, this creates a vector with the values of the Direction variable for the hold out data set, Which we will use shortly to build the confusion matrix.

Direction.2005=Direction[!train] 
Direction.2005 # Check it out

# Let's train the model using only the training data set

glm.fit=glm(Direction~
              Lag1+Lag2+Lag3+Lag4+Lag5+Volume,
            data=Smarket,
            family=binomial,
            subset=train)

summary(glm.fit)

# Let's predict values in the holdout set
glm.probs=predict(glm.fit,Smarket.2005,type="response")

# First, create a test vector with all values equal to "Down"
glm.pred=rep("Down",252) 

# Change the value to "Up" of the predicted probability is > 0.5
glm.pred[glm.probs>.5]="Up" 

# Confusion matrix predicted vs. actual (i.e., Direction)
table(glm.pred,Direction.2005) 
mean(glm.pred==Direction.2005) # Correct rate
mean(glm.pred!=Direction.2005) # Error rate

# Let's do some predictions with a reduced model with only Lag1 and Lag2

# Do this part on your own

glm.fit=glm(Direction~
              Lag1+Lag2,
            data=Smarket,
            family=binomial,
            subset=train)

summary(glm.fit)

glm.probs=predict(glm.fit,Smarket.2005,type="response")
glm.pred=rep("Down",252)
glm.pred[glm.probs>.5]="Up"

table(glm.pred,Direction.2005)
mean(glm.pred==Direction.2005) # Correct rate
mean(glm.pred!=Direction.2005) # Error rate

# Let's make a prediction for 3 observations with data on Lag1 and Lag2

predict(glm.fit,newdata=data.frame(Lag1=c(1.2,1.5),
                                   Lag2=c(1.1,-0.8)),type="response")



## EXAMPLE: more interesting Logistic model with South African heart desease data

browseURL("http://statweb.stanford.edu/~tibs/ElemStatLearn/datasets/SAheart.info.txt")

heart <- 
  read.table("http://statweb.stanford.edu/~tibs/ElemStatLearn/datasets/SAheart.data",
             sep=",",head=T,row.names=1)

attach(heart)
head(heart)

# Logistic model predicting coronary heart desease
heart.fit = glm(chd ~ ., family=binomial, data=heart )
summary(heart.fit)

# Looks like tobacco, ldl, family history, type a and age are the strongest predictors of coronary heart desease (chd). Interestingly Once you controll for these factors obesity and alcohol are not significant predictors. Take a closer look:

require(coefplot)
coefplot(heart.fit)

# You can see in the plot that some variables have confidence intervals that don't cross the 0 mark, i.e., they are significant

# Fit statistics

-2*logLik(heart.fit) # 2LL
deviance(heart.fit) # Should yield the same value
AIC(heart.fit) # 2LL + 2*Number of variables

# Transforming coefficients
log.odds = coef(heart.fit) # To get just the coefficients
log.odds # Check it out

# To convert Log-Odds to multiplicative change in odds
odds <- exp(coef(heart.fit)) 
odds # Check it out

prob = odds/(1+odds) # TO convert odds to probabilities
prob # Check it out

cbind(log.odds, odds, prob) # Check them out together

# Confidence intervals

# To get the 95% confidence intervals of Log-Odds coefficients
confint(heart.fit) 

# (Log-Odds^e) -- the 95% confidence interval of odds
exp(confint(heart.fit)) 

# Get predicted values with the training data
heart.probs=predict(heart.fit,type="response") 
# type="response" above gives the "probability" of Y=1
heart.probs[1:10] # List first 10

# Confusion matrix

# Convert probability to prediction
heart.pred = ifelse(heart.probs>0.5, 1,0) 
conf.mat.heart <- table(heart.pred,chd) # To cross tabulate Prediction with Actual
conf.mat.heart

heart.error <- (conf.mat.heart[2,1]+conf.mat.heart[1,2])/length(glm.pred.hear)

heart.sensitivity <- 
  conf.mat.heart[2,2]/(conf.mat.heart[1,2]+conf.mat.heart[2,2])

heart.specificity <- 
  conf.mat.heart[1,1]/(conf.mat.heart[1,1]+conf.mat.heart[2,1])

heart.false.pos <- 
  1 - heart.specificity

heart.fit.stats <- 
  c(heart.error, heart.sensitivity, heart.specificity, heart.false.pos)

names(heart.fit.stats)=
  c("Error Rate", "Sensitivity", "Specificity", "False Positives")

heart.fit.stats


## Mutinomial Logistic Regression

# This code is not in the textbook

# A multinomial logit model is identical to a binomial logit model, except that the categorical outcome variable has more than 2 possible values. For example, suppose that you are trying to predict when people will buy rural, suburban or urban homes. In this case, the dependent variable has 3 possible values. This model can be easily fitted using 2 binomial logit models. First, you create select a baseline or reference value (e.g., rural) and then create dummy variables for the two other categories (i.e., suburban and urban). You then build a binomial logit model with suburban (=1 if suburban, 0 otherwise) and estimate it. You then do the same with urban (=1 if urban, 0 otherwise). Each regression will give you the effect on the log odds of someone buying a suburban or rural house respectively.

# This is a valid approach, but since you fit 2 separate models you get separate fit statistics for each of the models. There are statistical routines that can extimate the two binomial logit models together and give you one set of fit statistics for the whole model.

# More generally, a multinomial model is one in which the outcome variable has K categorical values. In our example above K = 3. This model is fit with a multinomial logistic regression composed of K-1 binomial logit models. There are R packages and functions that will estimate all K-1 models jointly. The most popular ones are:

# multinom(){nnet}; mlogit{mlogit}; and 

# {VGAM} package (Vector Generalized and Additive Models) has the vglm() function (Vector Generalized Linear Model), which runs multinomial logistic and other categorical regressions

# ASIDE: two other packages to fit multinomial logistic models: multinom(){nnet}, glmnet(){glmnet}

install.packages("VGAM") # If not installed already
library(VGAM) # Contains the vglm() function
library(car) # Contains the Womenlf data set we use below

# Data set about Women's Labor Force Participation
attach(Womenlf)
head(Womenlf)
? Womenlf

# Let's fit a model for labor participation, based on husband's income,and children in the household

vglm.fit = vglm(partic~
                  hincome+children, 
                family=multinomial(refLevel=1), 
                data=Womenlf)

# Notice the attribute refLevel=1
levels(Womenlf$partic)
# Which corresponds to "fulltime" and can be changed as needed

vglm.summary = summary(vglm.fit)
vglm.summary

# Interpretation: 

# The coefficients in multinomial logit, just like in binomial logit, show the effect of a 1 unit increase in the predictor
# variable on the log-odds of the dependent variable. But this is the difference:

# - In binomial logit, the coefficient is about the log-odds of the response variable being 1 (relative to 0, of course)

# - In multinomial logit, the coefficient is about the log-odds of the response variable being in that category, relative to  the reference category (i.e., the response variable left out of the one specified with the "refLevel" attribute)

# Fit Statistics, similar to binomial logistic with glm()

logLik(vglm.fit) # Log-likelihood
-2*logLik(vglm.fit) 
# Should be equal to the residual deviance
deviance(vglm.fit) # Should yield the same value
AIC(vglm.fit) # Akaike Information Criterion = deviance+2*NumVariables

# Let's manipulate the coefficients a bit

coef.log.odds = coef(vglm.fit) # Log Odds
coef.log.odds # Take a look

# Notice that each variable has 2 values. Since we have 3 categories in the response variable and the first one was left out as the reference variable, the first coefficient is for the log odds of the second response category; and the second one is for the third response category.

# Now let's get the odds and probabilities

coef.odds = exp(coef.log.odds) # Odds
coef.prob = coef.odds/(1+coef.odds) # Probabilities
coef.all = cbind(coef.log.odds, coef.odds, coef.prob) # All 3
coef.all # Tale a look

# Same thing -- 2 coefficients for each variable; we would get 3 coefficients if we had 4 response categories, and so on.

# Let's find predicted values

pred.log.odds = predictvglm(vglm.fit, newdata=NULL, se.fit = TRUE)

# Notes: newdata can be used to specify a test or new data set to predict if omitted or NULL the predictions are done on the training set

pred.log.odds # Take a look

# Just like with the coefficients, we get 2 predictions for each observation -- one for the log-odds of being in the second category (compared to the first) and the other for the third category.

# Let's manipulate the predicted values

pred.log.odds$se.fit # Standard errors
pred.log.odds$fitted.values # Predicted values, log odds
pred.odds = exp(pred.log.odds$fitted.values) # Predicted odds
pred.prob = pred.odds/(1+pred.odds) # Predicted probabilities
pred.all = cbind(pred.log.odds$fitted.values, 
                 pred.odds, pred.prob)

# vglm() reports the above data without column names, let's create them

colnames(pred.all)=
  c("LogOdds2","LogOdds3", "Odds2", "Odds3", "Prob2", "Prob3")

pred.all # Take a look


## Linear Discriminant Analysis (LDA)

require(ISLR) # Needed for the Smarket data set
require(MASS) # Contains the lda(){MASS} function
attach(Smarket)

train=(Year<2005) # Creates a vector mamed "train" as we did before
Smarket.2005=Smarket[!train,] # As we did before
Direction.2005=Direction[!train] # As we did before

# Let's an LDA model with training data from the Smarket data set using the lda() function

lda.fit=lda(Direction~Lag1+Lag2,data=Smarket,subset=train) 

# An alternative way to specify the training subset

lda.fit=lda(Direction~Lag1+Lag2,data=Smarket,subset=Year<2005) 

lda.fit # Show the output (including the coefficients)

# Let's inspect the plot, showing the LDA combinations that yield Up and Down

plot(lda.fit) 

# Let's now predict with the test data
lda.pred=predict(lda.fit, Smarket.2005)
names(lda.pred) # Print lda.pred attributes for reference
# Note: predict() returns 3 elements:

# (1) $class -- the outcome variable classification

lda.pred$class # Check out the predicted values

# (2) $posterior -- which is actually a matrix, with each 
#     column showing the posterior probability that the 
#     observation belongs to the first, second, etc. class; 
#     and 

head(lda.pred$posterior) # 2 columns, for "Down" and "Up"

# (3) $x which contains the linear discriminants (i.e., 
#     linear combination of the coefficients 
#     (beta1*lag1+beta2*lag2) reported in lda.fit above.
#     Check the posterior probabilities, in this case
#     it has 2 columns for Down and Up

head(lda.pred$x) 
# A large $x predicts "Up" and a small x predicts "Down". The cutoff for classification of "Up" vs. "Down" is the mean of the $x values, which should hover around (but not exactly at) 0.

# Let's build the confusion matrix

# Create a vector with just the predicted values of "class"
lda.class=lda.pred$class 

# Confusion matrix with predicted vs. actual (i.e., Direction)
lda.conf <- table(lda.class,Direction.2005) 
lda.conf

lda.correct <- mean(lda.class==Direction.2005) # Correct rate
lda.error <- mean(lda.class!=Direction.2005) # Error rate
lda.stats <- c(lda.correct, lda.error)
names(lda.stats) <- c("Correct", "error")
lda.stats

sum(lda.pred$posterior[,1]>=.5)
sum(lda.pred$posterior[,1]<.5)

lda.pred$posterior[1:20,1] # First column is "Down"
lda.pred$posterior[1:20,2] # Second column is "Up"

lda.class[1:20]


## Quadratic Discriminant Analysis (QDA)

# The syntax for the qda() function is identical to lda().

attach(Smarket)
train=(Year<2005) # As we did before
Smarket.2005=Smarket[!train,] # As we did before
Direction.2005=Direction[!train] # As we did before

qda.fit=qda(Direction~Lag1+Lag2,data=Smarket,subset=train)
qda.fit # It does not provide linear discriminants like LDA
qda.class=predict(qda.fit,Smarket.2005)$class

# QDA confusion matrix

qda.conf <- table(qda.class,Direction.2005)
qda.conf

qda.correct <- mean(qda.class==Direction.2005) # Correct rate
qda.error <- mean(qda.class!=Direction.2005) # Error rate
qda.stats <- c(qda.correct, qda.error)
names(qda.stats) <- c("Correct", "error")
qda.stats

both.stats <- rbind(lda.stats, qda.stats)
both.stats
# QDA does a better job than LDA with this data


## K-Nearest Neighbors (KNN)

# Complete all KNN code on your own

library(class) # needed for the knn() function

# KNN does estimation and prediction in one step, as opposed to Logistic, LDA and QDA. It requires 3 matrices and a scalar k: 

# 1. Training predictors;
# 2. Testing predictors; 
# 3. Training class vector (the y's)
# 4. Value of K (how many near neighbors to use)

# 1. Column bind the two training predictor variables
train.X=cbind(Lag1,Lag2)[train,]

# 2. Column bind the two test predictor variables
test.X=cbind(Lag1,Lag2)[!train,] 

# 3. Vector with response values ("Up" or "Down") in the training set
train.Direction=Direction[train] 
train.Direction # Check it out

# 4. k -- a smaller K is more overfitting; a larger K 
#   provides a smoother classifier boundary

set.seed(1) # To get repeatable results

# knn() function with its 3 matrix parameters, plus k
knn.pred=knn(train.X,test.X,train.Direction,k=1) 

table(knn.pred,Direction.2005) # Confusion matrix
mean(knn.pred==Direction.2005) # Accuracy rate
(83+43)/252 # Same result
mean(knn.pred!=Direction.2005) # Error rate

# Let's try 3 nearest neighbors
knn.pred=knn(train.X,test.X,train.Direction,k=3)
table(knn.pred,Direction.2005)
mean(knn.pred==Direction.2005) # Better

# Application to Caravan Insurance Data

dim(Caravan)
attach(Caravan)
head(Caravan)
summary(Purchase)
348/5822

# Note on standardization -- when the scale of items may be an issue, it is customary to standardize variables, by subtracting the mean and dividing by the standard deviation, so that the mean of the stanardized variable is now 0 and the standard deviation is 1 -- scale is no longer an issue.

# scale() standardizes data (exclude col 86, which is qualitative)
standardized.X=scale(Caravan[,-86]) 

var(Caravan[,1]) # Check the variance of the first column
var(Caravan[,2]) # Check the variance of the first column
var(standardized.X[,1]) # Variance of the standardized variable is 1
mean(standardized.X[,1]) # Mean is zero (or very, very small)
var(standardized.X[,2]) # Same thing

# Let's fit and predict in one pass. Also, let's use the first 1000 observations as the test set

test=1:1000 
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

# Let's use logistic regression with the same data to compare results

glm.fit=glm(Purchase~.,data=Caravan,family=binomial,subset=-test)
glm.probs=predict(glm.fit,Caravan[test,],type="response")
glm.pred=rep("No",1000) # Set all responses to "No"

# Use the classifier probability>0.5 set to "Yes"
glm.pred[glm.probs>.5]="Yes" 
# We are wrong about predicting "Yes" EVERY TIME

table(glm.pred,test.Y) 
glm.pred=rep("No",1000)

# Let's solve this problem by lowering the classifier threshold
glm.pred[glm.probs>.25]="Yes" 
table(glm.pred,test.Y)
11/(22+11) # Accuracy rate is 33.3% which is better