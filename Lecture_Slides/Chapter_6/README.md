## Week 6 - Regularization & Dimension Reduction Models

### Topics
  - 6.1 Weekly Introduction (01:08)
  - 6.2 Week 6 Overview Page
  - 6.3 Regularization (Penalized or Shrinkage Models) (04:23)
  - 6.4 Ridge Regression (10:49)
  - 6.5 LASSO Regression (06:15)
  - 6.6 Dimension Reduction Models (07:05)
  - 6.7 Principal Components Regression (PCR) (06:36)
  - 6.8 Principal Components Analysis (PCA) (11:18)
  - 6.9 Partial Least Squares (PLS) Regression (06:39)
  - 6.10 Knowledge Check
  - 6.11 Voices from the Field: Leif Ulstrup (08:43)
    
### ISLR Videos
  1. [Curse of Dimensionality and Parametric Models](https://www.youtube.com/watch?v=UvxHOkYQl8g)
  2. [Linear Model Selection and Best Subset Selection](https://www.youtube.com/watch?v=91si52nk3LA)
  3. [Forward Stepwise Selection (12:26)](https://www.youtube.com/watch?v=nLpJd_iKmrE)
  4. [Backward Stepwise Selection (5:26)](https://www.youtube.com/watch?v=NJhMSpI2Uj8)
  5. [Estimating Test Error Using Mallow’s Cp, AIC, BIC, Adjusted R-squared (14:06)](https://www.youtube.com/watch?v=LkifE44myLc)
  6. [Estimating Test Error Using Cross-Validation (8:43)](https://www.youtube.com/watch?v=3p9JNaJCOb4)
  7. [Shrinkage Methods and Ridge Regression (12:37)](https://www.youtube.com/watch?v=cSKzqb0EKS0)
  8. [The Lasso (15:21)](https://www.youtube.com/watch?v=A5I1G1MfUmA)
  9. [Tuning Parameter Selection for Ridge Regression and Lasso (5:27)](https://www.youtube.com/watch?v=xMKVUstjXBE)
  10. [Dimension Reduction (4:45)](https://www.youtube.com/watch?v=QlyROnAjnEk)
  12. [Principal Components Regression and Partial Least Squares (15:48)](https://www.youtube.com/watch?v=eYxwWGJcOfw)
  13. [Lab: Best Subset Selection (10:36)](https://www.youtube.com/watch?v=3kwdDGnV8MM)
  14. [Lab: Forward Stepwise Selection and Model Selection Using Validation Set (10:32)](https://www.youtube.com/watch?v=mv-vdysZIb4)
  15. [Lab: Model Selection Using Cross-Validation (5:32)](https://www.youtube.com/watch?v=F8MMHCCoALU)
  16. [Lab: Ridge Regression and Lasso (16:34)](https://www.youtube.com/watch?v=1REe3qSotx8)

### Question
In the last few lecture sections we covered various approaches to address high dimensionality issues in predictive models. When would you use each of these approaches?

  1. Variable Selection
  2. Ridge Regression
  3. LASSO
  4. Principal Components Regression (PCR)
  5. Partial Least Squares (PLS)

### Answer
  1. Variable selection is largely an exploratory method. Variable selection is appropriate when you are not sure which variables belong in the model. If business rationale suggests that a certain set of variables should be included in the model, they should be forced into the reduced model and then test any other exploratory variables in a stepwise fashion.
  2. Ridge is most useful when there is a very large number of predictors and business rationale suggests that they should all be included. Ridge shrinks coefficients but never makes them 0.
  3. LASSO is also most useful when there is a large number of predictors, but you don’t need to retain all of them. LASSO shrinks some coefficients to 0, which is similar to removing variables. You can think of LASSO as a compromise between variable selection (remove any variable as needed statistically) and Ridge regression (do not remove any variables, just shrink the less important ones).
  4. PCR is most useful when there is a large number of predictors and not a lot of data points. In fact it can sometimes be used when there are more predictors than observations. But PCR not always works. For PCR to work, the first few principal components must explain a large percentage of the variance in the data. If the variance in the data does not align in any direction (i.e., it is roughly spherical), PCR will yield almost as many principal components as predictors, rendering it useless.
  5. PLS is useful when PCR is useful. PCR and PLS are competing approaches. PLS often outperforms PCR because the principal components are further rotated to have high correlation with the response variable.

In sum, all these methods have the same goal → dimension reduction. One is not necessarily better than the other one. If you are doing this for real, I would suggest trying all methods and compare them with cross-validation testing.
  - High dimensionality is a big problem in predictive modeling. It creates problems like: overfitting, high variance, unstable predictors, multi-collinearity, etc. The ISLR book authors refer to this collection of problems as the “curse of dimensionality”.
  - You can correct for multicollinearity by removing variables with high variance inflation factors (VIFs). However, removing variables is sometimes not an option. See next answer.
  - If removing variables is not an option (from a business perspective), you can either use: (1) a penalized method that addresses dimensionality by shrinking the coefficients of the least important predictors, without removing them; or (2) a dimension reduction method that reduces P predictors to M components that are linear combinations of all the predictors. This only works if M is much smaller than P (more on this later).
  - MSETraining is almost always smaller than MSETest because the fit statistics are better when you test the model with the same data used to build the model. However, when you test the model with different data, the MSE tends to increase.
