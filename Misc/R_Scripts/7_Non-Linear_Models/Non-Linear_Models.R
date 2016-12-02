#### 7. NON-LINEAR MODELS ####


## Interaction Terms - Binary x Continuous

# Interaction effects should not be interpreted by thembselves, but in conjunction with their respective main effects before an interaction enhances or offsets a main effect.

# Binary x Continuous interactions are easy to interpret because the interaction effect specifies how much the main effect of the continuous variable changes when the binary variable changes in value from 0 to 1.

# Let's compare a linear with an interaction model to predict car gas mileage

library(ISLR) # Contains the Auto data set

#Let's convert the origin variable into a new variable called "foreign" =1 if European or Japanese and 0 if Amaerican.

data(Auto)
Auto$foreign=ifelse(Auto$origin==1,0,1)

# Linear model without interaction
fit.linear <- lm(mpg~
                   horsepower+weight+foreign+year,
                 data=Auto)
summary(fit.linear)

# Let's add an (binaryxcontinuous) interaction term 
fit.inter <- lm(mpg~
                  horsepower+weight+foreign+year+
                  foreign*weight,
                data=Auto)
summary(fit.inter)

fit.inter.2 <- lm(mpg~
                    horsepower+weight+foreign+year+
                    foreign*weight+foreign*year,
                  data=Auto)
summary(fit.inter.2)

anova(fit.linear, fit.inter, fit.inter.2)

# Interpretation: 

# 1. The linear model indicates that foreign cars have better gas mileage than domestic cars, other things being equal. When we add a foreign*weight interaction term the interaction is negative and significant. Thismeans that the negative effect of weight on gas mileage is stronger for foreign cars that for domestic cars. Or, conversely, the positive effect of being a foreign car is diminished for heavier cars.

# 2. Interestingly, when we add an interaction term foreigh*year, it not only becomes significant, but now the main effect of foreign is negative. This means that foreign cars are less fuel efficient, but this effect is offset rapidly with newer cars.

# 3. The ANOVA tests shows that the 2 interaction model is better than the 1 interaction model, which in turn is better than the linear model.

# R makes this easier for you because ff you only include the interaction term, R knows that the respective main effects also need to be included because interaction effects are meaningless by themselves. Note how R includes the main effects even if we don't explicitly include them:

fit.inter.2 <- lm(mpg~
                    horsepower+foreign*weight+foreign*year,
                  data=Auto)
summary(fit.inter.2)

# If you would like to exclude the main effects for some strange reason, you can do this using the ":" rather than the "*" operator:

fit.inter.not <- lm(mpg~
                      horsepower+foreign:weight+foreign:year,
                    data=Auto)
summary(fit.inter.not)

# Try to intepret these results. It's not really possible.

# You can use the ":" to specify interaction terms when you have explicitly modeled the main effects:

# A recap on how to interprete binary x continuous interaction effects:

# 1. If the interaction effect is not significant, there 
#    are no interaction effects

# 2. If the interaction effect is significant:

#    2.1 If the sign of the interaction effect is in the 
#        same direction as the main effect, then the other 
#        variable "enhances" the main effect.

#    2.2 If the sign of the interaction effect is in the 
#        opposite direction than the main effect, then the 
#        other variable in the interaction term "offsets" or 
#        "diminishes" the main effect.

#    3.1 If the continuous variable does not have a significant main
#        effect, then it's effect is not significant when the binary
#        variable value is 0, but it is significant when it is 1.

# For example, in the model below lstat has a negative effect on median home values and the interaction effect with age is significant. This means that age and lstat offset each other. In other words, lstat has a negative effect on median home values, but this negative effect is diminished with the age of the housing.


## Interaction Terms - Continuous x Continuous

# These interaction effects are tricky to interpret. Proceed with caution.

# When multiplying two continuous variables to create an interaction term the resulting model will suffer from a number of issues:

# 1. High multicollinearity -- if the two main effects are 
#    somewhat correlated, their product will be highly 
#    correlated with both

