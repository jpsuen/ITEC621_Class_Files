#### 4. DATA PRE-PROCESSING ####


# Experts state that about 80% of an analytics project goes into data work that needs to be done before analysis can be done with that data. This is generally referred to as data "pre-processing". There are many reasons to do pre-processing and various types of pre-processing that can be done. But these can be generally classified into two broad categories: (1) data quality; and (2) data transformactions. 

# Data quality pre-processing involves things like dealing with things like: missing data; incorrect or inconsistent data; inappropriate data formats or spelling/punctuation issues, etc. A lot of the data quality work in data preprocessing is often done with the analytical tools, as they all have data evaluations and manipulation tools. But the most effective ways of working with data is the realm of "database" and "big data" fields, and it is a key skill in the "data science" profession.

# We will cover "data transformations" in this section. These have to do with data manipulations that are done to: 

# (1) comply with a particular model assumption (e.g., lagged models in forecasting; weighted regression models to correct for heteroscedasticity, etc.); 

# (2) improve the predictive accuracy of a model (e.g., logs, Box-Cox, etc.); and 

# (3) convert categorical and other non-quantitative data into quantitative data that can be used for statistical analysis 
# (e.g., categorical to dummy variables, word counts, etc.)

# While it is often necessary or desirable to transform predictor variables, many regression models are robust when it comes to predictor variables (e.g., predictor variables often don't need to be normally distributed). In contrast, dependent variables must be transformed to the correct types of values for the particular model. For, example, if the dependent variable is binary or categorical, you must transform the outcome variable and use a logistic, discriminant or other classification models. Good news: R makes this very easy.


## Transformation 1: Categorical To Dummy Variable Predictors

# Qualitative variables (e.g., states, categories, etc.) are not quantitative and they cannot be used as is for statistical analysis. Qualitative data has to be converted into some form of quantitative data. If the dependent variable is qualitative then you need to employ classification methods like logistic regression. When the independent variables are qualitative you can use the data with some conversions. R makes this very easy.

# The most common way to deal with qualitative variables is to create dummy variables. For example, if you have 50 states and you want to analyze whether the state where the house is located has an effect on the house value, you can create 50 dummy variables, one for each state. For example, the variable MD will take a value of 1 if the state is Maryland and 0 otherwise. 

# Each state dummy variable would be constructed in a similar manner. You would then leave one of these variables out of the model which will be the "baseline" or "reference" variable (e.g., MD). You would then include in the model the remaining 49 state dummy variables. The intercept coefficient of this model gives you the effect of the baseline or reference variable (e.g., the median housing value prediction for the state of MD). Each of the other 49 state coefficients will give you the price difference for that state, relative to the reference variable (i.e., MD).

# There are two ways to do this: you create the dummy variables yourself or you let R do it for you (with less control). Let's use the Carseats data set:

library(ISLR) # Contains the "Carseats" data set
data(Carseats) # Load the Carseats data set with qualitative variables
fix(Carseats) # Only if you want to edit the data
names(Carseats) # Briefly inspect the variable names
?Carseats # See the description for ShelveLoc

# In the model below, qualitative variables will be converted into multiple dummy variables. The qualitative variable ShelveLoc has 3 values: Bad, Medium and Good. If we include ShelveLoc in the model R will convert this into only 2 variables: ShelveLocGood and ShelveLocMedium. R automatically names these variables with the original variable name with the respective qualitative value appended to the variable name. R also drops one of the three dummy variables, automatically, which is the first one alphabetically, or ShelveLocBad in this case.  

# The "Dummy Variable Trap"

# If you have a group of dummy variables, which are mutually exclusive, then one of these variables is fully dependent on the others. For example if all the 49 state dummy variables have a value of 1, then the MD variable must be 1 (i.e., if it is not one of the 49 included states, it must be the excluded states). If you were to include all 50 variables, any one of these variables will be fully dependent on the other 49. This totally violates the OLS assumption of variable independence and the OLS is literally unsolvable because you would have perfect multicollinearity. This problem is commonly referred to as the "Dummy Variable Trap". Older statistical software would simply hang or give you an error (the standard errors are infinite). But modern statistical software detect this linear dependency and automatically exclude one of the variables to avoid the dummy variable trap.

levels(Carseats$ShelveLoc) # Check the unique levels of ShelveLoc
lm.fit=lm(Sales~.,data=Carseats)
summary(lm.fit)

# Notice that the qualitative variable ShelveLoc was automatically converted into dummy variables. Also notice that ShelveLocBad was excluded from the model and only ShelveLocMedium and ShelveLocGood were included. The intercept represents the average sales for ShalveLocBad, when all other variables are 0. ShelveLocMedium shows how much the price changes when you go from a bad shelf location to a medium shelf location/

# To see the categorical to dummy variable conversion:

