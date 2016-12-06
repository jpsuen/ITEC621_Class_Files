## Week 10 - Predictive Model with Survey Data

### Topics
  - 10.1 Weekly Introduction (01:37)
  - 10.2 Week 10 Overview
  - 10.3 Voices from the Field: Leif Ulstrup (03:05)
  - 10.4 Survey Data (14:00)
  - 10.5 Structural Equation Models (09:03)
  - 10.6 Factor Analysis (06:51)
  - 10.7 The Eigen Brothers: Vector and Value (13:00)
  - 10.8 Factor Extraction (09:15)
  - 10.9 Varimax Rotation (09:32)
  - 10.10 Grouping Variables and Reliability (14:09)
  - 10.11 Concurrent and Discriminant Validity (03:46)
  - 10.12 Voices from the Field: Rodrigo Fontecilla (03:32)
  - 10.13 Common Method Variance (06:51)
  - 10.14 Knowledge Check
  - 10.15 Fly Solo
  - 10.16 Knowledge Check Page  
  
### Knowledge Checks

### Question
Describe step by step how would you design a survey questionnaire and how would you analyze the results.

### Answer
First, figure out the question you are trying to answer with your survey study. What are you predicting and what are the predictors? If you have objective (non-survey) data for the outcome you are studying, use it (it is always great to have an objective and a survey measure of the outcome) to reduce problems of common method variance. For each outcome and predictor, define a few survey questions for each (typically 4 to 6 questions per variable). Collect your survey data. Conduct factor analysis with all your predictors to see if the survey questions load along the predictors you defined. When doing factor analysis, do a Varimax rotation to get better alignment of questions in each factor (i.e., predictor). Average the survey questions that load together and use these averages as your predictor measures. Further evaluate each of these question groupings into predictors with some reliability testing (i.e., Cronbach α). If you are using survey responses for the outcome measure, do another factor analysis, but this time including the outcome survey questions. They should load together, but separately from the predictors. If not, then you have a problem with common method variance and your survey data may not be very useful (unless you re-define your predictors and outcome using the available data).

### Question
One simple question that is the at heart of the learning outcomes for this class: once you formulate your business analytic question and find the necessary data, how do you select the best and most appropriate predictive modeling method(s)?

### Answer
It all boils down to the data available and the analysis goals. The first thing is to evaluate the type of analytic problem, as either a quantitative or classification problem. This will very quickly narrow the modeling choices. The next step is to define the analysis goals: interpretation, inference or prediction. If the goal is interpretation, the model selection will gravitate towards a regression method. If the goal is inference or predictive accuracy, the model selection will be driven by cross-validation testing results. If the modeling approach is parametric (e.g., regression), you need to evaluate which OLS assumptions hold. If they all do, then OLS is BLUE and is the best choice. If not, the particular assumption violated will dictate the particular modeling approach. At the very least, you should test for multicollinearity, heteroscedasticity and serial correlation (when data is time dependent). The optimal modeling approach will be based on these results. If multicollinearity and other dimensionality issues are a problem, some dimensionality reduction methods may be appropriate: variable selection (if it’s OK to exclude variables), penalized methods (if there are too many variables and it is not OK to exclude variables) or dimension reduction methods (if the ratio of variables to observation is low). In all cases, you should conduct cross-validation testing to evaluate all viable alternative models.

