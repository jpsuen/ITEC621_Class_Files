### Question
Which data transformations will be necessary in each of these cases?
You have a large data set, but one predictor is not normally distributed. All other variables are normally distributed.
You are trying to predict how many students will enroll in a class.
You are trying to predict who in the class will make an A.
You are building an economic prediction model and you want to estimate the percentage increase in average household income for each percentage increase in minimum wage.
You are trying to predict job offers to Kogod graduates based on the program they are enrolled in.

### Answer
No transformation is needed. No OLS assumption is violated. Predictors don’t have to be normally distributed if you have a large sample (40 observations or more).
The response variable is a count → you need to log the response variable (i.e., enrollments). However, if average enrollments are substantially larger than 0, OLS will perform relatively well.
The response variable is a classification (A or no A). You need a logistic function transformation (we have not covered this yet, so you may not have known how to answer this).
You need to log both, average household income and minimum wage. This is a classic “elasticity” model. Logging both, predictor and response variables yields coefficients that measure the % increase in the response variable for each % point increase in the predictor.
This requires 2 transformations: (1) the response variable is a count, so the answers to 2 above apply here as well; (2) the programs students are enrolled in are categorical values → they need to be transformed into dummy variables.
XI → The predictors are not independent. Fat per slice and calories per slice are likely to be highly correlated. The amount of fat influences the number of calories in a slice.