# 2. Scale invariance -- when you change the scale of a 
#    variable in OLS (e.g., inches to feet) the p-value 
#    of its coefficient does not change and the value of 
#    the coefficient will change proportionally (e.g., 
#    the effect of increasing 1 foot is 12 times the 
#    effect of increasing 1 inch)

# 3. Effect interpretation -- the interaction effect 
#    represents the effect change of one variable when 
#    the other one is 0, and vice versa 
#    (y=b1x1+b2x2+bintx1x2). But this is not useful if 
#    0 is not a possible value for one of the variables 
#    (e.g., number of rooms in a house; weight of a car).

# Centering the dependent variable and both variables involved in the interaction term solves the problems above:

# 1. With uncentered variables, if both variables have 
#    a positive value then their product will be positive, 
#    thus generating collinearity. But if the variables 
#    are centered, then their values may be positive or 
#    negative, so their product will be less correlated

# 2. With centered variables, it can be shown that the 
#    main effects will remain scale invariant.

# 3. Because centered variables take the value of 0 at 
#    their respective means, the resulting interaction 
#    term represents the effect of one variable when the 
#    other one is at its mean, which is more meaningful 
#    for interpretation. 

# Once the variables are centered, they are modeled in a similar manner to binary variables. Let's illustrate this:

library(MASS) # To access the Boston data set
attach(Boston)

# This is the incorrect way and may lead to wrong conclusions when we don't center variables

inter.fit.uncenter <- lm(medv~lstat*age,data=Boston)
summary(inter.fit.uncenter)

# Now let's center the response variable and the two variables in the continuous x continuous interaction term:

Boston$medv = scale(Boston$medv, center=TRUE, scale=FALSE)
Boston$lstat = scale(Boston$lstat, center=TRUE, scale=FALSE)
Boston$age = scale(Boston$age, center=TRUE, scale=FALSE)

inter.fit.uncenter <- lm(medv~lstat*age -1,data=Boston)

# Note: The -1 fits a regression without an intercept. Since we have centered all variables, the regression line should go through the origin. Forcing the regression through the origin is not necessary if there are other uncentered variables in the model

summary(inter.fit.uncenter)


## Polynomial Regression

# Before we start with polynomials, let's take a look at the Wage data

library(ISLR) # Contains the Wage data
attach(Wage) # Please note the W in caps
head(Wage)

# Caution: note that there is a variable also called "wage" but with a lower case w, which contains the wage for each person

plot(wage, age) # Take a look at the data, visually

# A casual inspection of the plot suggests that the relationship between wage and age is not linear

Wage$wage # Take a look at all the wages
Wage$age # and all the ages

# Let's start simple, with a linear model
fit.poly1=lm(wage~age,data=Wage)
summary(fit.poly1)
# Good fit; age is significant; very low R-Square

# Let's try a squared model
fit.poly2=lm(wage~poly(age,2),data=Wage)
summary(fit.poly2)
# Good fit; significant squared term; R-Square improve just a tad

# Let's fit a polynomial up to the power of 4
fit.poly4=lm(wage~poly(age,4),data=Wage)
summary(fit.poly4)

anova(fit.poly1, fit.poly2, fit.poly4)

# Good fit; significant squared and cube term; 4th poly coefficient is not significant; R-Square improve just a smigeon. Higher polynomial model has stronger predictive power.

# The higher the poly power; the higher the R-square; the better the fit; but you start running into dimensionality problems and overfitting and the model becomes more difficult to intepret.

# Important Note: the poly() function does not give coefficients for x, x-square, x-cube, etc., but for an "orthogonal polynomial" of these variables. This sounds complicated, but these are simply the principal components of the polynomial vairables. This is done by the poly() function because including various powers of a variable will create high multi-collinearity. With these orthogonal polynomials, all 4 variables have 0 correlation, no multi-collinearity, therefore yielding more stable models. However, the interpretation of orthogonal polynomials is tricky because it is hard to relate them to the original variable x. But polynomial are hard to interpret anyway, orthogonal or not.

