#### 10. SURVEY DATA MODELS ####


## Factor Analysis

# Factor Analysis Using Principal Components (code not in the textbook)

# The goal in factor analysis is to group "observable" variables (e.g., GMAT scores, GPA, other test scores, etc.) into "unobservable" or "latent" factors (e.g., "intelligence"). Factor analysis is a popular method, not only for surveys, but for other applications in marketing, behavioral analytics, etc. For example, we can measure several food item attributes (e.g., fat, calories, carbohydrates, fiber content, popularity, price, etc.). 

# Factor analysis can help group these attributes into "latent" descriptive factors like  "Healthy" (fat, calories, carbohydrates, fiber content) and "Sale Appeal" (popularity, price). Factor analysis looks at the correlation structure of the observable (i.e., recorded) variables and groups them into "unobservable" factors that group together based on their correlation or similarity.

# Principal Components Analysis (PCA) and Common Factor Analysis (CFA) are two very different things, but they are often confused because they are often used together. PCA is about finding an axis in the data, along wich the variance in the data is maximized, then finding the next orthogonal axis with the second highest variance and so on. 

# The idea is the first few components may explain a high proportion of the variance, which can allow us to build a predictive model with k components, rather than p variables (where k<n). If the p variables are largely uncorrelated k will be very close or equal to p and PCA won't be very useful. 

# Conversely, if the p variables are largely correlated, then k will be much smaller than p and pCA will be desirable. CFA usually starts with CFA (thus the confusion) to identify the k orthogonal principal components (there are many methods to extract orthogonal components so PCA is only one, but the most popular method). 

# But in CFA the PCA axes are rotated (with the Varimax rotation methdod being the most popular), so that the axes are no longer orthogonal (i.e., perpendicular), but the rotation aims to find stronger commonality among variables, which can be grouped into factors. CFA is most popular in analytics methods for survey data (i.e., to group answers to the many questions asked into a few groups of correlated variables, or factors).

# The example below illustrates CFA with Varimax Rotated PCA, retaining k=5 components

install.packages("psych") # If not installed already
library(psych) # Contains the principal() function for factor analysi
library(ISLR) # Contains the Hitters data set
attach(Hitters)
names(Hitters)
?Hitters # Explore the variables

# Let's get an example X data frame to illustrate factor analysis

x.Hitters <- data.frame(Hitters$AtBat, Hitters$Hits, Hitters$HmRun, 
                        Hitters$Runs, Hitters$RBI, Hitters$Walks,
                        Hitters$CAtBat,Hitters$CHits,Hitters$CHmRun, 
                        Hitters$CRuns, Hitters$CRBI, Hitters$CWalks)

cor.Hitters <- cor(x.Hitters) # Get a correlation matrix for X first
print(cor.Hitters, digits=3) # Take a look

# Again, the main idea is to reduce P predictors to M factor. But how many factors are good enough? One quick way to decide on the number of factors to extract is to display a scree plot of the correlation matrix, which graphs the eigenvalues for the factors or principal components. Because the average variance on standardized vairables is 1 and eigenvalues are standardized, the average eigenvalue is 1. So, eigenvalue = 1 is typically used as a rule of thumb cutoff point to decide on a factor solution. Take a look:

scree(cor.Hitters, factors=TRUE) # Draw a scree plot for the factors

# Notice that the plot "elbows" around 3 factors. That is, there is a sharp decline in eigenvalues (i.e., variance explained by the respective factor, up to 3 factors, which is just when it crosses the eigenvalue = 1 threshhold). So the best factor solution is M = 3 factors.

# Again, a quick rule to figure out how many factors to extract is to eyeball the Scree Plot. The optimal number of factors is near the elbow and around Eigenvalue = 1

# You can compute the eigenvectors and eigenvalues for any correlation matrix, which will provide the correlation matrix of the data, when the axes are rotated to align with the principal components

eigen.vectors.Hitters <- eigen(cor.Hitters)
eigen.vectors.Hitters # Take a look

# Note: the sum of eigenvector scores squared for any row or column is always 1; i.e., by definition, eigenvectors have a lenght of 1

eigen.values.Hitters <- eigen(cor.Hitters, only.values = TRUE)
eigen.values.Hitters # Take a look

# Now let's do factor analysis on the correlation matrix. First, let's first look at ALL 12 PCA's without rotation (explained shortly).

# Extract all PCA's
factor.Hitters.all <- principal(x.Hitters, nfactors=12, scores=TRUE) 
factor.Hitters.all # print results

# Notice the factor loadings for each variable. A high factor loading > 0.5 for a given variable and principal component indicates that the variable contributes substantially to that factor. Think of it as a weight. But also notice that the factor loadings are not sequentially ordered

## Varimax Rotation

# Again, the purpose of factor analysis is to group observable variables into unobservable "latent" factors. Principal components helps us do that by finding the various directions in which the data has the highest variance. Two thing generally happen with this method:

# 1. The first factor is based on the first principal components 
#    and, therefore, it is the direction in which the data has 
#    more variance.

# 2. The factor loadings for a given variable (i.e., proportion of 
#    variance of that variable explained by each factor) tend to be
#    a bit more spread out than desirable.

