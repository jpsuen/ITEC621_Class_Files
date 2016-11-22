## Week 1 - Introduction

### Topics
  - 1.1 Weekly	Introduction	
  - 1.2 Week	1	Overview	
  - 1.3 Interview - Leif Ulstrup
  - 1.4 Analytics	Life	Cycle		
  - 1.5 Voices	from	the	Field:	Anshu Sinha	
    - 1.5.1 Voices	from	the	Field:	Rodrigo	Fontecilla	
  - 1.6 Introduction	to	Predictive	Analytics		
  - 1.7 Matrix	Notation		
  - 1.8 Voices	from	the	Field:	Rodrigo	Fontecilla	
  - 1.9 Basic	Foundations		
  - 1.10 Model,	Method,	and	Feature	Selection		
  - 1.12 Introduction	to	R		
    - 1.12.1 R	Packages		
    - 1.12.2 R	Scripts		
    - 1.12.3 R	Studio		
    
### ISLR Videos
  1. [Opening Remakrs and Examples](https://www.youtube.com/watch?v=2wLfFB_6SKI)
  2. [Supervied and Unsupervised Learning](https://www.youtube.com/watch?v=LvaTokhYnDw)
  3. [Lab: Introduction to R](https://www.youtube.com/watch?v=jwBgGS_4RQA)

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
    
### Question for Thought
Scenario One: You need to predict how many students will enroll in the MS analytics program next year.
  - List three key predictors.
  - Can you use OLS for this model?
    - If yes, why?
    - If not, which model method would you use?

### Question for Thought
Scenario Two: You want to predict the management level of your classmates five years out: none, middle manager, senior manager, or CEO.
  - Can you use logistic regression for this model?
  - What type of regression model would you use?
    - If yes, why?
    - If no, which model method would you use?