attach(Carseats) # To load the file into memory
contrasts(ShelveLoc) # Shows how the dummy variables were coded

# It is pretty obvious from this contrast table that "Bad" is the baseline variable omitted.

# Re-Leveling

# If you want to change the baseline or reference dummy variable you can use the relevel() function to pick the reference level variable to exclude. The value you enter in ref has to match an existing level in the data (case sensitive). For example, in the above model "Bad" is the ShelveLoc reverence level chosen by R by default because it is the first one alphabetically. If you want to use "Good" as the reference level, do the following:

Carseats$ShelveLoc <- relevel(Carseats$ShelveLoc, ref="Good")
summary(lm(Sales~.,data=Carseats)) # Check it out


## Transformation 2: Polynomials

# We will cover polynomial models in more depth later on, but we discuss polynomials here in the context of variable transformations.

# Include a quadratic term in the model

lm.fit2=lm(medv~lstat+I(lstat^2), data=Boston) 

# Note the use of the I() function, which is the "as iS" function. ^2 in R has other interpretations, so I(lstat^2) is needed to tell R to treat the ^2 as a square

summary(lm.fit2)
lm.fit=lm(medv~lstat, data=Boston) # Model withouth quadratic term
summary(lm.fit)

# Note that the R-squared for the quadratic model is larger than the one for the linear model. However, to evaluate if the difference is significant we need an ANOVA test (or F-test, which is similar)

anova(lm.fit,lm.fit2) # Tests if quadratic model is superior

# The F-statistic is quite high and the p-value is <0.001, so, yes the quadratic model is statistically superior and provides
# additional explanatory power

par(mfrow=c(2,2)) # Lets split the screen into 2 x 2 frame
plot(lm.fit2) # Display diagnostic plots

# Polynomial Terms -- the "poly()" function

# You can use the poly() function to model higher polynomials (more on this later). For example, this will add quadratic, cube, etc. terms up to the 5th power:

lm.fit5=lm(medv~poly(lstat,5), data=Boston) 
summary(lm.fit5) # See the higher R-Squared
anova(lm.fit,lm.fit5) # Test if the polynomial model is superior

# Both, p-values and F-test supports the polynomial variables

# Note: there are subtle differences between elvating 
#    variables to a given power and using the poly()
#    function. We explain this further later.


## Transformation 3: Box-Cox

# The Box-Cox transformation is actually a family of various transformations (see lecture slides). It tries several values of a parameter called "lambda" and selects the one that best approximates a normal distribution for the outcome variable. The coefficients in ox-Cox transformed models are difficult to interpret, but a Box-Cox transformation my improve predictive accuracy. The "boxcox(){MASS}" function tests Box-Cox transformations

library(MASS) # Needed for the boxcox() function
attach(Boston) # We will work with this data

lm.fit=lm(medv~lstat, data=Boston) # Try a linear model first
summary(lm.fit) # Take note of the R squared

boxcox(lm.fit) # Now let's try Box-Cox transformations

# Notice the maximum likelihood is slightly above 0. Let's amplify the graph from lambda = -0.1 to 0.1 in 0.01 increments:

boxcox(lm.fit, lambda = seq(-0.1, 0.1, 0.01))

# Best lambda is around 0.04, let's model it. Let's transform the outcome variable accordingly:

medv.box=medv^0.04 # Let's create the Box-Cox transformed variable
lm.fit.box.cox=lm(medv.box~lstat, data=Boston)
summary(lm.fit.box.cox) # Notice the improvement in the R-Squared

# Let's split the plot window to see both regression lines side by side

par(mfrow=c(1,2)) # Divide the output into a 2x2 frame
plot(lstat, medv) # Plot the linear model first
abline(lm.fit,lwd=3,col="red") # And its regression line
plot(lstat, medv.box) # Now plot the Box-Cox transformed model
abline(lm.fit.box.cox,lwd=3,col="red") # Notice the improvement in fit


## Transformation 4: Log Models

# Dependent variables are often logged if they have skewed distributions. A log transformation is also necessary when the outcome variable contains counts (e.g., number of applicants, number of store visitors, etc.) -- see Transformation 5 below on count data.

# Independent variables with a skewed distributio don't need to be log-transformed if the sample size is large (degrees of freedom > 50. But with smaller samples the sample means can no longer assumed to be normal, so log transformation may be necessary.

require(ggplot2) # Contains the "diamonds" data set
attach(diamonds)
# Inspect for normality with histograms and QQ-Plots
hist(diamonds$price, main="Diamond Price", xlab="Price")
qqnorm(diamonds$price); qqline(diamonds$price)

# Note: a QQ-Plot plots the actual data quartiles against the quartiles of normally distributed data, so if the data is normal, the plot will be a straight line. The qqline function draws a reference line that goes throught he 1st and 3rd quartile of the data. The more the data departs from the line the less normal it is.