# If you would like to fit a model using the raw variables x, x-squared, x-cube, etc., without converting these variables into an orthogonal polynomial, just use the attribute raw=TRUE or raw=T

fit.poly4.raw=lm(wage~poly(age,4,raw=T),data=Wage)
summary(fit.poly4.raw)

# Alternatively, you can elevate to the respective power manually
fit.poly4.I=lm(wage~age+I(age^2)+I(age^3)+I(age^4),data=Wage)
summary(fit.poly4.I)
# Notice that the results are identical to the previous poly model

# Predictions with Polynomials

# Rather than using all data points, let's get a list of the unique age values in the data and make predictions for these values. We start by computing the range of the data, that is the lower and upper values of the age variable range using range()
agelims=range(age)
agelims # Take alook -- the ages range between 18 and 80

# Now lets create a sequence of numbers containing every age in the data using the seq() function and store it in an object named age.grid:

age.grid.by10=seq(from=agelims[1],to=agelims[2], by=10)

# agelims is a vector with 2 values, so agelims[1]=18 and agelims[2]=80, so the command above creates a sequence of ages from 18 to 80 increments of 10.

age.grid.by10 # Take a look

# If we omit the "by=10" the ages will be incremented by 1 (default)

age.grid=seq(from=agelims[1],to=agelims[2])
age.grid # Take a look

# Now let's run the predict() function for all the ages in the data, and include standard errors in the output

preds=predict(fit.poly4.raw,newdata=list(age=age.grid),se=TRUE)

# The command above seems convoluted, but we are using new data to make predictions. Since our only prediction is a variable named "age", we need to use the command list(age=age.grid) to create a variable called "age" and assign to this variable each of the unique age values contained in age.grid. Notice that age.grid and list(age=age.grid) yield the same values:

age.grid
list(age=age.grid)

# but notice that the list has the $age name designation, which the fit.poly.raw linear model expects

# Now, let's take a look at the predicted wages and standard errors for these predictions

preds 

# Let'do some plotting -- NOTE: you can only plot Y against a single X predictor

# Let's split the plot frame and do some visualization and move the margins to make room for a title

par(mfrow=c(1,1),mar=c(4.5,4.5,1,1),oma=c(0,0,4,0)) 
# mar() controls the number of lines at the bottom, left, top right
# oma() control the outer margins -- play with these values

# Plot the dots first
plot(age,wage,xlim=agelims,cex=.5,col="darkgrey") # Do the plot first
title("Degree-4 Polynomial",outer=T) # Add a title

# Now draw a line with the ages and predicted wage values
lines(age.grid,preds$fit,lwd=2,col="blue")

# Now draw confidence intervals at +/- 2 standard errors
lines(age.grid,preds$fit-2*preds$se.fit,lwd=1,col="red") 
lines(age.grid,preds$fit+2*preds$se.fit,lwd=1,col="red") 

# One important observation: whether you use the raw x, x-squared, x-cube, etc. or orthogonal polynomials, the predicted values will be identical. Take a look

preds2=predict(fit.poly4,newdata=list(age=age.grid),se=TRUE)
# preds uses raw polynomials and preds2 uses orthogonal polynomials

max(abs(preds$fit-preds2$fit)) # Notice how small are the differences

# If you would like to find the best polynomial, you can test how much predictive power you add every time you add a higher polynomial term, using the anova() function, as explained above for testing reduced vs. extended sets:

fit.1=lm(wage~age,data=Wage) # Just x
fit.2=lm(wage~poly(age,2,raw=T),data=Wage) # Add x-squared
fit.3=lm(wage~poly(age,3,raw=T),data=Wage) # etc.
fit.4=lm(wage~poly(age,4,raw=T),data=Wage)
fit.5=lm(wage~poly(age,5,raw=T),data=Wage)

# Now let's do an F-Test with ANOVA
anova(fit.1,fit.2,fit.3,fit.4,fit.5)

# These results support model 3, which has x-cube -- beyond that the power does not increase significantly

