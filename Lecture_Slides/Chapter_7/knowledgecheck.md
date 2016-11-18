### Question
MSETraining is almost always smaller than MSETest because the fit statistics are better when you test the model with the same data used to build the model. However, when you test the model with different data, the MSE tends to increase.

Provide and interpretation for the Sunny*Temperature coefficient
Provide and interpretation for the Sunny*Humidity coefficient

![alt tag](https://raw.githubusercontent.com/jpsuen/ITEC621_Class_Files/master/Lecture_Slides/Chapter_7/7.5%2Bknowledge%2Bcheck.jpg)

### Answer
Both, main and interaction effects have the same sign and are significant. This means that these variables enhance or complement each other. That is, sunny days and warm temperatures lead to more ice cream sales (i.e., more milk needed), but there is a further increased demand when it is both, sunny and hot. Another way to say this is that Sunny days increase ice cream sales, but more so on hot days. Alternatively, hot days increase ice cream sales, but more so if it is sunny.
This needs to be interpreted more carefully because of the sign change and because the main effect of Humidity is not significant. Because the interaction effect has an opposite sign than the main effects, this indicates that the two predictors offset each other. That is, sunny days experience increased ice cream sales, but less so on humid days. We can’t say anything about how the main effect of Humidity is affected by sunny days because the main effect of Humidity is not significant.

### Question
In the last few lecture sections we covered several non-linear models. But when or why would we use which one? Briefly discuss when would you use each of these modeling approaches:
Interaction Models
Polynomials
Step Models
Linear Piecewise or Splines
Polynomial Piecewise, Polynomial Splines or Smoothing Splines

### Answer
Interaction Models → Should be used when there is reason to believe that the presence of one predictor influences the effect of another predictor. Interaction Models are not polynomial, but they are high order effects because they contain multiplicative terms. However, the non-linearity comes about because the effects of two variables are multiplicative. That is, without interaction effects, the effects of two variables are additive (i.e., each contributes to the prediction independently). If the interaction effect of two variables are significant, then in addition to the additive effects, there are multiplicative effects – i.e., the variables enhance or offset each other. When to use interaction terms? It is always useful to explore possible interaction effects. They provide the most interesting insights on the predictions.
Polynomial should simply be used when the relationship between predictors and the response variable appear to be curvilinear. Low polynomials (squared or cubic only) are OK for interpretation, but higher order terms make the model less interpretable. High-degree polynomials are useful sometimes if the modeling goal is predictive accuracy. The various polynomials need to be compared with each other with F-tests, AIC, BIC or cross-validation.
Step models are simplistic and my preference is not to use them. But they can be useful if the data plot looks like chunks of horizontal clouds that seem to shift at various points. If the data plot looks somewhat erratic, a step model may provide more predictive accuracy. But these models are not useful for interpretation.
Linear piecewise and linear splines are a nice alternative to high degree polynomials. It allows to fit regression lines with different plots in different ranges of the data, which can provide a much better fit. Better yet, because each segment of the piecewise model has its own coefficients, it is much more interpretable than a high degree polynomial.
Polynomial Piecewise, Polynomial Splines or Smoothing Splines are more complex counterparts to the respective linear models. But they are much less interpretable. If interpretability is the main goal, they should not be used. They are more useful when the goal is predictive accuracy.
In sum, as with other approaches, you should try various non-linear modeling approaches and compare them with cross-validation testing. The only way to decide between a high degree polynomial, a polynomial piecewise, a polynomial spline and a smoothing spline is through cross-validation testing. There is no other way because neither model is very interpretable.