# Now let's look at the logged data
hist(log(diamonds$price), main="Diamond (Log) Price", xlab="Log Price")
qqnorm(log(diamonds$price)); qqline(log(diamonds$price))
# Much better normal distribution

# Let's look at housing data and model a log linear regression
attach(Boston)
hist(medv) # Slightly skewed to the left
qqnorm(medv); qqline(medv) # Produces a Q-Q Plot, along with a Q-Q line

# If the data is normally distributed, the dots fall along the line You can see how the data deviates from the line at the far right

# Now let's check the logged data
hist(log(medv)) # More normally distributed
qqnorm(log(medv)); qqline(log(medv)) # A bit better

summary(lm(medv~log(rm),data=Boston)) 

# The coefficient for log(rm) is 54.05; This means that a 1% increase in rooms increases medv by 54.05/100 or 0.5405 units

# Now let's log-transform the dependent variable only

summary(lm(log(medv)~rm,data=Boston)) 

# The coefficient for rm is 0.36; This means that a 1 unit increase in room leads to a 100*0.36 or 36% increase in medv

# Now let's try a log-log (elasticity) model

summary(lm(log(medv)~log(rm),data=Boston)) 

# The coefficient for log(rm) is 2.22. This means that a 1% increase in rooms leads to a 2.22% increase in medv


## Transformation 5: Count Data

# OLS is often used, but should not be used to predict count data (e.g., number of student applications, number of customers coming to the store, etc.) because the outcome variable is: 

# (1) discrete (no decimals);
# (2) non-negative; and 
# (3) truncated at 0. 

# The correct way is to use the "glm()" function with a "Poisson" distribution and the outcome variable needs to log transformed (i.e., the link function is link="log": 

College <- read.table("College.csv", header=TRUE, sep=",")
options(scipen="4") # To change the decimals display
summary(lm(Apps~Outstate+PhD+S.F.Ratio, data=College)) 

# Incorrecty modeled above as OLS. Try to intepret the meaning of a negative intercept. The correct way is with:

summary(glm(Apps~Outstate+PhD+S.F.Ratio, 
            family=poisson(link="log"), data=College))

# The family=poisson(link="log") attribute tells glm() that the response variable follows a Poisson distribution. The "link" function tells glm() to log-transform the outcome variable. Because y is logged (and the x's are not), the coefficients represent the percent increase in applications, when the x goes up by 1 unit.


## Transformation 6: Centering data

attach(Boston) # Let's center data in the Boston data set
head(Boston) # First, take a quick look at the data

# We can center the data with the scale() function. As we will see later on, the scale() function can also be used to standardize data -- "center=TRUE" will center the variable and "scale=TRUE" will standardize the variable

?scale()

# This will center the entire data frame, provided that all variables are numeric

Boston.centered = data.frame(scale(Boston, center=TRUE, scale=FALSE))

# Note that we also used the data.frame() function because the scale() function converts the data into a matrix and some functions like the linear model lm() function only work with data frames

head(Boston.centered) # Check it out
summary(lm(medv~lstat+age,data=Boston))
summary(lm(medv~lstat+age,data=Boston.centered))

# Note that the two regressions above produce identical results because centering does not change the coefficients, except for the intercept, which becomes (almost) 0 because all the data is centered, so the means of all centered variables is 0.

# Centering is particularly necessary when including interaction terms involving 2 continuous variables:

summary(lm(medv~lstat*age,data=Boston)) # With uncentered data
summary(lm(medv~lstat*age,data=Boston.centered)) # With centered data

# Notice in the regressions above that the results are no longer the same between the centered and original data once you include continuousxcontinuous interaction terms. The centered data is the correct way to model continuous interaction terms.

# Note: if you run the commands below you will alter the Boston data frame in your computer memory. This is OK, but some functions like predict() may not run properly with this extra data. If this happens, simply click on the broom icon above to clear objects from your workspace and then re-attach the original Boston data set.

# This will center specific columns

Boston$medv = scale(Boston$medv, center=TRUE, scale=FALSE)
Boston$lstat = scale(Boston$lstat, center=TRUE, scale=FALSE)
Boston$age = scale(Boston$age, center=TRUE, scale=FALSE)
head(Boston) # Check it out

# Interpreting interaction effect with continuous variables is not easy. Centering variables in interaction terms makes this interpretation easier. Interaction between 2 continuous variables means that the effect of one variable depends on the value of the other variable. The main effects in the above model show the effect of that variables, when the other variable is at its mean.


## Transformation 7: Standardizing data

# You can standardize data with the same scale() funtion but using scale=TRUE

attach(Boston) # Let's center data in the Boston data set
head(Boston) # First, take a quick look at the data

# This will standardizing all the data:

Boston.standardized = data.frame(scale(Boston, center=FALSE, scale=TRUE))
head(Boston.standardized) # Check it out