summary(fit.3) # Note that all coefficients are significant

# Interestingly, when we add higher power coefficients the model breaksdown

summary(fit.5) 

# Important note: we used raw variables, but the book example uses orthogonal polynomials.This means that the coefficients will be different, but the ANOVA F-Tests should yield similar results

# You can try adding other variables and testing them with F-tests, for example:

fit.1=lm(wage~education+age,data=Wage)
fit.2=lm(wage~education+poly(age,2, raw=T),data=Wage)
fit.3=lm(wage~education+poly(age,3, raw=T),data=Wage)
anova(fit.1,fit.2,fit.3)


## Polynomial Logistic Regression

# IMPORTANT: Try on your own after the classification models lecture

# Let's try the same method with Logistic regression with the dependent variable as the probability that Wage is greater than 250K using orthogonal polynomial

library(ISLR) # Contains the Wage data
attach(Wage)
head(Wage)

fit.logit=glm(I(wage>250)~poly(age,4),data=Wage,family=binomial)
summary(fit.logit) # Take a look

# Before we do predictions, let's re-create the age.grid data. No need to re-create it if you have not shut down R Studion sin you created it

agelims=range(age)
age.grid=seq(from=agelims[1],to=agelims[2])

# Now let's do predictions on the same age range we used above

preds=predict(fit.logit,newdata=list(age=age.grid), se=T)
# The preds vector has one predicted value for each age.grid value
preds # Take a look at the log-odds of Wage>250K predictions

preds.odds=exp(preds$fit) # Odds predictions of Wage>250K
preds.odds # Take a look

preds.probs=preds.odds/(1+preds.odds) # Probability predictions
preds.probs # Take a look

# Now let's compute the confidence interval as predicted value +/- 2 standard errors, using the log odds (you can try odds and probs).

se.bands = cbind(preds$fit-2*preds$se.fit,
                 preds$fit+2*preds$se.fit)
se.bands # Take a look

# And also let's do the same for odds and probabilities:

se.bands.odds = exp(se.bands)
se.bands.odds # Take a look
se.bands.probs = se.bands.odds/(1+se.bands.odds)
se.bands.probs # Take a look

# Note: if we use type="response" with the predict() function, it causes the predicted values to be the probabilities; otherwise the default is log-odds.

preds.probs.2=predict(fit.logit,newdata=list(age=age.grid), 
                      type="response", se=T)
preds.probs.2 # Take a look

# Now let's do the plotting

plot(age,I(wage>250),xlim=agelims,ylim=c(0,1))
lines(age.grid,preds.probs,lwd=2, col="blue")

# matlines (matrix lines) works like lines but plots all columns of a matrix, in this case it plots both columns of se.bands.probs against age
matlines(age.grid,se.bands.probs,lwd=1,col="red",lty=3)

# We can aplify up the plot by changing the ylim to 0,0.2 and dividing the I by 5 just so that the 1's show up in the 0,0.2 range

plot(age,I(wage>250)/5,xlim=agelims,ylim=c(0,0.2))
lines(age.grid,preds.probs,lwd=2, col="blue")
matlines(age.grid,se.bands.probs,lwd=1,col="red",lty=3)

# Notice the "wagging the tail" issue, typical of polynomials


## Step Functions

library(ISLR) # Contains the Wage data
attach(Wage)
head(Wage)

# As illustrated in the plot above, polynomials tend to over-fit the data and yield high-variance models. "Wagging the tail" is a common issue with polynomials in which the standard error band widens at the tail-end of the data. Why do you think that is? Well, if there is error in x, the errors get amplified with powers of x, particularly as x gets larger.

# Step functions alleviate this problem to some extent. A step function fits a bunch of horizontal lines in different "segments" or "partitions" of the data. The points where the partitions begin and end are called "cut points". To fit a Step function, we can use the cut() function to arbitrarily divide the age data into, say 4 partitions.

table(cut(age,4))
fit.step=lm(wage~cut(age,4),data=Wage)
summary(fit.step) # Take a look

