## Week 9 - Decision Trees

### Topics
  - 9.1 Weekly Introduction (00:49)
  - 9.2 Week 9 Overview
  - 9.3 Decision Trees (02:45)
  - 9.4 Regression Trees (10:48)
  - 9.5 Growing Trees (06:41)
  - 9.6 Regression Tree Issues (07:13)
  - 9.7 Classification Trees (06:56)
  - 9.8 Pruning Trees (04:14)
  - 9.9 Bootstrap Aggregation (Bagging) (11:16)
  - 9.10 Random Forest Models (10:37)
  - 9.11 Boosting Models (17:18)
  - 9.12 Knowledge Check
  - 9.13 Voices from the Field: Anshu Sinha (05:09)
    
### ISLR Videos
  1. [Decision Trees (14:37)](https://www.youtube.com/watch?v=6ENTbK3yQUQ)
  2. [Pruning a Decision Tree (11:45)](https://www.youtube.com/watch?v=GfPR7Xhdokc)
  3. [Classification Trees and Comparison with Linear Models (11:00)](https://www.youtube.com/watch?v=hPEJoITBbQ4)
  4. [Bootstrap Aggregation (Bagging) and Random Forests (13:45)](https://www.youtube.com/watch?v=lq_xzBRIWm4)
  5. [Boosting and Variable Importance (12:03)](https://www.youtube.com/watch?v=U3MdBNysk9w)
  6. [Lab: Decision Trees (10:13)](https://www.youtube.com/watch?v=0wZUXtvAtDc)
  7. [Lab: Random Forests and Boosting (15:35)](https://www.youtube.com/watch?v=IY7oWGXb77o)

### Knowledge Checks
### Questions
  1. When would you use a logistic, LDA , QDA, or a classification tree? Why?
  2. If you decide on a classification tree, when would you use plain trees, bagging, random forest or boosting? Why?
  3. For quantitative predictions, when would you use a regression model vs. a regression tree approach? Why?
  
### Answers
  1. If interpretation is the analysis goal, the Logistic regression is superior to the other approaches. If predictive accuracy is the goals, you can run models using all 4 methods and select one based on cross-validation testing. Again, LDA and QDA require the predictors to be normally distributed, because the predictions are based on estimating probabilities using a normal distribution curve, so you can discard these methods if the predictors are not normally distributed. Logistic regression models do not require predictors to be normally distributed with sufficiently large samples, but other OLS assumptions must be met (except for the dependent variable being binary). So, if some OLS assumptions are severely violated. Classification trees are non-parametric methods, so they are not subject to assumptions. In some cases, trees may be your only choice, but you lose interpretation power.
  2. Plain trees are generally outperformed by other more advanced tree methods (and by regression models). But overall, tree methods are used primarily for predictive accuracy and not for interpretations, so the best thing is to try all tree methods and select the one with the best cross-validation test statistics.
  3. The answer is similar to 2. Use regression models if interpretation is the analysis goal and the model assumptions are met. If some model assumptions are severely violated or if the analysis goal is predictive accuracy, try all available regression tree methods and evaluate them with cross-validation testing.