# Compare results

summary(lm(medv~lstat+age,data=Boston)) # Unstandardized

# Coefficients indicate how many units Y changes when X changes by 1

summary(lm(medv~lstat+age,data=Boston.standardized)) # Standardized

# Coefficients indicate how many standard deviations Y changes when X changes by 1 standard deviation

# As with centering, the commands below will alter the Boston data 
# frame in memory.

# This will center specific columns

Boston$medv = scale(Boston$medv, center=FALSE, scale=TRUE)
Boston$lstat = scale(Boston$lstat, center=FALSE, scale=TRUE)
Boston$age = scale(Boston$age, center=FALSE, scale=TRUE)
head(Boston) # Check it out

# Standardized regression

# You can run the regular linear model function and then extract standardized coefficients with the {lm.beta} package, which will yield "identical" results than runing a regression with all variables standardized.

install.packages("lm.beta") # If not installed already
library(lm.beta)

attach(Boston) # Let's center data in the Boston data set
head(Boston) # First, take a quick look at the data

# Run a regression model as usual and store it in an object

lm.fit = lm(medv~lstat+age,data=Boston)

# This object lm.fit does not have standardized coefficients:
summary(lm.fit)

# But the lm.beta() function calculates them
lm.standardized = lm.beta(lm.fit)
summary(lm.standardized) # Check it out


## Transformation 8: Rank transformations

attach(Boston)
head(Boston)

# To add a new column with ranks in the Boston data frame:

Boston$CrimeRankLoHi = rank(Boston$crim) # Lowest to highest
head(Boston) # Check it out

# Let's add a reverse rank column

Boston$CrimeRankHiLo = rank(-Boston$crim) # highest to Lowest
head(Boston)


## Transformation 9: Lagging data

# Let's work with a housing starts data file

HousingStarts=read.csv("HousingStarts.csv",header=T,na.strings="?")
HousingStarts=na.omit(HousingStarts) # Removes NA's

# Month -- data period
# T -- Month converted into a numeric ordinal sorted variable
# KUnits -- houses started x 1000
# S.P -- S&P index
# Q1, Q2, Q3, Q4 -- dummy variables for each quarter

head(HousingStarts)

# Let's run a regression to predict KUnits

lm.KUnits = lm(KUnits~T+S.P+Q2+Q3+Q4, data=HousingStarts)
summary(lm.KUnits)

# You first need to sort the data by the ordinal variable (e.g., time). In our case, the data was already sorted in Excel

# Let's do a Durbin-Watson (DW) test for serial correlation. This package has a DW test function for lm() objects:

install.packages("lmtest") # If not already installed
require(lmtest) # Activate the package

dwtest(lm.KUnits) # Run the DW test
# DW = 0.308 << 2 --> High positive serial correlation

# Let's try using 4 lags of the dependent variable as predictors

attach(HousingStarts)

# The {DataCombine} package has functions to work with data

install.packages("DataCombine") # If not already installed
library(DataCombine) # Activate the library

# The slide{DataCombine} function can be used to create lag variables. In this case we are creating 4 lagged variables. Note that we need to save the lagged data in a data frame, which could be the same or a new data frame. In this case we are saving the data to the same data frame HousingStarts. Also, use negative "slideBy" values to create lag variables and positive "slideBy" values to create lead variables.

HousingStarts = slide(HousingStarts, Var="KUnits", 
                      NewVar="KUnits.L1", slideBy=-1)
HousingStarts = slide(HousingStarts, Var="KUnits", 
                      NewVar="KUnits.L2", slideBy=-2)
HousingStarts = slide(HousingStarts, Var="KUnits", 
                      NewVar="KUnits.L3", slideBy=-3)
HousingStarts = slide(HousingStarts, Var="KUnits", 
                      NewVar="KUnits.L4", slideBy=-4)
head(HousingStarts)

# IMPORTANT Techincal Note: the slide() function works on data frames. Some time, data sets come in other formats or as more complex data frames and the slide() function complains with errors. The typical error is if you slide a column with 400 values by one, the resulting column will only have 399 values. But in a data frame, the first value is assigned an NA, so it works fine and you get 400 values. If you get one of these mismatch errors, a solution that often works is to re-create the frame like this: MyData <- as.data.frame(MyData). This command will create a simple data frame that works well with slide().

# Now let's try the regression model with all 4 lagged variables

lm.KUnits.all = lm(KUnits~T+S.P+Q2+Q3+Q4+
                     KUnits.L1+KUnits.L2+KUnits.L3+KUnits.L4,
                   data=HousingStarts)
summary(lm.KUnits.all) # Check out the results

# Notice that KUnits.L3 and KUnits.L4 are significant predictors of KUnits

dwtest(lm.KUnits.all) # Run the DW test
# DW = 2.388, which is acceptable -- no serial correlation