# Let's do some predictions with the age.grid data
preds=predict(fit.step,newdata=list(age=age.grid),se=T)
preds # Take a look

# Let's inspect the results visually
plot(age,wage,xlim=agelims,cex=.5,col="darkgrey") # Do the plot first
title("Step Regression of Wage on Age",outer=T) # Add a title

# Let's draw a line with the ages and predicted wage values
lines(age.grid,preds$fit,lwd=2,col="blue") 

# And also the confidence interval line with age; 
# Note: you can use this method or the matlines() method above
lines(age.grid,preds$fit-2*preds$se.fit,lwd=1,col="red") 
lines(age.grid,preds$fit+2*preds$se.fit,lwd=1,col="red") 
# Notice that the "tail wagging" issue has been reduced

# The problem now is that we have a bunch of horizontal lines, which don't capture trends. It seems like sloping the lines can give us a better fit, which is what Piecewise Linear Regression does.


## Piecewise Linear Regression 

# This code is not in the textbook

library(ISLR) # Needed to acces the Wage data set
attach(Wage)
head(Wage)

# To fit a sequence of regression lines sequentially along the data, we first need to figure out the "knots" or "cut points", where the regression slope changes. Take a look at the data first:
plot(age,wage)

# Or, better, lets gray the dots to see the lines better
plot(age,wage,xlim=agelims,cex=.5,col="darkgrey")

# Visually, it appears that the data changes directions at ages 25, 40 and 60. So, let's build a stepwise linear regression model with 3 knots yielding 4 different but connected regression lines (i.e., segments) to the right and left of each knot. To do this, we can create dummy variables that are 0 to the left of each knot and 1 to the right. We can then add the interaction term of this dummy variable with age.

fit.piecewise=lm(wage~age+
                   I((age-25)*(age>25))+
                   I((age-40)*(age>40))+
                   I((age-60)*(age>60)), 
                 data=Wage)

# Note that the I() function creates the respective dummy variables and interaction terms. Also note that we use (age-25) rather than age in the first interaction term, which is equivalent to moving the Y axis to the knot at age=25 and then multiply it by (age>25), which will yield 0 for age<=25 and age for age>25 we then apply the I() function to the whole operation.

summary(fit.piecewise) # Take a look at the results

# Interpretation: the intercept is at -42.47. The regression slope starts with 5.38K more wage dollars for every additional year of age, up to age 25. At that point the slope changes to 5.38-3.50=1.88K more wage per year of age, upt to age 40. Then, it changes to 1.88-1.98 = -0.10K less wage dollars for every additional year of age (i.e., almost flat), up to age 60. After that it declines at the rate of -0.10-1.40 = -1.50K fewer dollars for each additional year of age.

# Let's look at this visually. First, let's create a vector with age values of interest -- 0, the 3 knots and 80 (the largest age in the set)

age.knots=c(0,25,40,65,80)

# Now let's predict wages for these 5 values, with standard errors
preds=predict(fit.piecewise,list(age=age.knots), se=T)

# Note also that we assign a variable name "age" to the age.knot list because that's the predictor variable name stored in the fit.piecewise object. 

# Now, let's plot all the data using gray dots
plot(age,wage,col="gray")

# Now let's draw blue lines between the knots, which will show the picewise linear model line by connecting the dots between knots

lines(age.knots,preds$fit,col="blue",lwd=2)

# Lower and upper confidence interval lines
lines(age.knots,preds$fit-2*preds$se.fit,col="red",lwd=1)
lines(age.knots,preds$fit+2*preds$se.fit,col="red",lwd=1)
# A little "tail wagging, but not as much as with the polynomial"


## Splines

# The piecewise linear model above is very interpretable, and tend to has better fit than polynomials and step functions because we can set as many knots as we want and therfore control the slopes in the various resulting segments. But if we are not so interested in interpretation, and are more interested in making predictions, regression splines are an alternative option. Spline regressions are easier to formulate and we can not only fit linear splines, but also polynomial splines tjat connect knots with curves, rather than lines. Naturally, interpretation becomes almost impossible as we include polynomial splines, but the prediciton can be more accurate some times because the regression line can follow the data more precisely (but be careful with overfitting). Let's take a look.

