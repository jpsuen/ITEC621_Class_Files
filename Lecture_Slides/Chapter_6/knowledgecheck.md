### Question
In the last few lecture sections we covered various approaches to address high dimensionality issues in predictive models. When would you use each of these approaches?
Variable Selection
Ridge Regression
LASSO
Principal Components Regression (PCR)
Partial Least Squares (PLS)

### Answer
Variable selection is largely an exploratory method. Variable selection is appropriate when you are not sure which variables belong in the model. If business rationale suggests that a certain set of variables should be included in the model, they should be forced into the reduced model and then test any other exploratory variables in a stepwise fashion.
Ridge is most useful when there is a very large number of predictors and business rationale suggests that they should all be included. Ridge shrinks coefficients but never makes them 0.
LASSO is also most useful when there is a large number of predictors, but you don’t need to retain all of them. LASSO shrinks some coefficients to 0, which is similar to removing variables. You can think of LASSO as a compromise between variable selection (remove any variable as needed statistically) and Ridge regression (do not remove any variables, just shrink the less important ones).
PCR is most useful when there is a large number of predictors and not a lot of data points. In fact it can sometimes be used when there are more predictors than observations. But PCR not always works. For PCR to work, the first few principal components must explain a large percentage of the variance in the data. If the variance in the data does not align in any direction (i.e., it is roughly spherical), PCR will yield almost as many principal components as predictors, rendering it useless.
PLS is useful when PCR is useful. PCR and PLS are competing approaches. PLS often outperforms PCR because the principal components are further rotated to have high correlation with the response variable.
In sum, all these methods have the same goal → dimension reduction. One is not necessarily better than the other one. If you are doing this for real, I would suggest trying all methods and compare them with cross-validation testing.
High dimensionality is a big problem in predictive modeling. It creates problems like: overfitting, high variance, unstable predictors, multi-collinearity, etc. The ISLR book authors refer to this collection of problems as the “curse of dimensionality”.
You can correct for multicollinearity by removing variables with high variance inflation factors (VIFs). However, removing variables is sometimes not an option. See next answer.
If removing variables is not an option (from a business perspective), you can either use: (1) a penalized method that addresses dimensionality by shrinking the coefficients of the least important predictors, without removing them; or (2) a dimension reduction method that reduces P predictors to M components that are linear combinations of all the predictors. This only works if M is much smaller than P (more on this later).
MSETraining is almost always smaller than MSETest because the fit statistics are better when you test the model with the same data used to build the model. However, when you test the model with different data, the MSE tends to increase.