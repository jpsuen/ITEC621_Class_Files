### Chapter 7 Lab: Non-linear Modeling

# 7.1 The Wage Data

library(ISLR)
attach(Wage)
head(Wage)
# Be careful when you type. The table name is Wage with capital W. Within this table, there is 
# a variable called wage also, but with lower cap "w" which contains the wage for each person
plot(wage, age) # Take a look at the data, visually
Wage$wage # Take a look at all the wages
Wage$age # and all the ages

# 7.2 Polynomial Regression

# Let's fit a polynomial up to the power of 4
fit.poly4=lm(wage~poly(age,4),data=Wage)
coef(summary(fit.poly4))
# Note: the poly() function does not give coefficients for
# x, x-square, x-cube, etc., but for an "orthogonal polinomial" of these
# variables. This sounds complicated, but it is simply like the principal
# components of these variables, such that all 4 variables have a correlation
# of 0. This is important because x and x-square will be highly correlated.
# So, orthogonal polynomials will have less problems with multi-collinearity
# and produce more stable models. However, the interpretation of orthogonal
# polynomials is tricky because it is hard to relate them to the original
# variable x.

# In order to fit the model using the raw variables x, x-squared, x-cube, etc.,
# without converting these variables into an orthogonal polynomial, just us
# the attribute raw=TRUE or raw=T
fit.poly4.raw=lm(wage~poly(age,4,raw=T),data=Wage)
coef(summary(fit.poly4.raw))

# Alternatively, you can elevate to the respective power manually
fit.poly4.I=lm(wage~age+I(age^2)+I(age^3)+I(age^4),data=Wage)
coef(summary(fit.poly4.I))

# Let's do some predictions
# The range function below computes the lower and upper valuse of the age variable range
agelims=range(age)
agelims # Take alook
# This command creates a list of all ages within the age range
age.grid=seq(from=agelims[1],to=agelims[2])
age.grid # Take a look

# Now let's run the predict() function for all the ages in the, including standard errors
preds=predict(fit.poly4.raw,newdata=list(age=age.grid),se=TRUE)
preds # Take a look at the predicted valuse and standard errors for these predictions
# Let's create a confidence interval equal to +/- 2 standard errors
# This produces a matrix with two columns with the lower and upper values for the confidence interval
se.bands=cbind(preds$fit+2*preds$se.fit,preds$fit-2*preds$se.fit)
se.bands # Take a look

# Let's split the plot frame and do some visualization
par(mfrow=c(1,2),mar=c(4.5,4.5,1,1),oma=c(0,0,4,0)) # mar() and oma() control the margins
plot(age,wage,xlim=agelims,cex=.5,col="darkgrey") # Do the plot first
title("Degree-4 Polynomial",outer=T) # Add a title
lines(age.grid,preds$fit,lwd=2,col="blue") # Draw a line with the ages and predicted wage values
matlines(age.grid,se.bands,lwd=1,col="blue",lty=3) # Plot the confidence interval line with age

# One important observation: whether you use the raw x, x=squared, x-cube, etc. or orthogonal
# polynomials, the predicted values will be identica. Take a look
preds2=predict(fit2,newdata=list(age=age.grid),se=TRUE)
max(abs(preds$fit-preds2$fit)) # Notice how small are the differences

# If you would like to dedice the power of the polynomial, you can test how much predictive
# power you add every time you add a higher polynomial term, using the anova() function,
# as explained above for testing reduced vs. extended sets:
fit.1=lm(wage~age,data=Wage) # Just x
fit.2=lm(wage~poly(age,2,raw=T),data=Wage) # Add x-squared
fit.3=lm(wage~poly(age,3,raw=T),data=Wage) # etc.
fit.4=lm(wage~poly(age,4,raw=T),data=Wage)
fit.5=lm(wage~poly(age,5,raw=T),data=Wage)
anova(fit.1,fit.2,fit.3,fit.4,fit.5) # Now let's do an F-Test with ANOVA
# The results support model 3, which has x-cube -- beyond that the power does not increase significantly
# Important note: we used raw variables, but the book example uses orthogonal polynomials.
# This means that the coefficients will be different, but the ANOVA F-Tests should yield similar results
coef(summary(fit.3)) # Note that all coefficients are significant
coef(summary(fit.5)) # But when we add higher power coefficients the model breaksdown