# This is OK when extracting factors, but once we decide that the optimal solution has 4 factors (for example), we can tweak the 4 factors a bit to:

# 1. Spread out the variance across all factors (rather than 
#    having 1 dominant factor); and

# 2. Vary the factor loadings for each variable so that each 
#    variable loads more heavily on a single factor, rather 
#    than evenly spread across factors.

# "Orthogonal" rotations do precisely that. Once a 4-factor solution is selected (for example), those 4 factors are rotated orthogonally (i.e., all factor axes are rotated together) to optimize 1 and 2 above. Intuitively but not exactly, the "Varimax" rotation method is like doing further factor analysis on the extracted factors (only).

# Let's now do a Varimax rotation and force the solution to 5 factors, using rotate="varimax":

factor.Hitters.5 <- principal(x.Hitters, nfactors=5, 
                              rotate="varimax", scores=TRUE)

factor.Hitters.5 # print results 

# - PC1,2,etc. are the Principal component loadings

# - h2 shows the "communalities" for each variable. Communality is
#       the sum of squared factor loadings for that variable and
#       represents the proportion of variance of that variable that
#       is accounted for by the factors extracted. Communalities 
#       close to 1 are desirable.

# - u2 shows the "uniqueness" of that variable = 1 - Communality

# - com shows the "component complexity" for that variable -- some
#      complexity index (Hoffman's) -- higher when loadings are more
#      evenly spread; lower when loadings are more "simply" weighted
#      on one or few variables (more desirable)

factor.Hitters.5$values 
# Best solutions when eigen values become <1, 3 in this case

# Display factor scores for each observation
factor.Hitters.5$scores
# Shows the factor value for each observation

# Display factor weights to construct the factor scores
factor.Hitters.5$weights 

# These are like standarized regresion coefficients that show the effect of each variable on each factor.

# Draw a scree plot for the factors
scree(cor.Hitters, factors=TRUE) 

# Now Let's try a 3-factor solution, which the Scree plot and eigen value<1 suggested as the best solution.

# First without Varimax rotation
principal(x.Hitters, nfactors=3, scores=TRUE)

# Now let's rotate and save the results
factor.Hitters.3 <- principal(x.Hitters, nfactors=3, 
                              rotate="varimax", scores=TRUE)
factor.Hitters.3 # print results 

# Now let's sort the variables from highest to lowest factor
# loading to make it easier to decide which variables to group
factor.Hitters.3.sorted = fa.sort(factor.Hitters.3) # print results 
factor.Hitters.3.sorted


## Reliability Analysis and Cronbach's Alpha

# This statistic is essentially a group correlation, but it works with multiple variables and it make an adjustmet to the statistic based on how many variables are included, because more variables increase the reliability.

# To compupte the Cronbach-Alpha statistic, we first need to group the variables that we want to analyze. Based on our rotated factor loadings, we found that CAtBat, CRuns, CHits, CRBI, CWalks and CHRun loaded together. Let's call this group "HitEffectiveness":

library(dplyr) # Contains the select() function below
library(psych) # Contains the alpha() function below
HitEffectiveness=select(Hitters,CAtBat,CRuns,CHits,CRBI,CWalks,CHmRun)
names(HitEffectiveness)
head(HitEffectiveness)
alpha(HitEffectiveness)

# Key Output Items:

# - raw_alpha -- Alpha based on covariances (only useful if all 
#   items in the group are measured in the exact same scale)

# - std.alpha -- Alpha based on correlations -- this is the Cronbach
#   Alpha statistic you need to pay attention to; it is like a group
#   correlation -- the closer to 1 the better; anything above 0.7 is
#   considered highly reliable

# - Other various reliability stats -- less popular

# - "Reliability if an item is dropped" shows whether the Alpha would
#   improve or worsen if you were to remove that item from the group.
#   If Alpha is higher when a variable is dropped, you should drop it.

# Note: sometimes some variables have a reversed scale so that they have a strong but negative correlation (e.g., how much you like this class; how much you dislike the material). In that case, you need to use the "keys" attribute to reverse the necessary scale, otherwise the average Alpha correlation statistic will be incorrect. In the example above, there are 6 variables and they all correlate positively, so there is no need for the "keys" attribute. But if you wanted to reverse, ssay the second variable the alpha command would look like this:

# alpha(HitEffectiveness, keys=c(1,-1,1,1,1,1))


## Grouping Variables Into Factors

# You can group variables using Principal Components Regression, in which the PC's are orthogonal (i.e., un-correlated) with each other and thus ideal as truly "independent variables". But the idea behind Factor Analysis with survey data is to find groupings of highly correlated survey items that can help interpret survey results. 

# Thus, the standard parctice with survey data is to use Factor Analysis with Varimax rotation to find groups of variables with high factor loadings and then aggregate (e.g., average) them for analysis. Once aggregated you then use the aggregated factors rather than the original survey items. But these aggregated factors must have some business meaning

# In the example above you could compute an average variable:

Hitters$HitEffectiveness=(CAtBat+CRuns+CHits+CRBI+CWalks+CHmRun)/6
Hitters$HitEffectiveness