library(ISLR) # Needed to acces the Wage data set
library(splines) # Needed to fit spline models
attach(Wage)

# Linear Spline Regression

# We use the bs(){splines} function, which builds polynomial splines at the specified cut points. "degree=1" specifies a linear spline,whereas higher degrees specify polynomials

fit.x1=lm(wage~bs(age,knots=c(25,40,60), degree=1),data=Wage)

# This model fits wage as a linear function of age, so it will return 4 coefficients -- 1 for age and then 1 for each of the three segments after each knot. That is, if d=1 (degree 1) and K=3 (knots) there will be K+1=4 coefficients (one for each segment). 

summary(fit.x1) # Take a look

preds=predict(fit.x1,newdata=list(age=age.grid),se=T)
plot(age,wage,col="gray")
lines(age.grid,preds$fit,col="blue",lwd=2)

# You should see 4 different regression lines changing at the knots, almost identical to the piecewise linear model above.

preds=predict(fit.x1,list(age=age.knots),se=T)
# Note: read the red warning -- it's not an error, just a warning

preds # Take a look at the predicted wages at the knots
plot(age,wage,col="gray")
lines(age.knots,preds$fit,col="blue",lwd=2)

# Confidence intervals
lines(age.knots,preds$fit-2*preds$se.fit,col="red",lwd=1)
lines(age.knots,preds$fit+2*preds$se.fit,col="red",lwd=1)

# Another way to locate the knots

# In the model above we arbitrarily set the knots at ages 25, 40 and 60. However if we would like to split the spline segments and knots evenly we can use the "df" (degrees of freedom) parameter, rather than the "knots" parameter. If df=4, this means that there are 4 spline segments with 3 knots in between. Take a look:

dim(bs(age,df=4, degree=1)) # Creates 4 partitions with 3 knots

# Check out the knot locations
attr(bs(age,df=4, degree=1),"knots") # Knots are evenly spaced
attr(bs(age,df=6),"knots") # Defalut degree is 3 or cubic

# Notice that this also provides 3 knots because 3 degrees of freedom are taken by the 3 powers of age

# Let's fit a linear spline with df=4

fit.x1.df=lm(wage~bs(age,df=4,degree=1),data=Wage)
summary(fit.x1.df)
preds=predict(fit.x1.df,newdata=list(age=age.grid),se=T)
plot(age,wage,col="gray")
lines(age.grid,preds$fit,col="blue",lwd=2)

# Confidence intervals
lines(age.grid,preds$fit-2*preds$se.fit,col="red",lwd=1)
lines(age.grid,preds$fit+2*preds$se.fit,col="red",lwd=1)
# You should see a similar piecewise linear model but with 4 knots evenly spaced.


## Polynomial and Cubic Splines

# For some reason "cubic" splines are very popular. One of the reasons is that a polynomial of power 3 provides enough curves, inflexion points, peaks and valleys to fit most data patterns. Beyond the power of 3 the spline becomes too "wiggly", overfitting, and almost impossible to interpret. This is why the B-Spline function bs() uses a polynomial degree default of 3, or a "cubic spline" but, naturally, you can change this with the "degree" attribute.The next model fits a cubic spline, i.e., degree=3

fit.x3=lm(wage~bs(age,knots=c(25,40,60)),data=Wage) 

# Technical Note: the bs() function generates a B-Spline Basis function which is a convenient and simple way to model a polynomial spline. The most popular polynomial spline is the cubic spline, so I refer to cubic splines in this explanation, but the principle applies to any polynomial. The idea is to fit a separate cubic regression in each of the spline segments. But formulating separate cubic regressions is too complex and uses too many degrees of freedom. 