# You can try adding other variables and testing them with F-tests:
fit.1=lm(wage~education+age,data=Wage)
fit.2=lm(wage~education+poly(age,2, raw=T),data=Wage)
fit.3=lm(wage~education+poly(age,3, raw=T),data=Wage)
anova(fit.1,fit.2,fit.3)

# 7.3 Polynomial Logistic Regression

# Let's try the same method with Logistic regression with the dependent variable
# as the probability that Wage is greater than 250K using orthogonal polynomial
fit.logit=glm(I(wage>250)~poly(age,4),data=Wage,family=binomial)
coef(summary(fit.logit)) # Take a look
# Now let's do predictions on the same age range we used above
preds=predict(fit.logit,newdata=list(age=age.grid), se=T)
preds # Take a look
# We can also convert them into probabilities like this:
pfit=exp(preds$fit)/(1+exp(preds$fit)) # Converting log odds to probabilities of Wage>250K
pfit # Take a look
# Now let's compute the confidence interval as predicted value +/- 2 standard errors
# And let's use the log odds
se.bands.logit = cbind(preds$fit+2*preds$se.fit, preds$fit-2*preds$se.fit)
se.bands.logit # Take a look
# And also let's do the same for probabilities:
se.bands = exp(se.bands.logit)/(1+exp(se.bands.logit))

preds=predict(fit.logit,newdata=list(age=age.grid), type="response", se=T)
# Note" type="response" causes the predicted values to be the probabilities
preds # Take a look
# If we don't include this type, the default is the log-odds values
preds=predict(fit,newdata=list(age=age.grid),type="response",se=T)
preds # Take a look
# Now let's do the plotting
plot(age,I(wage>250),xlim=agelims,ylim=c(0,1))
lines(age.grid,pfit,lwd=2, col="blue")
matlines(age.grid,se.bands,lwd=1,col="blue",lty=3)

# We can blow up the plot by changing the ylim to 0,0.2 and dividing the I by 5
# just so that the 1's show up in the 0,0.2 range
plot(age,I(wage>250)/5,xlim=agelims,ylim=c(0,0.2))
lines(age.grid,pfit,lwd=2, col="blue")
matlines(age.grid,se.bands,lwd=1,col="blue",lty=3)

# 7.4 Step Functions

# If we want to fit a Step function, rather than a polynomial we can use the cut() function
# to arbitrarily divide the age data into 4 partitions
table(cut(age,4))
fit.step=lm(wage~cut(age,4),data=Wage)
coef(summary(fit.step)) # Take a look
preds=predict(fit.step,newdata=list(age=age.grid),se=T)
preds # Take a look
plot(age,wage,xlim=agelims,cex=.5,col="darkgrey") # Do the plot first
title("Step Regression",outer=T) # Add a title
lines(age.grid,preds$fit,lwd=2,col="blue") # Draw a line with the ages and predicted wage values
se.bands=cbind(preds$fit+2*preds$se.fit,preds$fit-2*preds$se.fit)
matlines(age.grid,se.bands,lwd=1,col="blue",lty=3) # Plot the confidence interval line with age

# 7.5 ASIDE -- NOT IN TEXTBOOK -- Piecewise Linear Regression

library(ISLR) # Needed to acces the Wage data set
library(splines)
attach(Wage)
# To fit a sequence of regression lines sequentially along the data, we first
# need to figure out the "knots", that is the points where the regression slope
# changes. Take a look at the data first:
plot(age,wage,col="gray")
# Visually, it appears that the data changes directions at ages 25, 40 and 60
# Let' build a linear regression model with 3 knots with 4 different but connected
# regression model to the right and left of each knot.
# To do this, simply, create dummy variables that are 0 to the left of each knot
# and 1 to the right. Then add the interaction term of this dummy variable with age
fit.piecewise=lm(wage~age+I((age-25)*(age>25))+I((age-40)*(age>40))+I((age-60)*(age>60)),data=Wage)
# Note the I() function above creates the respective dummy variables and interaction terms
# Notice that we we first take (age-25), which is like moving the Y axis to age=25
# and then multiply it by (age>25), which will yield 0 for age<=25 and age for age>25
# we then apply the I() function to the whole operation
summary(fit.piecewise)

