## Week 8 - Classification Models

### Topics
  8.1. Weekly Introduction
  8.2. Week 8 Overview
  8.3. Introduction to Classification Models
  8.4. Binomial Logistic Models
  8.5. Knowledge Check
  8.6. Multinomial Logistic Regression
  8.7. Linear Discriminant Analysis
  8.8. Tuning LDA
  8.9. Quadratic Discriminant Analysis
  8.10. K Nearest Neighbors
  8.11. Knowledge Check
    
### ISLR Videos
  1. [Classification Problems and K-Nearest Neighbors (15:37)](https://www.youtube.com/watch?v=vVj2itVNku4)
  2. [Introduction to Classification (10:25)](https://www.youtube.com/watch?v=sqq21-VIa1c)
  3. [Logistic Regression and Maximum Likelihood (9:07)](https://www.youtube.com/watch?v=31Q5FGRnxt4)
  4. [Multivariate Logistic Regression and Confounding (9:53)](https://www.youtube.com/watch?v=MpX8rVv_u4E)
  5. [Case-Control Sampling and Multiclass Logistic Regression (7:28)](https://www.youtube.com/watch?v=GavRXXEHGqU)
  6. [Linear Discriminant Analysis and Bayes Theorem (7:12)](https://www.youtube.com/watch?v=RfrGiG1Hm3M)
  7. [Univariate Linear Discriminant Analysis (7:37)](https://www.youtube.com/watch?v=QG0pVJXT6EU)
  8. [Multivariate Linear Discriminant Analysis and ROC Curves (17:42)](https://www.youtube.com/watch?v=X4VDZDp2vqw)
  9. [Quadratic Discriminant Analysis and Naive Bayes (10:07)](https://www.youtube.com/watch?v=6FiNGTYAOAA)
  10. [Lab: Logistic Regression (10:14)](https://www.youtube.com/watch?v=TxvEVc8YNlU)
  11. [Lab: Linear Discriminant Analysis (8:22)](https://www.youtube.com/watch?v=2cl7JiPzkBY)
  12. [Lab: K-Nearest Neighbors (5:01)](https://www.youtube.com/watch?v=9TVVF7CS3F4)

### Question
Continuing with the ice cream mobile stand example, suppose that you decide how many gallons of milk to bring based on other factors and intuition and you want to predict the likelihood that you will run out of milk on a given day using this logistic regression model:

  1.  Interpret the coefficients for GallonsBrought and Weekend.
  2. Convert these two coefficients from log-odds to odds, and re-state your interpretation based on odds.
  3. Then convert these odds into probabilities and re-state your interpretation based on probabilities.

![alt tag](https://raw.githubusercontent.com/jpsuen/ITEC621_Class_Files/master/Lecture_Slides/Chapter_8/8.5%2Bknowledge%2Bcheck.jpg)

### Answer
  1. GallonsBrought – holding everything else constant, the log-odds of running out of milk on a given day reduces by 0.15 for each additional gallon brought; Weekend – holding everything else constant, the log-odds of running out of milk increases by 0.42 on weekends.
  2. GallonsBrought → Odds = exp(-0.15) = e-0.15 = 0.86 → holding everything else constant, the odd of running out of milk on a given day reduces by a factor of 0.86 for each additional gallon brought; Weekend → Odds = exp(0.42) = e0.42 = 1.52 → holding everything else constant, the odds of running out of milk increases by a factor of 1.52 on weekends.
  3. Interpreting logistic regression coefficients in terms of probability is a bit trickier because odds and probability coefficients are multiplicative (because of the logit transformation). The one key thing to keep in mind when analyzing probabilities is that 0.5 or 50% is the neutral point (i.e., flipping a coin). So any probability coefficients above 0.5 increase the likelihood (of Y=1) whereas any probability coefficients below 0.5 decrease the likelihood. GallonsBrought → Prob = 0.86/(1+0.86) = 0.463 = 46.3% → holding everything else constant, the probability of running out of milk on a given day decreases with additional gallon brought (how much? depends on the specific variable values); Weekend → Prob = 1.52/(1+1.52) = 0.603 = 60.3% → holding everything else constant, the probability of running out of milk increases on weekends (how much? depends on the specific variable values).

### Question
Briefly answer the following:
  1. The default classification threshold is 50%. That is, if an observation yields a probability greater than 50% of being Y=1 (positive), the model assigns that observation to the class Y=1. But you can change this classification threshold to alter the error rate (incorrect classifications), sensitivity (correct positives) and specificity (correct negatives), depending on your analysis needs. How do these 3 fit statistics change if you change the threshold to 20% and 70%, respectively?
  2. What do you conclude about the classification threshold selection? That is, when would you raise it and when would you lower it, if any?
  3. Why and when would you use a logistic, LDA or QDA model for a classification problem?

### Answer