# The B-Spline approach simplifies this by estimating a general cubic model for all the data, and then estimating a cubic term for each segment, which specifies how much the coefficient of the cubic term changes in each segment. For convenience, this segment correction is only applied on the cubic term (or highest polynomial term), thus simplifying the model. For example, the model above will yield 7 coefficients (or 1+d+k coefficients for a B-spline polynomial model of degree d with k knots):

# 1. The first coefficient is the regression intercept

# 2. The next 3 coefficients (1-3) are for x, x^2 and x^3 (or d 
#   coefficients for x to x^d in a d polynomial)

# 3. The next 3 coefficients (4-6) are for the basis function for
#   each of the 3 knots (or k coefficients for k knots), that is for:
#   Knot 1: (x-k1)^3*I(x-k1)
#   Knot 2: (x-k2)^3*I(x-k2) and
#   Knot 3: (x-k3)^3*I(x-k3)
#   Knot n: (x-kn)^3*I(x-kn) (for more than 3 knots)

summary(fit.x3) # Take a look

# This is difficult to interpret, but the good news is that if you are using cubic splines is because your analysis goal is predictive accuracy, not interpretation.

# Now let's calculate the predicted values and plot them:

preds=predict(fit.x3,newdata=list(age=age.grid),se=T)

# Note: we are using the age.grid values (which contain all unique ages in the data) rather than age.knots because we are no longer plotting straight lines between knots (the spline is curvilinear)

plot(age,wage,col="gray")
lines(age.grid,preds$fit,col="blue",lwd=2)

# Notice that we have a curvilinear model, but it really contains 4 separate curves joined at the knots. 

# Confidence intervals, this time with "dashed" lines

lines(age.grid,preds$fit+2*preds$se, col="red", lty="dashed")
lines(age.grid,preds$fit-2*preds$se, col="red", lty="dashed")


## Natural Cubic Splines

# Polynomial splines are notorious for having high variance at the beginning and tail ends of the data range, as exemplified in the plot above. A "Natural Spline" makes a simple correction to reduce this problem by forcing the first and last segments to a straight line, rather than a curve.

# The ns() function produces natural cubic splines (so there is no "degree" attribute with this function)

fit.ns=lm(wage~ns(age,df=4),data=Wage)
preds.ns=predict(fit.ns,newdata=list(age=age.grid),se=T)

# Let's first superimpose a natural spline line in the current plot
lines(age.grid, preds.ns$fit,col="green",lwd=2)

# Now let's graph a clean plot for the natural spline
plot(age,wage,xlim=agelims,cex=.5,col="darkgrey")
title("Natural Cubic Spline")
lines(age.grid,preds.ns$fit,col="green",lwd=2)

# Confidence intervals
lines(age.grid,preds.ns$fit-2*preds.ns$se,col="red",lwd=1,lty="dashed")
lines(age.grid,preds.ns$fit+2*preds.ns$se,col="red",lwd=1,lty="dashed")


## Smoothing Spline

# A quick spline Summary:

# A piecewise spline fits a different model in each segment delimited by knots, but the lines of two contiguous segments don't connect at the knot

# A spline forces these segment models to connect at the knots using basis functions or other means. But the model may have high variance at the head and tail ends of the curve. Also, the slope of the model at the right and left side of the knots will be different.

# A natural spline minimizes the first problem by forcing the first and last segments to a straight line

# A smoothing spline addresses the second problem by forcing the curve to have the same slope at the left and right and all around a each knot

# This model specifies an arbitrary df=16
fit.smooth1=smooth.spline(age,wage,df=16) 
fit.smooth1 
# See how the model find the lambda and CV corresponding to df=16

# This model lets cross-validation find the best lambda
fit.smooth2=smooth.spline(age,wage,cv=TRUE) 
fit.smooth2$lambda # The best lambda
fit.smooth2$df # And the corresponding degrees of freedom

# Let's plot the results

plot(age,wage,xlim=agelims,cex=.5,col="darkgrey")
lines(fit.smooth1,col="red",lwd=2)
lines(fit.smooth2,col="blue",lwd=2)
title("Smoothing Spline")
legend("topright",legend=c("16 DF","6.8 DF"),
       col=c("red","blue"),lty=1,lwd=2,cex=.8)


