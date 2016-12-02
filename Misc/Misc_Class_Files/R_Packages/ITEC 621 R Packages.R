#### ITEC 621 R Packages ####

# Prepared by J. Alberto Espinosa
# Last updated 5/22/2016

# To view package documentation enter:


# To view vignettes available for various  pacakges:
browseVignettes()

# To view the vignette associated with a particular package you installed, enter:

browseVignettes("car") # Vignette for the package "car"

# Needed for R Markdown
install.packages("rmarkdown")

# Used at various parts in the course
install.packages("car")
install.packages("caret")
install.packages("coefplot")
install.packages("corrplot")
install.packages("ctv")
install.packages("DataCombine")
install.packages("GGally")
install.packages("gbm")
install.packages("ggplot2")
install.packages("glmnet")
install.packages("HH")
install.packages("Hmisc")
install.packages("ISLR")
install.packages("lattice")
install.packages("lm.beta")
install.packages("lmtest")
install.packages("leaps")
install.packages("MASS")
install.packages("perturb")
install.packages("pls")
install.packages("psych")
install.packages("tree")
install.packages("VGAM")

# Not used in this class but contain popular statistical functions and
# related data
install.packages("caret")

# Not covered in class, but covered in the ISLR book
install.packages("gam")
install.packages("akima")
install.packages("e1071")
install.packages("ROCR")

# Packages for reading data
install.packages("data.table")
install.packages("XML")
install.packages("xlsx")
install.packages("xlsxjars")
install.packages("rJava")

# Load the desired libraries only when needed. They occupy memory.

# These libraries contain useful data sets. To browse the data sets you first need to load the libraries and then use the data() function:

library(car)
library(caret)
library(DataCombine)
library(GGally)
library(ggplot2)
library(glmnet)
library(HH)
library(ISLR)
library(lattice)
library(lm.beta)
library(lmtest)
library(MASS)
library(perturb)
library(psych)
library(VGAM)

# These libraries don't have data or the data are not interesting, but if you want to load them at once, here they are:

library(rmarkdown)
library(coefplot)
library(corrplot)
library(ctv)
library(gbm)
library(Hmisc)
library(leaps)
library(MASS)
library(perturb)
library(pls)
library(tree)

# To view all available data sets in loaded libraries:
data()

# To view the data sets in one package, e.g., ISLR, type:
data(package="ISLR")

# To view all available data sets in all available packages:
data(package = .packages(all.available = TRUE))

# To inspect a data set, e.g., Boston, in a loaded library (e.g., ISLR) type:
?Boston

# To view a data set, load it and view it:
data(Boston)
View(Boston) # Cap V

# Sites with data:
shell.exec("https://catalog.data.gov/dataset")
shell.exec("http://www.jeremymiles.co.uk/regressionbook/data/")
shell.exec("https://vincentarelbundock.github.io/Rdatasets/datasets.html")



