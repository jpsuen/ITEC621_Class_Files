## Week 3 - Regression Refresher

### Topics
  3.1 Weekly Introduction (02:02)
  3.2 Week 3 Overview
  3.3 Voices from the Field: Anshu Sinha (07:29)
  3.4 Covariance, Correlation, and ANOVA Review (14:16)
  3.5 Knowledge Check
  3.6 Simple Linear Regression (05:53)
  3.7 OLS Model Diagnostics (09:57)
  3.8 Dummy Variables (05:50)
  3.9 Multi-Variate Regression (05:02)
  3.10 Knowledge Check
  3.11 OLS Regression Assumptions (15:04)
  3.12 Knowledge Check
  3.13 Voices from the Field: Anshu Sinha (08:31)
  3.14 Weighted Least Squares (WLS) (12:00)
  3.15 Generalized Linear Models (GLM) (14:23)
    
### ISLR Videos
  1. [Simple Linear Regression and Confidence Intervals](https://www.youtube.com/watch?v=PsE9UqoWtS4)
  2. [Hypothesis Testing](https://www.youtube.com/watch?v=J6AdoiNUyWI)
  3. [Multiple Linear Regression and Interpreting Regression Coefficients](https://www.youtube.com/watch?v=1hbCJyM9ccs)
  4. [Model Selection and Qualitative Predictors](https://www.youtube.com/watch?v=3T6RXmIHbJ4)
  5. [Interactions and Nonlinearity](https://www.youtube.com/watch?v=IFzVxLv0TKQ)
  6. [Lab: Linear Regression](https://www.youtube.com/watch?v=5ONFqIk3RFg)

### Question
### Scenario 1: 
If ANOVA is about comparing group means, why do we call it “analysis of variance” and not “analysis of means”?

### Answer
### Scenario 1:ANOVA
ANOVA tests the difference in means between two groups. We can say that one means is larger than the other by inspecting the actual mean for each group. But this does not make them statistically different. In order to ascertain if the means are “statistically difference” with some confidence is to evaluate if the variance between the two groups is larger than the variance within the groups. Thus, we need to analyze the variance, thus the ANOVA name.

### Question
### Scenario 2: 
The boxplot to the right shows the difference in means across 3 groups. Does it appear that the means are statistically different? Why or why not?

![alt tag](https://raw.githubusercontent.com/jpsuen/ITEC621_Class_Files/master/Lecture_Slides/Chapter_3/3.5%2Bknowledge%2Bcheck.jpg)

### Answer
### Scenario 2: Boxplot
This needs to be analyzed statistically, but a casual visual inspection of the plots shows that, while the actual means are actually different, the confidence bands are somewhat overlapping across the three groups. So, there doesn’t appear to be a “statistical difference” across the means. To be statistical different, the observations and 95% confidence bands should not overlap much.

### Question
### Scenario 3: 
Two judges in an Olympic competition scored a gymnast and their scores had a correlation of 0.9 (almost perfect). This means that their scores were roughly equal. True or False?
(Note: Your answer should have a minimum of 1 word and a maximum of 500 words. Once submitted, your response cannot be edited.)

### Answer
### Scenario 3:
False. Most likely, the scores are very similar because the correlation is very high and positive. But this is not always the case. A high correlation means that the difference between the judges’ scores and their means are roughly equal, but this is no guarantee that the means will be roughly equal. That is, the high correlation says that if one judge scored an athlete high (relative to the judge’s average), the other judge also scored the same athlete high relative to his/her own average). For example, these two-judge scores will yield a perfect correlation: 1,1,2,3,2,1 and 8,8,9,10,9,8.

### Question
You own a small instant ice cream mobile stand (see "New liquid nitrogen ice cream shop") and want to decide how many gallons of milk to load on your small truck. You have limited space so, too much milk will reduce the space for other popular products, and too little and you will run out of ice cream. A predictive regression model over your historical sales shows the following:
Weekend is 1 for weekend days, 0 otherwise; Sunny is 1 for sunny forecasts, 0 otherwise; Temperature is the high temperature forecast 0F; and Humidity is the % humidity forecast. The table shows coefficients and p-values for each predictor and the R-Square and p-value for the entire model.

Question 1: Which predictors are significant? Why?
Question 2: Interpret the coefficient for Sunny and Temperature
Question 3: Interpret the R-Square and the model’s p-value

![alt tag](https://raw.githubusercontent.com/jpsuen/ITEC621_Class_Files/master/Lecture_Slides/Chapter_3/3.10%2Bknowledge%2Bcheck.jpg)


### Answer
Question 1:
Weekend, Sunny and Temperature are significant predictors of Gallons of Milk. They all have p-values smaller than 0.05. Humidity is not significant because it’s p-value is much larger than 0.05.
Question 2:
βSunny = 5.4 Holding other predictors constant, you need 5.4 more gallons of milk on sunny days than non-sunny days
βTemperature = 0.2 Holding other predictors constant, you need 0.2 more gallons of milk for each additional 0F degree in forecasted temperature.
Question 3:
The R-Square indicates that this predictive model explains 72% of the variance in milk usage; the model’s p-value < 0.001 indicates that the full model has significant predictive power.

### Question
Which OLS assumption is violated in each of these cases?
You have a large data set, but one predictor is not normally distributed. All other variables are normally distributed.
You are trying to predict how many students will enroll in a class.
You are trying to predict who in the class will make an A.
You are collecting individual opinions to analyze the satisfaction with an MS program but some students have taken the same courses together.
You are trying to predict weight gain from pizza consumption two of your predictors are grams of fat per slice and calories per slice.

### Answer
No OLS assumption is violated. Predictors don’t have to be normally distributed if you have a large sample (40 observations or more). The non-normality assumption applies to the distribution of the response variable and the errors.
YC → the response variable is a count, not a continuous variable
YC → the response variable is a classification (A or no A), not a continuous variable
OI → The observations are not independent. Students who took a good (or a bad) lass together will have a similar opinion of the program.
XI → The predictors are not independent. Fat per slice and calories per slice are likely to be highly correlated. The amount of fat influences the number of calories in a slice.