## Local Regression

# Try on your own -- We are not focusing on local regression in this class, but here are some R commands if you wish to model one

# loess(){stats} fits local regressions

fit.local=loess(wage~age,span=.2,data=Wage) 
fit.local.2=loess(wage~age,span=.5,data=Wage)
plot(age,wage,xlim=agelims,cex=.5,col="darkgrey")
title("Local Regression")

lines(age.grid,predict(fit.local,data.frame(age=age.grid)),
      col="red",lwd=2)

lines(age.grid,predict(fit2,data.frame(age=age.grid)),
      col="blue",lwd=2)

legend("topright",legend=c("Span=0.2","Span=0.5"),
       col=c("red","blue"),lty=1,lwd=2,cex=.8)


## Generalized Additive Models (GAMs)

# Try on your own

# In OLS regression, if the predictors are truly independent with 0 correlation, then it makes no difference to fit several individual simple linear regression models, one for each variable, than fitting a multivariate model with all the variables. The coefficients in both modeling options should be identical. 

# Also, the sum of R squares of the individual single models will equal the R square of the multivariate model. However, when there is some correlation among the predictors, this does not hold true any more. Reduced models will be more biased due to corrlation, and larger models will begin to experience multicollinearity, high variance and other dimensionality problems.

# The idea behind GAMs is that, since we can add individual single models into a multivariate full model, you could add instead different transformations (i.e., basis functions) for each variable. Some variables can be modeled as polynomials, some as splines, others as natural cubic splines, and so on.

# Again, GAM models are almost impossible to interpret, but they can help improve predictive accuracy

# One way to do this is to simply use the lm() function with a different basis function for each variable or not, as needed

gam1=lm(wage~ns(year,4)+ns(age,5)+education,data=Wage)

# But the {gam} library provides more options

install.packages("gam") # If not installed already
library(gam)

# We use the s() function for smoothing splines: Year with 4 df's and age with 5 df's We leave education as is (it is a qualitative variable)

gam.m3=gam(wage~s(year,4)+s(age,5)+education,data=Wage) 
par(mfrow=c(1,3))
plot(gam.m3, se=TRUE,col="blue") # Plot each variable in gam.m3

# We can also plot non-gam objects (such as gam1 which is an lm object) with plot.gam

plot.gam(gam1, se=TRUE, col="red")

# We can fit a number of models gam.m1=gam(wage~s(age,5)+education,data=Wage)
gam.m2=gam(wage~year+s(age,5)+education,data=Wage)

# And then test them with an F test with anova()
anova(gam.m1,gam.m2,gam.m3,test="F")

# Note that gam.m2 is superior to gam.m1, but gam.m3 does not increase predictive power

summary(gam.m3) # Take a look at the summary

# Now let's make some predictions
preds=predict(gam.m2,newdata=Wage) # Predicting on the full training set

# To include local regression in GAM use the lo() function Notice that we use both, the s() function on year and lo() on age

gam.lo=gam(wage~s(year,df=4)+lo(age,span=0.7)+education,data=Wage)
plot.gam(gam.lo, se=TRUE, col="green")

gam.lo.i=gam(wage~lo(year,age,span=0.5)+education,data=Wage)
install.packages("akima")
library(akima)
plot(gam.lo.i)


## GAM and Logistic Regression

# Try on your own

# We can easily fit a logistic model using the I() function in the dependent variable

gam.lr=gam(I(wage>250)~year+s(age,df=5)+education,
           family=binomial,data=Wage)
summary(gam.lr)

par(mfrow=c(1,3))
plot(gam.lr,se=T,col="green")
table(education,I(wage>250))

gam.lr.s=gam(I(wage>250)~year+s(age,df=5)+education,
             family=binomial,data=Wage,
             subset=(education!="1. < HS Grad"))
plot(gam.lr.s,se=T,col="blue")