# Interpretation: the intercept is at -42.47. The regression slope starts with 5.38K more wage
# dollars for every additional year of age, up to age 25. At that point the slope changes to
# 5.38-3.50=1.88K more wage per year of age, upt to age 40. Then, it changes to 1.88-1.98=-0.10K
# less wage dollars for every additional year of age (i.e., almost flat), up to age 60. After that
# it declines at the rate of -0.10-1.40=-1.50K fewer dollars for each additional year of age.
# Let's look at it graphically:
pred=predict(fit.piecewise,newdata=list(age=age.grid),se=T)
plot(age,wage,col="gray")
lines(age.grid,pred$fit,lwd=2)

# 7.6 Splines -- need the "splines" library

# The piecewise linear model above is very interpretable, but if all we want is to make predictions
# Spline regressions are easier to formulate and we can not only fit linear models, but also polynomials,
# so we can connect the knots with curves, rather than lines. Interpretation becomes almost impossible as
# we include polynomial splines, but the prediciton can be more accurate because the regression line can
# follow the data more precisely (but be careful with overfitting). Let's take a look.

library(ISLR) # Needed to acces the Wage data set
library(splines)
attach(Wage)
# Let's start with simple linear spline regression
fit.x1=lm(wage~bs(age,knots=c(25,40,60), degree=1),data=Wage)
# Note: The bs() function builds polynomial splines at the specified cut points
# The "degree" argument specifies the power of the polynomial
# For example, degree=1 models age just linear, so it will produce 4 coefficients:
# 1 for age and then 1 for each of the three segments after each knot. That is,
# if d=1 (degree 1) and K=3 (knots) -- there will be K+1=4 coefficients.

# Take a look:
summary(fit.x1)
pred=predict(fit.x1,newdata=list(age=age.grid),se=T)
plot(age,wage,col="gray")
lines(age.grid,pred$fit,lwd=2)
# You should see 4 different regression lines changing at the knots, almost identical to the
# piecewise linear model above.

# Note: in the model above we arbitrarily set the knots at ages 25, 40 and 60. However if we
# would like to split the spline segments and knots evenly we can use the "df" (degrees of 
# freedom) parameter, rather than the "knots" parameter. If df=4, this means that there are
# 4 spline segments with 3 knots in between. Take a look:
dim(bs(age,df=4, degree=1)) # Creates 4 partitions with 3 knots
attr(bs(age,df=4, degree=1),"knots") # Check out the knot locations
attr(bs(age,df=6),"knots") # Defalut degree is 3 or cubic
# Notice that this also provides 3 knots because 3 df's are taken by the 3 powers of age

fit.x1.df=lm(wage~bs(age,df=4,degree=1),data=Wage)
summary(fit.x1.df)
pred=predict(fit.x1.df,newdata=list(age=age.grid),se=T)
plot(age,wage,col="gray")
lines(age.grid,pred$fit,lwd=2)
# You should see a similar piecewise linear model but with 4 knots evenly spaced.

# 7.7 Polynomial and Cubic Splines

# For some reason "cubic" splines are very popular. One of the reasons is that a polynomial of
# power 3 provides enough curves, inflexion points, peaks and valleys to fit most data sets. Beyond
# the power of 3 the spline becomes too "wiggly", overfitting, and almost impossible to 
# interpret. This is why the B-Spline function bs() uses a polynomial of 3, or "cubic splines"
# as the default, but you can change this with the "degree" attribute.
fit.x3=lm(wage~bs(age,knots=c(25,40,60)),data=Wage) # Fits a cubic spline, i.e., degree=3
# A cubic spline with d=3 degree and k=3 knots will report 1+d+k=7 coefficients: 
# 1 for the intercept; 3 for x, x squared and x cube; and 3 for each of the knots.
# Take a look:
summary(fit.x3)

# Now let's calculate the predicted values and plot them:
pred=predict(fit.x3,newdata=list(age=age.grid),se=T)
plot(age,wage,col="gray")
lines(age.grid,pred$fit,lwd=2)
# Notice that we have a curvilinear model, but it really contains 4 separate curves joined
# at the knots. Let's add confidence interval bands:
lines(age.grid,pred$fit+2*pred$se,lty="dashed")
lines(age.grid,pred$fit-2*pred$se,lty="dashed")

# 7.8 Natural Cubic Splines

# The ns() function produces cubic splines (so there is no "degree" attribute)
fit.natural=lm(wage~ns(age,df=4),data=Wage)
pred=predict(fit.natural,newdata=list(age=age.grid),se=T)
lines(age.grid, pred2$fit,col="red",lwd=2)
plot(age,wage,xlim=agelims,cex=.5,col="darkgrey")
title("Natural Cubic Spline")
lines(age.grid,pred$fit,lwd=2)

