## Week 5 - Machine Learning & Variable Selection and Reduction

### Topics
  - 5.1 Weekly Introduction (01:09)
  - 5.2 Week 5 Overview
  - 5.3 Machine Learning Overview (12:11)
  - 5.4 Bias vs. Variance Tradeoff (05:44)
  - 5.5 Error Measures (05:32)
  - 5.6 Cross-Validation (04:47)
  - 5.7 Holdout Sampling (07:14)
  - 5.8 K-Fold (03:15)
  - 5.9 Leave One Out (05:07)
  - 5.10 Bootstrap (05:34)
  - 5.11 Knowledge Check
  - 5.12 Dimensionality Issues (15:19)
  - 5.13 Multi-Collinearity (07:14)
  - 5.14 Variable Selection Methods (14:01)
  - 5.15 Step Methods (11:24)
  - 5.16 Knowledge Check
    
### ISLR Videos
  1. [Estimating Prediction Error and Validation Set Appraoch](https://www.youtube.com/watch?v=_2ij6eaaSl0)
  2. [K-fold Cross-Validation](https://www.youtube.com/watch?v=nZAM5OXrktY)
  3. [Cross-Validation: The Rigth and Wrong Ways](https://www.youtube.com/watch?v=S06JpVoNaA0)
  4. [More on the Bootstrap](https://www.youtube.com/watch?v=BzHz0J9a6k0)
  5. [Lab: Cross-Validation](https://www.youtube.com/watch?v=6dSXlqHAoMk)
  6. [Lab: The Bootstrap](https://www.youtube.com/watch?v=YVSmsWoBKnA)

### Question 
When applying machine learning methods, you need to split the sample into training and test samples. You fit the model with the training sample and test it with the test sample. This is called “cross-validation”. You often resample using various methods (e.g., K-Fold, Leave-One-Out).
  1. Why and when exactly do we need to do this for cross-validation? Do we always have to do cross-validation testing?
  2. Why is the MSETraining < MSETest?

### Answer 
  1. Cross-validation testing using machine learning methods is always desirable. But it is most important when comparing two competing models. If one model is a subset (i.e., reduced model) of the other (i.e., full model), you can evaluate them with the full data set using F-test or comparing other statistics like adjusted R2, AIC, BIC, etc. But if you are comparing two different models (i.e., have different variables, or employ different methods), the cross-validation testing will provide a better comparison between models and what is their predictive accuracy and prediction variance.
  2. MSETraining is almost always smaller than MSETest because the fit statistics are better when you test the model with the same data used to build the model. However, when you test the model with different data, the MSE tends to increase.

### Question
We will cover this in more detail in the next few classes, but base on what you know, please answer:
  1. What is the “curse of dimensionality”?
  2. How do you correct for multicollinearity?
  3. What can you do if you need to include all predictors (i.e., variable selection is not an option)?

### Answer
  1. High dimensionality is a big problem in predictive modeling. It creates problems like: overfitting, high variance, unstable predictors, multi-collinearity, etc. The ISLR book authors refer to this collection of problems as the “curse of dimensionality”.
  2. You can correct for multicollinearity by removing variables with high variance inflation factors (VIFs). However, removing variables is some times not an option. See next answer.
  3. If removing variables is not an option (from a business perspective), you can either use: (1) a penalized method that addresses dimensionality by shrinking the coefficients of the least important predictors, without removing them; or (2) a dimension reduction method that reduces P predictors to M components that are linear combinations of all the predictors. This only works if M is much smaller than P (more on this later).
  4. MSETraining is almost always smaller than MSETest because the fit statistics are better when you test the model with the same data used to build the model. However, when you test the model with different data, the MSE tends to increase.
