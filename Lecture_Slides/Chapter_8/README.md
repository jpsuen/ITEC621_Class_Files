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
In the last few lecture sections we covered several non-linear models. But when or why would we use which one? Briefly discuss when would you use each of these modeling approaches:

  1. Interaction Models
  2. Polynomials
  3. Step Models
  4. Linear Piecewise or Splines
  5. Polynomial Piecewise, Polynomial Splines or Smoothing Splines

### Answer
  1. Interaction Models → Should be used when there is reason to believe that the presence of one predictor influences the effect of another predictor. Interaction Models are not polynomial, but they are high order effects because they contain multiplicative terms. However, the non-linearity comes about because the effects of two variables are multiplicative. That is, without interaction effects, the effects of two variables are additive (i.e., each contributes to the prediction independently). If the interaction effect of two variables are significant, then in addition to the additive effects, there are multiplicative effects – i.e., the variables enhance or offset each other. When to use interaction terms? It is always useful to explore possible interaction effects. They provide the most interesting insights on the predictions.
  2. Polynomial should simply be used when the relationship between predictors and the response variable appear to be curvilinear. Low polynomials (squared or cubic only) are OK for interpretation, but higher order terms make the model less interpretable. High-degree polynomials are useful sometimes if the modeling goal is predictive accuracy. The various polynomials need to be compared with each other with F-tests, AIC, BIC or cross-validation.
  3. Step models are simplistic and my preference is not to use them. But they can be useful if the data plot looks like chunks of horizontal clouds that seem to shift at various points. If the data plot looks somewhat erratic, a step model may provide more predictive accuracy. But these models are not useful for interpretation.
  4. Linear piecewise and linear splines are a nice alternative to high degree polynomials. It allows to fit regression lines with different plots in different ranges of the data, which can provide a much better fit. Better yet, because each segment of the piecewise model has its own coefficients, it is much more interpretable than a high degree polynomial.
  5. Polynomial Piecewise, Polynomial Splines or Smoothing Splines are more complex counterparts to the respective linear models. But they are much less interpretable. If interpretability is the main goal, they should not be used. They are more useful when the goal is predictive accuracy.

In sum, as with other approaches, you should try various non-linear modeling approaches and compare them with cross-validation testing. The only way to decide between a high degree polynomial, a polynomial piecewise, a polynomial spline and a smoothing spline is through cross-validation testing. There is no other way because neither model is very interpretable.