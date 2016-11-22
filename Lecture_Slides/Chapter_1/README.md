### Question
Scenario 1: You need to predict how many students will enroll in the MS analytics program next year.
  1. List 3 key predictors?
  2. Can you use OLS for this model?
    - If yes, why?
    - If not, which model method would you use?

### Answer
Scenario 1: Enrollments
  1. There are many predictors. 3 possible examples are: (1) enrollments last year; (2) % placement last year 3 months after graduation; (3) average starting salary.
  2. No, you should not use OLS.
    - Many modelers would use OLS, but total enrollments is “count” data, so OLS is not the most appropriate. The data is non-negative and it is truncated at enrollments = 0. The best model is a Poisson regression using generalized linear modeling and using the log of enrollments.

### Question
Scenario 2: You want to predict the management level of your classmates will attain 5 years out – none, middle manager, senior manager, or CEO.
  1. List 3 key predictors?
  2. Can you use binary logistic regression for this model?
    - If yes, why?
    - If not, which model method would you use?

### Answer
Scenario 2: Management levels
  1. There are many predictors, including: (1) current GPA; (2) undergraduate degree; (3) years of work experience; (4) managerial level before entering the program;
  2. You can use binary logistic, but with some adjustments, but it is not the best method.
    - The response variable is categorical (none, middle manager, senior manager, or CEO). The correct method is either multinomial logistic or multinomial discriminant analysis. The multinomial logistic method is like fitting several binary logistic regression models, one for each possible value of the response variable (e.g., middle manager = 1 yes; 0 = no; senior manager = 1  yes; 0 = no; etc.). This can be modeled as a series of separate binomial logistic regression models, but the correct way is to fit all the models together, which is what multinomial logistic regression does. Discriminant analysis is an alternative method to logistic and can be used too.