# 7.9 Smoothing Spline

fit.smooth1=smooth.spline(age,wage,df=16) # This model specifies an arbitrary df=16
fit.smooth1 # See how the model find the lambda and CV corresponding to df=16
fit.smooth2=smooth.spline(age,wage,cv=TRUE) # This model lets cross-validation find:
fit.smooth2$lambda # The best lambda
fit.smooth2$df # And the corresponding degrees of freedom
plot(age,wage,xlim=agelims,cex=.5,col="darkgrey")
lines(fit.smooth1,col="red",lwd=2)
lines(fit.smooth2,col="blue",lwd=2)
legend("topright",legend=c("16 DF","6.8 DF"),col=c("red","blue"),lty=1,lwd=2,cex=.8)
title("Smoothing Spline")

# 7.10 Local Regression -- using the loess() function

fit=loess(wage~age,span=.2,data=Wage)
fit2=loess(wage~age,span=.5,data=Wage)
plot(age,wage,xlim=agelims,cex=.5,col="darkgrey")
title("Local Regression")
lines(age.grid,predict(fit,data.frame(age=age.grid)),col="red",lwd=2)
lines(age.grid,predict(fit2,data.frame(age=age.grid)),col="blue",lwd=2)
legend("topright",legend=c("Span=0.2","Span=0.5"),col=c("red","blue"),lty=1,lwd=2,cex=.8)

# 7.11 Generalized Additive Models (GAMs)

# Note: in OLS regression, if the predictors are truly independent with 0 correlation, then
# it makes no difference to fit several individual simple linear regression models, one for each
# variable, than fitting a multivariate model with all the variables. The coefficients in both
# modeling options should be identical. Also, the sub of R squares from the individual single
# models will equal the R square of the multivariate model. However, when there is some
# correlation among the predictors, this does not hold true any more. Reduced models will be
# more biased due to corrlation, and larger models will begin to experience multicollinearity
# and other dimensionality problems.

# The idea behind GAMs is that, since we can add individual single models into a multivariate
# full model, you could add instead different transformations (i.e., basis functions) for each 
# variable. Some variables can be modeled as polynomials, some as splines, others as natural
# cubic splines, and so on.

# We can simply use the lm() function with a different basis function for each variable or not, as needed
gam1=lm(wage~ns(year,4)+ns(age,5)+education,data=Wage)

# But the "gam" library provides more options

install.packages("gam")
library(gam)

# We use the s() function for smoothing splines:
# Year with 4 df's and age with 5 df's
# We leave education as is (it is a qualitative variable)
gam.m3=gam(wage~s(year,4)+s(age,5)+education,data=Wage) 
par(mfrow=c(1,3))
plot(gam.m3, se=TRUE,col="blue") # Plot each variable in gam.m3
# We can plot non-gam objects (such as gam1 which is an lm object) with plot.gam
plot.gam(gam1, se=TRUE, col="red")

# we can fit a number of models
gam.m1=gam(wage~s(age,5)+education,data=Wage)
gam.m2=gam(wage~year+s(age,5)+education,data=Wage)

# And then test them with an F test with anova()
anova(gam.m1,gam.m2,gam.m3,test="F")
# Note that gam.m2 is superior to gam.m1, but gam.m3 does not increase predictive power
summary(gam.m3) # Take a look at the summary

# Now let's make some predictions
preds=predict(gam.m2,newdata=Wage) # Predicting on the full training set

# To include local regression in GAM use the lo() function
# Notice that we use both, the s() function on year and lo() on age
gam.lo=gam(wage~s(year,df=4)+lo(age,span=0.7)+education,data=Wage)
plot.gam(gam.lo, se=TRUE, col="green")

gam.lo.i=gam(wage~lo(year,age,span=0.5)+education,data=Wage)
install.packages("akima")
library(akima)
plot(gam.lo.i)

# 7.12 GAM and Logistic Regression

# We can easily fit a logistic model using the I() function in the dependent variable
gam.lr=gam(I(wage>250)~year+s(age,df=5)+education,family=binomial,data=Wage)
summary(gam.lr)
par(mfrow=c(1,3))
plot(gam.lr,se=T,col="green")
table(education,I(wage>250))
gam.lr.s=gam(I(wage>250)~year+s(age,df=5)+education,family=binomial,data=Wage,subset=(education!="1. < HS Grad"))
plot(gam.lr.s,se=T,col="green")