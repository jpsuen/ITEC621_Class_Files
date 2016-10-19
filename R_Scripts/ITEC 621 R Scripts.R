####################
# ITEC 621 Scripts #
####################

# Search keys:

##### We are here
##### Pending

# Prepared by J. Alberto Espinosa
# Last updated on 6/15/2016

# This script was prepared for an American University class ITEC 621 Predictive Analytics. It's use is intended specifically for class work for the MS Analytics program and as a complement to class lectures and lab practice.

# The INDEX below is to help you navigate this script. To jump to a particular section, highlight the corresponding text in the index below, then hit Ctrl-F (the search/find shortcut) and you will see the text you selected in the search box at the top left of this screen. You can then press "Enter" or click "Next". Since I used the same titles in the Index and in the script below, the cursor will jump to that section.


#######################################################
#                       INDEX                         #
#######################################################

#### 1. R INTRODUCTION ####

### R 1.1 R Overview
### R 1.2 R Packages
### R 1.3 R Studio Overview

#### 2. R FOR ANALYTICS ####

### R 2.1 General Information About this Script
### R 2.2 Create a Working Directory and Project
### R 2.3 General Information on R and R Studio
### R 2.4 General Information About the ISLR R Code
### R 2.5 Packages, Views and Libraries
### R 2.6 Working with R Objects
### R 2.7 Variables and Data Types
### R 2.8 Working with Text
### R 2.9 Functions
### R 2.10 Program Control: If'S 
### R 2.11 Program Control: Loops
### R 2.12 Simple Statistics with R
### R 2.13 R Markdown
### R 2.14 Shiny 
### R 2.15 ISLR Chapter 2 Lab: Introduction to R

#### 3. REGRESSION REFRESHER ####

## Correlation
## ANOVA
## Simple Linear Regression
## Multiple Linear Regression
## Multicollinearity
## Weighted Least Squares (WLS) Regression
## Generalized Linear Methods (GLM)

#### 4. DATA PRE-PROCESSING ####

## Transformation 1: Categorical To Dummy Variable Predictors
## Transformation 2: Polynomials
## Transformation 3: Box-Cox
## Transformation 4: Log Models 
## Transformation 5: Count Data 
## Transformation 6: Centering data 
## Transformation 7: Standardizing data 
## Transformation 8: Rank transformation 
## Transformation 9: Lagging data
 
#### 5.1 MACHINE LEARNING ####

### ISLR Chapter 5 Lab: Cross-Validation (CV) and the Bootstrap

## The Cross Validation Set (CVS) Approach
## Leave-One-Out Cross-Validation (LOOCV)
## k-Fold Cross-Validation (KFCV)
## The Bootstrap

#### 5.2 VARIABLE SELECTION ####

### ISLR Chapter 6 (1) Lab: Model Selection

## Subset Selection Methods
## Best Subset Selection
## Forward and Backward Stepwise Selection using regsubsets()
## Choosing Among Models using cross-validation

#### 6. DIMENSION REDUCTION ####

### ISLR Chapter 6 (2) Lab: Regularization (Ridge, Lasso, PCR, pLS)

## ISLR Lab 6.2 (1): Ridge Regression
## ISLR Lab 6.2 (2): LASSO Regression
## Principal Components Regression (PCR)
## Partial Least Squares (PLS) Regression

#### 7. NON-LINEAR MODELS ####

## Interaction Terms - Binary x Continuous
## Interaction Terms - Continuous x Continuous
## Polynomial Regression
## Polynomial Logistic Regression
## Step Functions
## Piecewise Linear Regression
## Splines
## Polynomial and Cubic Splines
## Natural Cubic Splines
## Smoothing Spline
## Local Regression
## Generalized Additive Models (GAMs)
## GAM and Logistic Regression

#### 8. CLASSIFICATION MODELS ####

## Binomial Logistic Regression
## Mutinomial Logistic Regression
## Linear Discriminant Analysis (LDA)
## Quadratic Discriminant Analysis (QDA)
## K-Nearest Neighbors (KNN)

#### 9. DECISION TREES ####

## Regression Trees
## Classification Trees
## Bootstrap Aggregation -- Bagging
## Random Forests
## Boosting

#### 10. SURVEY DATA MODELS ####

## Factor Analysis
## Varimax Rotation
## Reliability Analysis and Cronbach's Alpha
## Grouping Variables Into Factors

#### Other Topics ####

## Support Vector Classifier
## Support Vector Machine
## ROC Curves
## Support Vector Machine with Multiple Classes
## Principal Components for Descriptive Analytics
## K-Means Clustering
## Hierarchical Clustering


### ISLR Chapter 9 Lab: Support Vector Machines
### ISLR Chapter 10 Lab: Principal Components Analysis & Clustering


#######################################################
#                  END OF INDEX                       #
#######################################################


#### 1. R INTRODUCTION ####


### R 1.1 R Overview

# R is a dialect of S. S was created in the Bell Labs by John Chambers and his team as an object oriented language to do data analysis, statistical modeling, simulation and graphics. 

# R is a dialect of S. In other words, R is an improved version of R with very flexible and powerful capabilities to model problems and analyze data. R is different than S, but it was conceptualized as an improvement to S, so most S code will run fine in R.

# The name R comes from their two creators Ross Ihaka and Robert Gentleman (what a great name) from the University of Auckland, New Zealand.

# For further information on R, see Lecture Slides. Also see:

browseURL("https://www.r-project.org/about.html")
browseURL("https://en.wikipedia.org/wiki/R_%28programming_language%29")

# For frequently asked questions on R, see:

browseURL("https://cran.r-project.org/doc/FAQ/R-FAQ.html")

# To get started with R, you can use this documentation from CRAN
browseURL("https://cran.r-project.org/doc/contrib/Paradis-rdebuts_en.pdf")
browseURL("https://cran.r-project.org/doc/manuals/R-intro.pdf")

# You can install R by downloading it from a "mirror" site. The R installation files are posted in several similar sites. You can pick any mirror site, but it is recommended to pick one that is in close proximity to your location. In my experience, it is best to pick a mirror site that is more reliable. The best mirror site in the USA (Berkeley) seems to work well.

browseURL("https://www.r-project.org/")


### R 1.2 R Packages

# The power of R rests on the thousands of packages already written for R, which are publicly available at CRAN. We discuss how to install packages and load their respective libraries a bit later. To view all R packages, see:

browseURL("https://cran.r-project.org/web/packages/available_packages_by_name.html")


### R 1.3 R Studio Overview

# Studio provides 4 different windows:

# 1. Top-Left: Script window -- this is where you 
#    write scripts

# 2. Bottom-Left: R Console -- this is where you can type R 
#    commands directly and where R displays results and 
#    messages when you run commands. If you were not using 
#    R Studio, you would only see this R Console.

# 3. Top-Right: Environment window -- this is where you can 
#    see any R objects created or opened (e.g., variables, 
#    data tables, etc.)

# 4. Bottom-Right: Model explorer -- this is where you can 
#    view the files in the working directory, plots generated 
#    by R commands, packages available and installed, help 
#   displays, etc. 

# Also, for R packages provided by R studio, see:
browseURL("https://www.rstudio.com/products/rpackages/")


#### 2. R FOR ANALYTICS ####


### R 2.1 General Information About this Script

# The material contained in this script is partly based on:

# Introduction to Statistical Learning (ISLR)
# Book by James, Witten, Hastie and Tibshirani 

# A lot of the code included in this script came from that book, and it is mostly contained in the sections labeled "ISLR Chapter", but with some adaptation, annotations and instructions for the class and also with lots of additional comments

# Note: the # symbol is used in R to write non-executable comments and document your scripts this way. Anything in a given line to the right of an # symbol is ignored during execution

# Note: the authors have a more advanced book:
# Title: Elements of Statistical Learning

browseURL("http://statweb.stanford.edu/~tibs/ElemStatLearn/") # Website
browseURL("http://statweb.stanford.edu/~tibs/ElemStatLearn/data.html") # Datasets:


### R 2.2 Create a Working Directory and Project

# Before you start working in R, create a folder in your computer where you will keep all your R work for the class. For example, I use C:/AU/Courses/ITEC621/R. Once you have your folder created, place all your scripts and data files for this class in that folder and set your R working directory accordingly:

setwd("C:/AU/Courses/ITEC621/R")

## Create a Project Environment for this Class

# You can change working directories any time, but it is a bit annoying changing working directories every time you open R. It is customary to create different working directories for different and unrelated projects and R makes it really easy to move from one project to another, which will move the working directory to the project's director. From the R menu, select:

# File -> New Project

# If you have already created a working directory for this class, select "Existing Directory". Once you enter the working directory for this class it will show up in the project tool bar at the right upper corner in the R Studio screen, along with any other projects you may have created. If you have not created a working directory yet, select "New Director" and create your working directory and project at the same time.


### R 2.3 General Information on R and R Studio

# Note: CRAN is the Comprehensive R Archive Network, which has tons or R resources. It is located at: 
browseURL("http://cran.r-project.org/") 

# Note, you can also use the shell.exec() to execute external commands, including opeining web sites:

shell.exec("http://cran.r-project.org/") 

# But this may not work for Mac users, so if you cannot run the shell.exec() function on a Mac, use browseURL()

# Also, this is a search engine custom taylored to R: 

browseURL("http://rseek.org")

# To search and use open source R code created by others, signup for GitHub then search for R software code - you can copy all you want, it's open source!!

browseURL("https://github.com/")


## 2 Ways to RUn R Commands

# 1. From the R Console below, just type the command, e.g., type in the console:

?setwd() # which will display help for the setwd() function

# 2. From the script, go to any script line and press Ctrl+Enter (PC) or Cmd+Enter (Mac). Try it:

?setwd()

# When working with R, it is better to keep all scripts and data in one directory. You can have different directories for different projects. Change your working directory to that directory with the "setwd" command (my files for this course are in the C:/AU/Courses/ITEC621/R directory:

setwd("C:/AU/Courses/ITEC621/R")
getwd() # To display the current working directory


## Getting Help

# In RStudio, the help system is located in the "Help" tab

# You can request help for a keyword with ??"<keyword>", e.g.:

??"regression"

# Use ? to get help for a given command, e.g.: 

?lm() # Help on the lm() function to build linear models

# One excellent resource to search anything in R is to go to the rseek.org web site, which is a search engine optimized for R help.

browseURL("http://rseek.org")


## Vignettes -- Important Documentation Supplements

# You will quickly learn that the R documentation on packages and functions can be cryptic. This documentation is written by the package developer and they often include just the minimal information requiried to understand the package contents. More complete documentation is usually provided in additional documents called "vignettes", which are supplementary and optional documentation for packages and functions. Some packages have vignettes and some do not. To find out the vignettes in your installed packages"

browseVignettes()

# To view the vignette associated with a particular package you installed, enter:

browseVignettes("car") # Vignette for the package "car"

## VERY IMPORTANT: R is Case Sensitive !!!
                                                              
# Be sure to type upper or lower case as required  For example GetWD() or GETWD() won't work!! You must type all commands and library names exactly as they are spelled -- e.g., getwd() will work!!


## Comments -- The Infamous # Sign:

# The # sign is use to write non-executable comments. Don't rely on your memory and document your scripts heavily. You'll thank me for it later. You can comment like I'm doing in this text, or you can simply add a sign after an R command to document that command. Everthing in the command line after the # sign will be ignored during the command execution.

# This can be used to suppress the execution of an R command without deleting the command (i.e., commented out). For example:

# library(ISLR)

# There are many great resources for learning R. There are two very good  video lectures in Lynda.com (access from the AU Portal:


## Tutorials

# AU Portal -> Technology -> Lynda Web-Based Training:
browseURL("http://www.lynda.com/R-tutorials/R-Statistics-Essential-Training/142447-2.html?autoplay=true")
browseURL("http://www.lynda.com/R-tutorials/Up-Running-R/120612-2.html?autoplay=true")

# Another great way to learn R is with the Datacamp tutorials:
browseURL("https://www.datacamp.com/")

# There are also mobile applications like "R Instructor" with tips and tutorials. Finally, there are lots and lots of great books on R. There are also so many great books on R 

browseURL("http://www.rinstructor.com/")


## Books

# A fair amount of the material in this section comes from: 
# "R for Everyone", by Jared P. Lander, Addison Wesley

browseURL("http://www.jaredlander.com/r-for-everyone/")
# This is a great starting book to learn R

# This is another good book on R: "R Cookbook"
browseURL("http://cdn.oreillystatic.com/oreilly/booksamplers/9780596809157_sampler.pdf")


## Useful Web Sites

browseURL("http://www.statmethods.net/")
browseURL("https://support.rstudio.com/hc/en-us")


### R 2.4 General Information About the ISLR R Code

# We are using the ISLR book for this course. See their web site:
browseURL("http://www-bcf.usc.edu/~gareth/ISL/index.html")

# The companion R code included with thi book is in the ISLR package:
install.packages("ISLR")

# All data sets used by the book authors are contained in the ISLR package. We will use several of these data sets for this class, plus some others.

# Auto: Gas mileage, horsepower, and other information for cars. 
# Caravan: Information about individuals offered caravan insurance. 
# Carseats: Information about car seat sales in 400 stores. 
# College: Demographic characteristics, tuition, and more for USA colleges. 
# Default: Customer default records for a credit card company. 
# Hitters: Records and salaries for baseball players. 
# Khan: Gene expression measurements for four cancer types. 
# NCI60: Gene expression measurements for 64 cancer cell lines. 
# OJ: Sales information for Citrus Hill and Minute Maid orange juice. 
# Portfolio: Past values of financial assets, for use in portfolio allocation. 
# market: Daily percentage returns for S& P 500 over a 5-year period. 
# SArrests: Crime statistics per 100,000 residents in 50 states of USA. 
# Wage: Income survey data for males in central Atlantic region of USA. 
# Weekly: 1,089 weekly stock market returns for 21 years.

# You can view all data sets in the ISLR package with:
library(ISLR) # To activate the ISLR package
data(package="ISLR") # To list the data sets in the ISLR package

# Or visit:
browseURL("http://statweb.stanford.edu/~tibs/ElemStatLearn/datasets/")

# To read a data set from this (or other) web sites, use:

MyData <- read.table(
  "http://statweb.stanford.edu/~tibs/ElemStatLearn/datasets/AnyDataFile.data",
  sep=",",head=T,row.names=1)

# Or more generally:
MyData <- read.table("web-URL/DataFileName.data", 
                     sep=",",head=T,row.names=1)

# To list the data sets in all active libraries enter:
data()


### R 2.5 Packages, Views and Libraries

## Installing Packages and Views

# Packages

# You can write lots of very powerful R Scripts, which is great, but the real power of R is in the thousands of R packages that others have already written, which are public and free.

# In the R documentation, it is customary to refer to packages with curly brackets, e.g., {base}. Functions or libraries contained in these packages are usually specified like this: lm(){stats}

# Base Package

# R comes with a pre-installed {base} package with lots of useful libraries
help(package="base")

# All other packages need to be installed and activated. Also, see:
browseURL("https://stat.ethz.ch/R-manual/R-devel/library/base/html/00Index.html")

# Similarly, R comes with several included data sets with the base installation, which are contained in the {dataset} package

data(package="datasets")
library(help="datasets")

# Using a package is a 2 step proces: 

# 1. You first need to install the package. You only 
#    need to do this once and the package will remain
#    installed until you uninstall it. 

# 2. You will need to activate the packges you want 
#    to use after you start R. The package will remain 
#    active in your R session until you quit R.

# To install a package use the install.packages() function

# To activate a package use the library() or require() functions

# Please note that some packages are installed automatically with the standard installation of R. There is no need to further install these packages

# Also, some packages require other packages to work properly. When you install an R package, all the necessary related packages will be installed automatically.

# Review the help documentation for these two functions:

?install.packages()
?remove.packages
?library()
?require()

# You can also install packages by clicking on the Packages tab in the model viewer, clicking Install, and then following the steps. Similarly, you can also activate packages by checking the corresponding box in the Packages tab.

# You rarely need to uninstall packages, but if you wish to you can do it by unchecking the corresponding box in the Packages pane, or using the command:

remove.packages()

# In contrast to not needing to uninstall packages, you may sometimes need to deactivate or unload packages. You can do this by unchecking the corresponding box in the Packages pane or entering this command:

detach("packages:PackageName")

# To list all installed packages enter:
installed.packages()

# To view just the package names (column 1)
installed.packages()[,1]

# Then get help on that package
help(package="base")

# To view all available packages go to:
browseURL("https://cran.r-project.org/web/packages/available_packages_by_name.html")

# To list available libraries enter:
library()

# To get documentation and a list of functions in a given package enter:
library(help=PackageName)

# To view the data sets available in all active packages enter:
data()

# To view the data sets in a particularly active package enter:
data(package="ISLR") # Example for the ISLR package

data(dataSetName) # To load a specific data set in to memory

## Views

# Views are collections of packages by function or type of analysis. You can view the various packages that are contained in a view at

browseURL("http://cran.r-project.org/web/views/")

# Once you find a view and wish to install the packages it contains, installing the view automatically installs all the packages it contains, if not already installed. In oreder to install views, you first need to install and load the CRAN Task View "ctv" package:

install.packages("ctv")
library("ctv")

# Then, for example, if you want to install the "Graphics" view, use:

install.views("Graphics")

## Reading Data Into R

# It is recommended to place all your data sources in one working directory.

# Many data sets, and most of the ones we will use in this class are contained in packages, so the data becomes available after you load the respective libraries. To view all data sets that either come with R or are avilable in loaded libraries enter:

data()

# To view the first 6 rows of a data set and the respective column name for example "mtcars" enter:

head(mtcars) # Car and gas consumption data
tail(mtcars) # Shows the last 6 rows in the table

# You can also double-click on the data set in the environment viewer on the right to view the full table. You can also view the full table with the fix() function, which also allows you to edit the data:

fix(mtcars) # Check it out

# While you can read multiple data sources into R (such as SPSS, SAS and Excel), I find it a lot easier to manipulate data sets in Excel and then save the datasheet as a "comma separated values" or "cSV" file. For example, many of the packages to read Excel data into R require current versions of Java or certain versions of Excel, whereas CSV files work universally.

# If you want to read a "csv" file from your working directory, enter:

mydata <- read.table("myDataFile.csv", header=TRUE, sep=",")

# For, example, this command reads into an R data frame the CSV file "Auto.csv" located in the working direcory. The "header=TRUE" attribute specifies that the first row in the "csv" file contains the variable names, which is the recommended way to do it. The sep="," attribute specifies that the values are separated by commas. When you save a file in CSV format you can use any value delimiter you wish, but a comma is the most common way. The attribute row.names="id" gives each row a name. In this example, the row names will be the values contain in the attribute "id". Think of this as a primary key.

# If the "csv" file is not located in the working directory, you need to specify the directory using forward slashes "/" (don't use the backslashes "\"). Ex:

mydata <- read.table("c:/au/courses/ITEC621/R/Auto.csv", header=TRUE, sep=",")

# or simply 
mydata <- read.table("Auto.csv", header=TRUE, sep=",")

head(mydata) # To see the column headers and first few records
names(mydata) #To see the column (i.e., variable) names in the table

## Excel Files (TRY ON YOUR OWN)

# There are many packages to read Excel files, but I've had trouble with all of them at one point or another. The easiest thing is to save your original data source as an xlsx file and do all your data manipulation in Excel and when you are ready, save a copy as a CSV file for your analysis.Several experts recommend this too.

# Again, it is much easier to save your Excel file as a "csv" file, but if you feel adventurous, here are some packages to read Excel files:

install.packages("xlsx")
install.packages("xlsxjars")
install.packages("rJava")
library(xlsx)
require(xlsx)
mydata <- read.xlsx("c:/myexcel.xlsx", 1)

# read in the worksheet named mysheet
mydata <- read.xlsx("c:/myexcel.xlsx", sheetName = "mysheet") 

# Also try this (ON YOUR OWN):

library(gdata)                   # load gdata package 
help(read.xls)                   # documentation 
mydata = read.xls("mydata.xls")  # read from first sheet

## MS Access files (TRY ON YOUR OWN): 

# The best thing is to manage your data directly in MS Access. Then, open any data table you may need, or run an SQL query to produce the data you need for your analysis. Then with the data table or query results open, select the External Data tab in Access. Then, in the Export section of the ribbon select "text file" and follow the instructions. You can save the file as a .txt or .csv file. It makes no difference. Just remember the full file name.

## SPSS Files (TRY ON YOUR OWN):

# You will first need to load the library "foreign" (comes with R). The foreign library has functions to read other data formats:

library(foreign) 

# Then read the file
mydata <- read.spss(file = "MyDataFile.sav", to.data.frame= TRUE, reencode = TRUE)

## Other statistics data files:

# You should also be able to read other statistics data files with the foreign library issuing commands similar to read.table, but instead use: 
# read.spss for SPSS; read.dta for Stata; read.ssd for SAS; read.octave for Octave; read.mtp for Minitab and read.systat for Systat

# Personally, my preference is to convert data to the general format .csv which is much easier to manipulate (in Excel or R) and read. Many data import routines don't work as adverstised, so .csv is a safe option

# Data From Web Sites

Require(XML) # You need this library
URLToRead <- "http:// etc" # This is the URL for the HTML data
MyData <- readHTMLTable(URLToRead, which=1, header=FALSE, stringsAsFactors=FALSE)

# The which argument specifies which table to read if there are more than 1 Specify header=TRUE if the table has a header

## Saving Data from R to a file

# Saving a data frame to a "csv" file

write.table(mydata, "mydata.csv", sep=",") # For CSV files.
# The "sep" option specifies the delimiter between values, with "," being the most common and one the Excel will read

# Saving to an Excel file

library(xlsx)
write.xlsx(mydata, "mydata.xlsx") 

# Saving to an SPSS or SAS file

library(foreign)
write.foreign(mydata, "mydata.txt", "mydata.sps",   package="SPSS") # SPSS 
write.foreign(mydata, "mydata.txt", "mydata.sas",   package="SAS") # SAS
write.dta(mydata, "mydata.dta") # Stata


### R 2.6 Working with R Objects

# R is an "object-oriented" softwre language, therefore, it treats everything as objects. An object has two things: 

# (1) data; and 
# (2) programs or functions, encapsulated toghether. 

# When you create an object, you can then access it to run its programs/functions and read or manipulate its data. Objects can be used to create other objects using a property of object-orientation called "inheritance", such that the data and programs from one object are inherited by another.

# For example, we can run a regression model to predict miles per gallons using the mtcars data set:

lm(mpg~cyl+disp+hp+wt,data=mtcars) 

# And we can get more data from this model with the summary() function:

summary(lm(mpg~cyl+disp+hp+wt,data=mtcars))

# But the lm() and summary() function results are stored in objects and if we want to review these objects at any time, it is useful to specicially pipe the function results into a named object. For example:

lm.fit <- lm(mpg~cyl+disp+hp+wt,data=mtcars) 

# Now that the regression results (i.e., lm() object)) are stored in the lm.fit object, we can access its summary data with the summary() function.

summary(lm.fit)

# The R command above creates the object lm.fit using the lm() function. The important thing to remember is that this, like any other R object has data we can view/edit/manipulate and functions/programs we can invoke. So, this lm.fit object has data we can read. 

# Just about everything in R is stored in objects, even the regression formula can be stored and accessed with a named object:

lm.formula <- mpg~cyl+disp+hp+wt
lm.fit <- lm(lm.formula, data=mtcars)

# But rather than just list the summary, we can save the results in another object so that we can use it later:

lm.summary <- summary(lm.fit)
lm.summary # Check it out

# The str() function is very useful to find out what is stored in an object. This is why saving results as object is so useful if you need to extract data from an object later on

str(lm.fit)
str(lm.summary)

# Notice in the display that there are a few values prefixed with $. To access specific data elements from an object we can use the $ symbol. 

# For example, these show the regression coefficients
lm.summary$coefficients # or
summary(lm.fit)$coefficients
# This shows the residuals:
lm.summary$residuals # or
summary(lm.fit)$residuals

# Note: you can use the options() function to change how R reports results to some extent. The "scipen" attribute is useful to convert scientific notation (e.g., 1.8e-14) to actual numbers (e.g., the number with 14 zeros after the decimal point). Try it

options(scipen="20") # scipen = Scientify Notation Penalty
summary(lm.fit) # Check it out

# The scipen (i.e., scientific penalty) value tells R to display the value in scientific if there are more than 20 zeros after
# the decimal point. Now try

options(scipen="4")
summary(lm.fit) # See the difference

# Programs/functions that do something with objects have round brackets after them, e.g., mean(), length(), summary()

# The formula mpg~cyl+disp+hp+wt is a typical model formula using R syntax. This function notation is used in various R commands.

# The symbols <- represent an "assignment" in R. The lm.fit formula above runs the lm() linear model function and assigns the result to an object named lm.fit. 

# In many cases the "=" operator can be used interchangeably with "<-". Many serious R developers don't like to use the "=" sign because it has a special meaning in some other operations (e.g., testing for equality), but I use it all the time for convenience. See:

# This works just like with "<-"
lm.fit = lm(mpg~cyl+disp+hp+wt,data=mtcars) 

# For example:
x <- 3+4 # Look at the value of x in the Environment window
x # Check it out
# The value resulting from computing 3+4 has been assigned to the variable x

# These 2 assignment commands do the exact same thing:
x = 3+4
x # Check it out
3+4 -> x
x # Check it out

# If x does not exist, it is created in the working memory of R, which is called the workspace. To see the content of x, it must be called (i.e., executed):

x 
str(x) # To see what else is contained in the object x

# Please note that x <- 3+4 is DIFFERENT than x < -3+4. The first entry assigns 3+4 to the variable object x. In the second entry we are evaluating if the object x is smaller than -3+4. One space shift can make a huge difference. So, please ensure that when you use the assignment operator <- there is no space between the < and the -

# In R Studio, the content of the workspace is shown in the Environment tab (top-right). Its contents can also be displayed in the console with the ls() and objects() commands 

ls()
objects()

# To delete an object, we pass it as parameter to the rm() function (for remove) by writing it in the brackets of the command: 

rm(x)


### R 2.7 Variables and Data Types

# The best way to think of variables is as containers. They can contain just about anything, e.g., a single value, a vector, an array of values a graph, results from an analysis or any R object:

# What's the meaning of the dot (.)?

# Note: a "." in a variable name is simply part of the name and it has no other meaning; e.g., x, lm.fit, my.data are valid variable names

# SIMPLE VARIABLE & DATA TYPES

# These contain single values of a given type, e.g., numeric, character, factor, date, and logical. You don't need to declare a variable's type. The variable type is implicitly (automatically) declared when a value is stored in the variable. Certain data types require delimiters, such as double quotes " for character (i.e., text) data. It is often useful to check or display a particular variable data type:

# Numeric

x=2.4 # Automatically declares x as numeric
x 
class(x) # Check it out
is.numeric(x) # Check if x is numeric
is.integer(x) # Check if x is an integer

# Character

# Note: characters are case sensitive

x="Alberto"
x
class(x) # Check it out
is.numeric(x) # Check that x is NOT numeric
is.character(x) # Check that x is character
nchar(x) # Number of characters in the value of x
nchar("Alberto") # Number of characters in the literal text "Alberto"

# Dates

x=as.Date("2016-10-20") # Converts a text string into a date value
# Note that the word "Date" is capitalized

# Also note the date format is YYYY/MM/DD, which can be changed as follows:
x=as.Date("10/20/2016", "%m/%d/%Y") # Use upper case %Y for 4-digit years
x=as.Date("10/20/16", "%m/%d/%y") # Use lower case %y for 2-digit years
x # Check it out
class(x) # Check it out

# Note: you can use other date formats with: %a abbreviated weekday; %A weekday; %b abbreviated month; %B month.

# Also, you can use the as.POSIXct() function to read date and time:

x=as.POSIXct("2016-10-20 17:30") # Note that a space is needed after :
x # Check it out

# You can subtract dates and add days to a date: 
born=as.Date("2000/2/12")
today=Sys.Date()
aWeekAgo=today-7
aWeekFromNow=today+7
ageInDays=as.numeric(today-born) # Need to convert to numeric
age=floor(ageInDays/360) # The floor() function rounds down decimals

# Check them out:
today
aWeekAgo
aWeekFromNow
ageInDays
age

# Logical

# Logical variables can be either TRUE or FALSE. Numerically, TRUE is identical to 1 and FALSE to 0. Logical variables and values are important to evaluate conditions

TodayIsMyBirthday=FALSE
class(TodayIsMyBirthday)
is.logical(TodayIsMyBirthday)
2==3 # The double == is used to evaluate if two values are equal
2!=3 # Evaluate if 2 is not (!) equal to 3
2<3 # Evaluate if 2 is smaller than 3

## Vectors

# A vector is simply a list of values, but all values must be of the same type (e.g., character, numeric, date, etc.)

#  It said that "R is vectorized", meaning that many values are stored in vectors and that R has many convenient features to manipulate data contained in these vectors.

# The "c" function is used to create vectors. The "c" means to "concatenate", "create" or "combine" values

x <- c(1,2,3,2,6,3,5)
x # Notice that all values are numeric
x <- c(1,"al")
x # Notice that "1" is converted to character to be compatible with "al"

# Note that we already had a variable called x. The command avobe replaces the prior value of x with the newly created vector.

x # Check it out
x[4] # Indexing: e.g., 4th element of the vector
x <- x[-4] # Negative index: removes the 4th. element of the vector
x # Check it out

# One of the nice things about R vectors is that we can manipulate all the values in a vector with a simple command. For example:

y <- x*3 # Multiplies every value of the x vector by 3
y # Check it out

# It also allows us to access specific elements of the vectors using an "index":

y[2] # Display second vector element

# Vectors can also hold text values (need to enclose the text in quotes)

overForty <- function(x) {
  x <- ""
  for (i in x) {
    if (i > 40 ) {
      x <- c(x, i)
    }
  }
  return(x)
}


x <- c ("ITEC 610", "ITEC 620", "ITEC 621")
x # Try it
x[3] # Try it

# You can also give names to each vector element:

x <- c(fname="Alberto", lname="Espinosa", title="Professor")
x # Check it out

## Lists

# A list is similar to a vector but it can contain data of different types. Vectors can be used to create columns in data frames, lists cannot

y <- list(name="Alberto", title="Professor", age=16)
y # Check it out -- the data types are preserved

## Factors

# Text is difficult to process quantitatively without some transformation. We will cover transformations in depth later in the semester.

# For example, how would you model the price effect of the location type of a house? Say, if there are 3 types of locations: Rural, Urban and Suburban, we can create a factor for this data that finds the unique factors (i.e., text values) so that you can categorize it as needed. The factor conversion also assigns a number to each category, so that you can process things quantitatively. Take this text string vector:

x <- c("Rural","Urban","Suburban","Urban","Urban","Suburban")
x # Notice that Urban and suburban are repeate, as you would expect
y = as.factor(x) # Now, Convert x into a factor variable
y # Check out the 3 factors extracted out of x
as.numeric(y) # Check the unique number assigned to each factor

## Data Frames

# The use of data frames can be confusing at the beginning, but they are fundamental in understanding how to access and manipulate data in R. The easiest way to understand a data frame is to think of it as an Excel sheet with various columns each with a column name (or think of it as a database table).

# Do you need $? This is NOT money!!

# Each column in a data.frame is actually a vector and you can access the data in that vector with the "$" prefix. For example, a column named LastName in a data frame called Employees can be accessed using this name: "Employees$LastName" (note: in MS Access we would access this column with Employees.LastName) 

# Also, every row and column in a data frame is "indexed". It is very important to understand the use of indices in R for data manipulation. For example, you can access:

# Employees[1,] -- First row (all columns) 
# Employees[,1] -- First column (all rows)
# Employees[2,3] -- Element in 2nd row and 3rd column
# Employees[3:10,2:4] -- Rows 3 through 10 frin columns 2 throgh 4

# Let's practice with indices. First create a vector that will have the row indices for a data frame we will create shortly called MyDataFrame We will call this vector MyIndex (be careful with the capitalization)

MyIndex <- 1:8 # Creates the MyIndex vector with values 1 to 8
MyIndex # Check it out

# Now let's create a vector with 6 course numbers

courses <- c("ITEC 610", "ITEC 616", "ITEC 620", "ITEC 621", 
             "ITEC 660", "ITEC 670", "KSB 620", "KSB 621")
courses # Check it out


# Now let's create a vector with the pre-requisites for these 6 courses
prereqs <- c("None", "None", "ITEC 610", "ITEC 620", 
             "ITEC 610", "KSB 065", "ITEC 620", "ITEC 621")
prereqs # Check it out

# Now let's create the data frame
MyDataFrame <- data.frame(MyIndex, courses, prereqs)
MyDataFrame # Check it out

# Use the "$" sign after the data frame to reference a single column
MyDataFrame$courses

# Lets look at just part of the data frame
head(MyDataFrame) # Display the first few rows
tail(MyDataFrame) # Display the last few rows
MyDataFrame[2,c("courses","prereqs")] # To list selected columns for row 2
MyDataFrame[,c("courses","prereqs")] # To list selected columns for all rows

## Matrices

# A matrix is identical to a data frame in most respects (i.e., a table with values), except that all values must be of the same type. Most often matrices contain only quantitative values, which can be easily manipulated with matrix algebra. 

# Matrices are important in R because some statistical routines, like some correlation functions" only work with quantitative matrices. This is how you create a matrix:

x.mat=matrix(1:10, nrow=5)
# This command creates a matrix with 10 elements organized into 5 rows (i.e., the matrix has 2 columns, so it is a 5x2 matrix). 

# You could also accomplish the same thing with:
x.mat=matrix(1:10, ncol=2)
x.mat # Check it out

## Data Tables 

# Tables Work just like data frames, but you can use the {data.table} package to convert data frames into data tables, which have better internal indexing so that searches, indexing, aggregation, etc., are done a lot faster. Think of data tables as database tables. We won't be using data tables in this class, but it is good to know they exist and how they work:

install.packages("data.table")
require(data.table)
MyDataTable <- data.table(MyIndex, courses, prereqs)
MyDataTable

# Data Reshaping

# If you have various columns (i.e., vectors) of data and you would like to combine them into a data frame you can use the "cbind()" function to reshape various columns into one data frame. Similarly, you can use the "rbind()" function to bind rows of tables with similar columns 

MyBoundDataFrame <- cbind(MyIndex, courses, prereqs)
MyBoundDataFrame

# ILLUSTRATION: machine learning, data frames and indices

# This is an operation we will do often when fitting models: (1) split a data set into training and test subsets; (2) fit a model with the training subset; (3) test the model with the test subset; (4) when you are satisfied with the model you want to adopt, re-fit the model with the full data set. We will cover this later in the semester, but I would like to illustrate how we accomplish this with indices.

# Note: we will discuss this in more depth later, but here is some R code to get you thinking about machine learning

library(MASS) # Contains the Boston housing data set
nrow(Boston) # 506 observations in the full data set

# Let's split the data into a 70% training subset. IMPORTANT: the "train" object below is simply a vector containing 70% random numbers between 1 and the number of rows in the Boston data set: 

train=sample(1:nrow(Boston), 0.7*nrow(Boston))

# Again, these are NOT observatiosn, but simply a bunch of numbers drawn randomly between 1 and the number of observations in the data set. We will use these numbers as "indices" to define the training and test data sets.

train # Check it out
length(train) # 354 observations in the train data set
nrow(Boston)-length(train) # 152 in the test data set

# Let's fit a linear model with the training subsample
lm.fit <- lm(medv~crim+rm+age+tax, data=Boston[train,])

# Note that we use [train,] as the index with the Boston data set. This will select all the observations in the Boston data set whose row numbers match the numbers in the train vector. Note that we leave the value blan after the comma to use all available columns. We really don't need all columns, just the ones we use in the fitted model, but it doesn't hurt to use all columns and it is less writing in the command.

# We can now do predictions with the test set
predict(lm.fit,Boston)[-train]

# Note that we use [-train] as the index. In this case, we don't use the comma with blank [-train,]. Why? Because the - sign in an index means to remove rows or columns from a data set. So, [-train] removes the rows in the training subsample and leaves the remaining ones, i.e., the data set.

# We can now do a number of things with these results. We will discuss this later, but for example, we can compute the mean square error of predicting values in the test subsample with the model we fitted with the training subsample:

mse.test <- mean((medv-predict(lm.fit,Boston))[-train]^2) 
mse.test

### R 2.8 Working with Text

# We will not be doing text analytics in this course, but R is very powerful for manipulating text, some of which is illustrated next. 

# You can Concatenate text with the "paste()" function

paste("My", "Name", "is", "Alberto") # Default separator is a blank space
MyText <- paste("My", "Name", "is", "Alberto") # To store it in a variable
MyText # Note that sub-strings are separated by a blank space by default
paste("My", "Name", "is", "Alberto", sep="-") # to change default separator to "-"
paste("My", "Name", "is", "Alberto", sep="") # to eliminate the blank space

# You can concatenate literal text enclosed in quotes with text contained in variables without quotes:

MyName ="Alberto" # To create a variable that contains text
MyCourse = "ITEC 621" # And another variable
paste("My", "Name", "is", MyName, "and I teach", MyCourse) # To embed variables

# spritf() does the same and it places variable contents in each %s

sprintf("My Name is %s and I teach %s", MyName, MyCourse)
        
# In contrast to "paste()", the "c()" function concatenates into a vector

MyText <- c("My", "Name", "is", "Alberto") # Creates a vector with 4 elements
MyText

# Which you can then collapse into a single text string

paste(MyText, collapse="") # To concatenate the verctor into a string with no spaces
paste(MyText, collapse=" ") # Or with spaces

# Extracting Data from Documents

# You can get HTML data from documents and the web with the {XML} package

install.packages("XML") # Install the package once
require(XML) # Activate the package when you need it
?xml

browseURL("http://www.loc.gov/rr/print/list/057_chron.html")

URLLocation <- "http://www.loc.gov/rr/print/list/057_chron.html"

# The readHTMLTable() function can be used to get data from HTML tables

?readHTMLTable # Check the documentation

presidents <- readHTMLTable(URLLocation, which=3, 
                            as.data.frame=TRUE, 
                            skip.rows=1, header=TRUE, 
                            stringsAsFactors=FALSE)

# Note: the "which" parameter specifies which table in 
#       the html file, if more than one; "stringsAsFactors" 
#       converts strings into dummy variables, say FALSE for now

names(presidents)
head(presidents)

# TO retain only some rows, 1-64 for example:

presidents <- presidents[1:64,]
tail(presidents)


### R 2.9 Functions

# Functions can be either "built-in" (available in the base package or other installed packages); or "user-defined" (written in your R script)

# Built-In Functions -- there are thousands of these, e.g.,

x=c(2,3,6)
# One example of a simple built-in function in the {base} package
mean(x) 

# User-Defined Functions

# The use of user-defined functions involves two steps: 

# (1) creating and/or executing the function, and then 

# (2) using the function when needed.

# You can create any function with the "function()" function (pardon the redundancy). The steps that the function executes are enclosed within curly brackets {}. To run a function you have to highlight and execute all the commands (in between { and }) associated with the function, which will load the function commands into memory. Once you do this you can use the function any time until you shut down R.

# Some functions require parameters, others don't. A parameter is a value in the function that requires that we pass some value(s) to the function, which the function then uses to calculate something. For example:

ls() # A built-in function that does not require parameters
mean(x) # A function that requires a vector x as a parameter

# Let's create a simple function that displays "This is my R World!!" We will call this function "MyWorld()" and will not require any parameters -- i.e., there will be nothing inside the "()"

# We first need to create the function. The function commands need to be written within curly brackets "{}"
# Highlight the two lines that follow and run them with Ctrl-Enter

MyWorld <- function() # No parameters/arguments
{print("This is my R World!!")}

# Then run the function as needed
MyWorld()

# Once a function is created and executed, it is available for use until you terminate the R session

# Now let's write a function with parameters/arguments:

AnyonesWorld <- function(who) # "who" is the parameter
{print(paste("This is ", who, "'s R World", sep=""))}  

# Now execute the function but enter who's world it is (change the name)

AnyonesWorld("Alberto") # Requires that we enter an argument

# Functions are useful to return calculated values, for example to return the squared value of a number x, we make x the parameter and then specify what we want to return, i.e., it's squared value

SquareMe <- function(x) # Whatever we enter in SquareMe(x) will be squared
{return(x^2)}

# Run the function definition above and then see how it works:
SquareMe(4)

# Note: the function above is a simple illustration in which       the function fits in one line. Typically, functions span many lines, in which case it is customary, for readability, to put the open and closing curly brackets in separate lines, For example, let's create a function: that takes a value, then adds 2 and then squares this sum

# x is a parameter we are passing to the function:

SquareMePlus2 <- function(x) 
{
  x=x+2
  return(x^2)
  } 
SquareMePlus2(4) # i.e., (4+2)^2 = 36


### R 2.10 Program Control: If'S 

# Most R scripts for this course will simply have a stack of commands, which you can execute in full, one line at a time, or a group of lines at a time. However, there will be times when you want to execute some lines only if some condition is met, or there may be times when you want to execute some lines multiple times in a loop. This is called "conditional logic" in software programming. In such cases, you will need to understad how to control the program. There are several types of program controls, but the most common ones are: if's and loops.

# if/else 

# Example, change the value of MyValue to see how the if control works

# Notes: (1) the "if" condition must be inside the curly brackets
#        (2) the "else" condition too;
#            IMPORTANT: the "else" statement must be in the same 
#            line as the first } or the command will fail

MyValue=2
if (MyValue>10) 
  {print("Your number is large")} else
  {print("Your number is small")}

# The "ifelse()" function works like if in Excel

MyValue=5
ifelse(MyValue > 10, "Large Number", "Small Number")

MyValue <- c(5, 10, 15, 20) # Works with vectors too
ifelse(MyValue > 10, "Large Number", "Small Number")

# This is a more complete example that gets several input values for a loan application, does a number of calculations and then makes a decline/approve decision recommendation. 

# Input data:

CarPrice = 30000
DownPayment = 2000
LoanYears = 5
AnnualInterest = 0.04 # i.e., 4%
AnnualIncome = 60000
MonthlyObligations = 2300

# Calculations

LoanAmount = CarPrice-DownPayment
LoanMonths = LoanYears*12
MonthlyInterest = AnnualInterest/12
MonthlyPmt = LoanAmount*MonthlyInterest/(1-(1/(1+MonthlyInterest)^LoanMonths))
MonthlyIncome = AnnualIncome/12
DisposableIncome = MonthlyIncome-MonthlyObligations
PmtToDisposableRatio = MonthlyPmt/DisposableIncome

# Displaying results

print(sprintf("Your monthly payment is %s", MonthlyPmt))
print(sprintf("Your disposable income is %s", DisposableIncome))
print(sprintf("Your monthly payment to disposable income ratio is %s", PmtToDisposableRatio))

if (PmtToDisposableRatio>0.2) # i.e., loan payment is more than 20% if income
  {print("Your loan application has been declined")} else
  {print("Your loan application has been approved")}

# Note: The script commands are comingled with the results 
#       in the console. This is difficult to avoid in R or 
#       R Studio, but it is easily resolved with Markdown, 
#       which we will see shortly

# It is often helpful to break the lines for readability. This works the same:

if (PmtToDisposableRatio>0.2) # i.e., loan payment is more than 20% if income
  {print("Your loan application has been declined")
  } else
  {print("Your loan application has been approved")}


### R 2.11 Program Control: Loops

# Loops allow you to perform a number of commands several time until some condition is met to terminate the loop. Typically, there is an index or value that changes in each loop. For example, we may want to perform a bunch of calculations on the first 10 rows of a table.

# There are various types of loops, but the most common are "for" and "while" loops. "For" loops performs a loop "for" each of the values specified. When the values end the loop ends. In contrast "while" loops will continue to loop "while" a certain condition is met. I illustrate both below.

# CAUTION: Improperly written loops are one of the most common sources of software malfunction. In particular, loops that do not specify the "for" or "while" condition correctly may cause a program to go into an infinite loop that never terminates. You ever wonder why a program spins and spins some times. Most likely, it is an infinite loop somewhere in the code.

# Example of a "for" loop

# In the first loop, i will take the value of 1. In the second loop it will take the value of 2, etc. In the last loop, i will take a value of 10 and this will be the last loop.

for (i in 1:10) {
  print(paste("The number is", i)) # The paste function concatenates strings
}

# If you want i to increment by more than 1, for example 2, try:

for (i in seq(1,10,2)) {
  print(paste("The number is", i)) # The paste function concatenates strings
}

# Example of a "while" loop -- the loop runs while the condition is true While loops generally require initializing a value that will be checked in the while condition, in this case the value is i

i = 1 # This is like a counter, which we initialize to 1
while (i <= 10) { 
  # The paste function concatenates strings
  print(paste("The number is", i)) 
  # we need to increment i in each loop or you will have an endless loop
  i <- i+1 
}

# Note: omitting the counter increment command "i <- i+1" would be an example of a software error that would cause an infinite loop. Can you see why?


### R 2.12 Simple Statistics with R


## Working with Data

# Let's first open a data file
install.packages("ggplot2") # If not installed already
require(ggplot2) # Contains the "diamonds" data set
# This data set contains attributes for several diamonds
data(diamonds) 

# Note: certain R commands and models require that a data set be active in memory, which we accomplish with the data() function. Also, note that the diamonds data table is contained in the ggplot2 package.

head(diamonds)

# Let's do an SQL-like aggregate
aggregate(price~cut,diamonds,mean)
# Works like SQL command: SELECT Avg(Price) FROM diamonds GROUP BY cut

# To group by more than one attribute
aggregate(price~cut+color,diamonds,mean)

# To aggregate more than one column
aggregate(cbind(price, carat)~cut,diamonds,mean) 

# Note the cbind function binds columns together. To bind rows use rbind


## Simple Graphics

# R Base Package:

# Plots
boxplot(diamonds$carat) # Boxplot of a single variable
plot(diamonds$carat, diamonds$price) # Scatterplot of 2 variables

# Histograms
hist(diamonds$carat) # Histogram of 1 variable
hist(diamonds$carat, main="Carat Histogram", xlab="Carats") # w/labels
hist(diamonds$price, main="Diamond Price", xlab="Price")

# qqplots are popular for detecting non-normality in the data -- if the dots do not align with the straight line the data deviates from normality:

qqnorm(diamonds$price)
qqline(diamonds$price)

# The data is not very normal. Maybe loging the data will help:
hist(log(diamonds$price), main="Diamond Price", xlab="Price")
qqnorm(log(diamonds$price))
qqline(log(diamonds$price))
# Yes it helps align the dots to the line

# Graphics packages -- ggplot2 and lattice are popular ones:

# Note, the ggplot2 package installation will automatically install the lattice package

install.packages("ggplot2") # If not already installed
require(ggplot2) # Activate when needed

# Same histogram, different syntax and format:
ggplot(data=diamonds) + geom_histogram(aes(x = carat))
# Note: the ggplot syntax takes a bit to get used to it

# We can save graphs in objects:

# Basic definition, no graph yet:
g <- ggplot(diamonds, aes(x=carat, y=price)) 

# Then add properties, e.g., type of graph, and display it later:
g + geom_point()

# Then change the properties if you wish, e.g., add color
g + geom_point(aes(color = color))
g + geom_point(aes(color = color)) + facet_wrap(~color)
g + geom_point(aes(color = color)) + facet_grid(cut~color)

## Simple Statistics

# Generating a random sample of 50 observations from a normal distribution

x=rnorm(50) 
x # Check out the sample

# Generating samples and sub-samples

full.data=1000
train=sample(1:full.data, 100)
train
train=sample(1:full.data, 0.75*sample)
train

# Random sample of 100 numbers with replacement
X <- sample(1:1000, size=100, replace=TRUE)
# replace=true means that values in the sample can repeat

X # Check it out

mean(x) # Sample mean
median(x) # Sample median
max(x) # Maximum value in the sample
min(x) # Minimum value in the sample
sd(x) # Sample standard deviation
var(x) # Sample variance
summary(x) # Sample summary statistics
hist(x) # Histogram of sample values


### R 2.13 R Markdown

# R Markdown is a companion program to R Studio, which allows you to create HTML, PDF and Word documents on the fly, which cand include R code and R output. R Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. See:

browseURL("http://rmarkdown.rstudio.com/")
  
# Before you can use R Markdown you need to install and load the "rmarkdown" package

install.packages("rmarkdown") # If not installed already
require(rmarkdown)

# Once installed, you can create R Markdown files with File -> New File -> R Markdown -> Document. Enter the document title and author and select HTML (R Markdown can create HTML, Word and PDF files; we will be working with HTML files only)

# NOTE: You will be required to turn in all your homework and project work as an HTML file generated by R Markdown. This is a great way to create reports directly from your R analysis.

# ADVICE: You should prepare your work in an R script, because it is easier to work with and debug your R code, and run selected command lines as you test your code. R Markdown is not very helpful to write,  test and debug R code because, unlike R, you need to run the entire markdown script, and cannot run portions of the script. In addition, it does not have the nice color coding that R scripts have. Once you are sure your R code is working fine in your R script, copy/paste it to an R Markdown file and place it between a starting line that has

# ```{R}
# The R code goes here
# ```

# Note: the quotes above are not regular quotes ' but "angled" quotes ` which are at the top left of the keyboard.

# For more details on using R Markdown see 
browseURL("http://rmarkdown.rstudio.com")

# Some quick help with R Markdown:
browseURL("http://rmarkdown.rstudio.com/authoring_basics.html")

# A quick cheatsheet for R Markdown, see:
browseURL("https://www.rstudio.com/wp-content/uploads/2015/02/rmarkdown-cheatsheet.pdf")

# R Markdown files are stored in files with an extension .Rmd Open the ITEC621Markdown.Rmd file and continue this example there

### R 2.14 Shiny 

# Like R Markdown, Shiny is another R Studio product, which allows you to create interactive web applications. We will not cover Shiny in this course and you will not be required to submit your work in Shiny. But you are more than welcome to explore Shiny on your own and submit your work using Shiny. See:

browseURL("https://www.rstudio.com/products/shiny/")


### R 2.15 ISLR Chapter 2 Lab: Introduction to R

# I only provide light commentary on the ISLR textbook introduction to R because this is well explained in the textbook and the author's lectures online. Please note that some of the material in this section is already explained above.

# Basic Commands

# Please complete this R Lab section on your own, but review this video by the ISLR book authors before you continue:

browseURL("https://www.youtube.com/watch?v=jwBgGS_4RQA&list=PL5-da3qGB5IDvuFPNoSqheihPOQNJpzyy")

# Creating simple vectors with the "Concatenate" c() function. 

x <- c(1,3,2,5)
x
x = c(1,6,2)
x
y = c(1,4,3)

# Find how many elements there are in each vector

length(x)
length(y)

# Do math on the vectors
x+y

# Note: since x and y have the same length, each element of x can be added to the corresponding element of y with a simple sum command

ls() # List Objects functions

# This function returns a vector of character strings with the names of all the objects in the work environment. The objects() function is similar.

objects() # List Objects functions

rm(x,y) # To remove variables from

rm(list=ls()) # Removes all objects from the environment

# Matrices

?matrix # Documentation on matrices
x=matrix(data=c(1,2,3,4), nrow=2, ncol=2) # Create a quick matrix
x=matrix(c(1,2,3,4),2,2) # Same thing
x

# Indexing

x[1,2] # Element in row 1 and column 2
sqrt(x) # Square root of each element of x
x^2 # Square of each element of x

# Matrix of a sequence of elements from 1 to 2

x=matrix(seq(1,12),4,3) 
x # Check it out
x[3:4,2:3] # Submatrix with only rows 2 and 4, and columns 2 and 3
x[,2:3] # All rows (the ",") and columns 2 and 3
x[,1] # All rows, first column only -- R converts single columns to a vecto
x[,1, drop=FALSE] # To list the vector in its original column form
dim(x) # List the dimension of a matrix

# Simple Statistics

# Random sample of 50 observations from a normal distribution
x=rnorm(50) 
x # Check out the sample

y=rnorm(50,mean=30,sd=0.1) # Same thing, but with a mean of 30 and SD=0.1
y # Check it out
cor(x,y) # Correlation between the two variables

# Graphics

x=rnorm(100) # Random sample
y=rnorm(100) # Random sample
plot(x,y) # Plot them
# Then add some labels
plot(x,y,xlab="this is the x-axis",ylab="this is the y-axis",main="Plot of X vs Y")

# Sending your output to a PDF file

# If you want to output your graphics to a PDF, first ensure you moved to your working directory with setwd(), so that you know where the PDF will be created:

setwd("C:/AU/Courses/ITEC621/R")

# Then enter:

pdf("Figure.pdf") # Or any file name you wish

# The command above will open a PDF file. From this point forward the graphics won't be displayed in the plot viewer, but will be piped to the PDF file. You can run many graphics. 

plot(x,y,col="green")
# When you are done, enter:
dev.off() # to generate the PDF file

# Partition graphics display panel

# To partition the plot panel into multiple parts enter:

par(mfrow=c(2,2)) # Partitions the plot into a 2x2 panel, e.g.:

plot(x,y)
hist(x)
hist(y)
boxplot(x)

# Indexing Data

A=matrix(1:16,4,4) # Create 4x4 matrix
A
A[2,3]
A[c(1,3),c(2,4)]
A[1:3,2:4]
A[1:2,] # All columns for rows 1 and 2
A[,1:2] # All rows for columns 1 and 2
A[1,] # Single columns or single rows are converted to vectors
A[-c(1,3),] # Remove rows 1 and 3
A[-c(1,3),-c(1,3,4)] # Remove rows 1,3 and columns 1,3,4
dim(A) # Matrix dimension

# Loading Data

Auto=read.table("Auto.data") # Reading an external R data source
head(Auto) # Display first few rows
fix(Auto) # View and edit data if needed
Auto=read.table("Auto.data",header=T,na.strings="?")
fix(Auto)

# Notice that the above data read puts the variable names in the first row and then names the columns v1, v2, etc. This is not really what we want. We want the variable names as column headers. Try this:

Auto=read.csv("Auto.csv",header=T,na.strings="?")
fix(Auto) # Check it out
dim(Auto) # See the number or rows and columns
Auto[1:4,] # See all columns of rows 1 to 4

# This command removes observations with missing data (i.e., NA's).
# IMPORTANT: some statistical procedures require that you remove missing data, so remember this:

Auto=na.omit(Auto) 
dim(Auto) # Notice that 5 rows were removed

names(Auto) # Read the variable names

# Additional Graphical and Numerical Summaries

# Notice that this plot command does not work
plot(cylinders, mpg) 

# This one does -- Table$Column format
plot(Auto$cylinders, Auto$mpg)

# But if you pre-load the data into memory:
attach(Auto) 

# Then this command will work fine
plot(cylinders, mpg)

# That is, in many libraries that work with data, you will either need to "attach" the data, specify the data source (e.g.,
# data="Auto") or specify the datasource$column.

# Object Class

# All objects have a class. This class enables or restricts what you can do with that object. Certain functions only work with certain classes of objects, so it is important to know an object's class. To display an object's class enter: 

class(cylinders) # Integer
class(mpg) # Numeric

# Object Mode

# All objects have a "storage" mode. This is NOT the class of object, but simply how the object contents are stored.

mode(cylinders) # Numeric

# So the cylinders object is of "Integer" class and "Numeric" mode. It is not too critical that you know the difference between class and mode. But it is important to know this when you are reading the documentation of an object or function because functions often only work with specific object classes or modes. Other functions work differently for different objects. For example, take the summary() funiction, which provides key information about an object:

fit.model <- lm(mpg~cylinders+horsepower, data=Auto)

summary(mpg) # Summary data of a vector object
summary(cylinders) # Summary data of a data frame object
summary(fit.model) # Summary data of a linear model object

# Numeric variables with fixed values don't plot well. It is better to conver the variable to factor first:

cylinders=as.factor(cylinders)
head(Auto)
class(cylinders) # Now the variable is a factor
plot(cylinders, mpg) # The plot now displays box plots
plot(cylinders, mpg, col="red") # Let's add some color
plot(cylinders, mpg, col="red", varwidth=T) # Let's change the width
plot(cylinders, mpg, col="red", varwidth=T,horizontal=T) # Change orientaion
# Let's add some labels
plot(cylinders, mpg, col="red", varwidth=T, xlab="cylinders", ylab="MPG")
hist(mpg) # A histogram
hist(mpg,col=2) # With color
hist(mpg,col=2,breaks=15) # Change the number of value breaks
pairs(Auto) # Summary plot of all pairs of variables
# Or just a few variables
pairs(~ mpg + displacement + horsepower + weight + acceleration, Auto)
plot(horsepower,mpg) # Or just 2 variables
summary(Auto) # Summarize all basic statistics for the Auto data file
summary(mpg) # Display basic statistics for the mpg variable only


#### 3. REGRESSION REFRESHER ####


## Correlation

# Let's look at the diamonds data in the ggplot package:

install.packages("ggplot2") # If not already installed
require(ggplot2)
data(diamonds)
head(diamonds)

# Some functions like the cor() function, which displays a correlation matrix require the data frame to be converted into matrix form You can specify the variables you want to include this way:

MyDiamondData <- as.matrix(data.frame(diamonds$price,diamonds$carat, diamonds$depth))
head(MyDiamondData)

# Or you can just specify the column numbers this way, all rows, columns 7, 1 and 5

MyDiamondData <- as.matrix(data.frame(diamonds[, c(7,1,5)]))
head(MyDiamondData)

cor(MyDiamondData, use="complete.obs") # Discard rows with incomplete data
cor(MyDiamondData, use="pairwise.complete.obs") # Discard pairs without data

# Unfortunately the cor() function only gives correlations, not p-values. For p-values, rcorr() function in the "Hmisc" package does the job It returns the #observations plus 2 matrices -> correlation and p-values

install.packages("Hmisc") # Do this once only to install the package
require(Hmisc) # Note the H is upper case
rcorr(MyDiamondData, type="pearson")

# Note: rcorr sometimes returns an error, like:
#    (list) object cannot be coerced to type 'double'
#    If this happens, convert the data file to a matrix 
#    (rcorr was written to work with matrices):

rcorr(as.matrix(MyDiamondData), type="pearson")

# You can display correlations (above the diagonal), distributions (diagonal) and scatterplots (below the diagonal) all together with GGally and ggpairs():

install.packages("GGally") # Package with useful graphics displays
require(GGally)

ggpairs(MyDiamondData) # It can be a bit slow
# WARNING -- the ggpairs() can take a long time to run
ggpairs(diamonds) # Works with categorical data too
# The pairs() function from the base graphics package works well too

pairs(MyDiamondData) # Summary plot of all pairs of variables
pairs(diamonds) # With the full data set (takes a long time)

# Example with the mtcars data:

head(mtcars)
rcorr(as.matrix(mtcars))
ggpairs(mtcars) # Takes a bit of time
pairs(mtcars) # A bit quicker, but not as nice

# Some visual correlation functions

install.packages("corrplot") # If not installed already
library(corrplot) # Library for correlation plots
mtCorr <- cor(mtcars) # Store the correlation object
corrplot(mtCorr, method = "circle") # Then plot it
corrplot(mtCorr, method = "ellipse") # Slanted left/right for +/- 
corrplot(mtCorr, method = "number") # Show correlation

# Order variables clustered by correlation values
# and omit the diagonal
corrplot(mtCorr, method = "number", 
         order = "hclust", diag = FALSE,
         title = "MT Cars Correlation Matrix")
?corrplot # See all the methods

# Changing the annoying scientific notation (the "scipen" keyword stands for "scientific notation penalty"). 

options(scipen="4") # To limit displays in scientific notation
# i.e., if a value has more than 4 zeros after the decimal point it will be printed in scientific notation. 

## ANOVA

# The "aov()" function does ANOVA testing for fitted models, which is useful to compare a continuous variable (e.g., price) across various categories (e.g., clarity, color). In a nutshell, it tests whether the variance across groups is larger than within groups. The larger the F statistic, the more confidence we have that the variance across groups is significant

aov(price~clarity, data=diamonds) # Run the ANOVA on a single factor

# The "anova()" function is different and it is useful for comparing models:

fit1 = lm(price~carat, data=diamonds)
fit2 = lm(price~carat+clarity, data=diamonds)
anova(fit1, fit2)
# p-value is significant ->
# fit2 has more predictive power than fit1

summary(aov(price~clarity, data=diamonds)) # Show the ANOVA results
MyAOV <- aov(price~clarity, data=diamonds) # Store results in an object
summary(MyAOV) # Show the ANOVA object result summary
summary(aov(price~clarity+color, data=diamonds)) # ANOVA on 2 factors
summary(aov(price~clarity+color+cut, data=diamonds)) # On 3 factors

# Let's visualize the differences

boxplot(price~clarity, data=diamonds)
boxplot(price~color, data=diamonds)
boxplot(price~cut, data=diamonds)


### ISLR Chapter 3 Lab: Linear Regression

# Most of the material covered on regression in this course is covered in the ISLR book. This section of the script contain most of the code in the ISLR book, but I have added additional code (for example, to  compute collinearity statistics) and a substantial amount of comments.

## Simple Linear Regression

options(scipen = "4") # Limit the use of scientific notation

install.packages(c("MASS", "ISLR")) # If not installed already

# Modern Applied Statistics with S {MASS}
library(MASS) # Contains the Boston data set
library(ISLR) # Package companion to the textbook

# The Boston data set contains data for the Boston area housing market

?Boston # Let's check the variables in the data file
names(Boston) # View the data names
head(Boston) # View a few records

# Simple regression model for Boston housing data for housing values as a function of % low status population

lm.fit=lm(medv~lstat,data=Boston) # Using the fixed data set Boston.f
attach(Boston) # Or you can attach the data first
lm.fit=lm(medv~lstat) # And then run the regression
lm.fit # Display the regression output object
summary(lm.fit) # Display the summary of results
names(lm.fit) # List all the properties of the lm.fit object
coef(lm.fit) # Coefficients only
confint(lm.fit) # Confidence intervals only

# Predict medv for 3 values of lstat

# Get predicted values for all data points with confidence intervals
predict(lm.fit, interval="confidence") 
# Get predicted values for 3 new data points
predict(lm.fit, data.frame(lstat=(c(5,10,15))), interval="confidence")
predict(lm.fit, data.frame(lstat=(c(5,10,15))), interval="prediction")

# Note: the "confidence" interval is range of values representing a 95% probability (by default, but this can be changed) that the our model will predict values within that interval. If the interval does not include 0, then the coefficients are significant at the p < 0.5 level. In contrast, the "prediction" interval gives us the probability that an "actual prediction" will fall in the interval range. Generally, prediction intervals are larger that confidence intervals because they need to account for the variance in Y.

# Plot the data

plot(lstat,medv) # Plot the data
abline(lm.fit) # Draw the regression line on the plot
abline(lm.fit,lwd=3) # Change the line weight to 3
abline(lm.fit,lwd=3,col="red") # Change the line's color and weight

# Change other line attributes

plot(lstat,medv,col="red") 
plot(lstat,medv,pch=20)
plot(lstat,medv,pch="+")
plot(1:20,1:20,pch=1:20) # This is just a simple line illustration
plot(lm.fit) # Display 4 important regression diagnostic plots
par(mfrow=c(2,2)) # Divide the output into a 2x2 frame by row
par(mfcol=c(2,2)) # Divide the output into a 2x2 frame by column
plot(lm.fit) # And display the plots again in the new frames

plot(predict(lm.fit), residuals(lm.fit)) # Plot specific diagrams

# Quick simple regression example

lm.simple=lm(medv~rm, data=Boston)
summary(lm.simple)
par(mfrow=c(1,1)) # Reset screen display to a single graph
plot(rm, medv, main = "Regression for Boston House Values", 
     xlab = "No Rooms", 
     ylab = "Median Value $000")
abline(lm.simple, col="red" )


## Multiple Linear Regression

library(MASS) # Needed for the Boston data set

# Multiple regression model with 3 variables on the Boston housing data

lm.fit=lm(medv~lstat+age,data=Boston) 
summary(lm.fit) # Display regression output summary

# Run multiple regression on all available variables

lm.fit=lm(medv~.,data=Boston) 
summary(lm.fit) # Review the results
?summary.lm # To see which specific summary data can be displayed

# For example, to review the results with correlation matrix

summary(lm.fit, correlation = TRUE) 
summary(lm.fit)$r.squared # Display the R-squared only

# Other data available in the linear model (lm) object

coef(lm.fit) # Display only the regression coefficients
confint(lm.fit) # Display only the confidence intervals
plot(lm.fit) # 4 key diagnostic plots

# For a correlation matrix with p-values we need rcorr{Hmisc}

install.packages("Hmisc")
require(Hmisc)
# Data sometimes needs to be converted to a matrix for rcorr()
rcorr(as.matrix(Boston), type="pearson") 


## Multicollinearity

# Condition Index (CI): general collinearity statistic for the full model
#    CI<30 -- collinearity is not a concern
#    30<CI<50 -- Collinearity may be a concern, but may be OK
#    50<CI -- Collinearity is severe -- must fix

# Note: we will see this later with machine learning, but when collinearity is severe, some coefficients may still be highly significant and you may get a false sense of confidence that your results are OK. But the problem is that the standard errors of the coefficients are very high and these coefficients become unstable. With severe collinearity, if you drop a few variables the coefficiens will change substantially. We will learn how to test for this with machine learning and cross validation

install.packages("perturb") # If not installed already
library(perturb) # Contains the colldiag() function to compute the CI

# Run multiple regression on all available variables
lm.fit=lm(medv~.,data=Boston) 
# The colldiag(){perturb} function provides CI collinearity diagnostics
collin.diag = colldiag(mod=lm.fit, scale=FALSE, center=FALSE, 
                       add.intercept=TRUE)
collin.diag # Check out the severe collinearity

# Sometimes standardized regressions reduce collinearity: use scale=TRUE or center=TRUE view collinearity diagnostics with standardized and/or centered variables

collin.diag = colldiag(mod=lm.fit, scale=TRUE, center=FALSE, 
                       add.intercept=TRUE)
collin.diag # Check out the high but less severe collinearity

# If the CI is high but the VIF's (see below) are not so high, then the intercept may be the culprit. Some times the intercept is highly collinear with a variable that stays relatively flat with respect to Y. If this is the case, you can center variables or standardize. Check the condition index when the intercept is removed:

collin.diag = colldiag(mod = lm.fit, scale = TRUE, center = FALSE, 
                       add.intercept = FALSE)
collin.diag # Not so severe any more

# Variance Inflation Factors (VIF): each variable's contribution to multicollinearity

install.packages("car") # # If not installed alread
# {car} is the "Companion to Applied Regression" package
library(car) # Contains the vif() function

# Once you determine the collinearity is a problem, as indicated by the CI the next step is to evaluate the VIF for each variable, to see which variable contributes the most. Think of the VIF of a variable as the R-square you would get by regressing that predictor on all other predictor. But, instead of yielding a 0-1 value (like the R-Square) the VIF converts this R-Square into a formula that provides a factor of how much the standard error is amplified due to its contribution to multicollinearity:

# VIF<5 -- No concern, little or no contribution to collinearity
# 5<VIF<10 -- Some concern, but tolerable
# 10<VIF -- The variable contributes significantly to collinearity
#           The coefficients have a high standard error and are 
#           unstable and unreliable.

# Print variance inflation factors with the vif(){car} function

vif(lm.fit) 

# To model all predictors (.) except age (-):

lm.fit1=lm(medv~.-age,data=Boston) 
summary(lm.fit1)

# The update function allows you to add or remove variables from the model

lm.fit1=update(lm.fit, ~.-age) 
summary(lm.fit1)
vif(lm.fit1)


## Weighted Least Squares (WLS) Regression 

# This material is not in the ISLR textbook

library(MASS) # To read the Boston housing market data

lm.formula <- medv~. 

# If you plan to use the regression formula in various parts of the script, it helps to store the the formula in an object. This is a regression formula for median house values on all other variables

lm.fit=lm(lm.formula,data=Boston) # Fit the model using the formula
summary(lm.fit) # Take note of the R-square

# If you suspect that your model suffers from heteroscedasticity (i.e., uneven error variance), you should inspect the residual plot against perdicted values and also test for heteroscedasticity with the Breush-Pagan bptest{lmtest} test. If the p-value is significant this means that the errors squared are highly correlated with the predicted values, which means that the errors increase or decrease systematically.

# To test for heteroscedasticity

install.packages("lmtest") # If not installed already
library(lmtest) # This package has several tests for lm objects
# Perform a Breusch-Pagan test for Heteroscedasticity
bptest(lm.formula, data=Boston) 
# The p-value is highly significant, so heteroscedasticity is present
plot(lm.fit) # See the residual plot

# Heteroskedasticity does not affect bias of the estimators, but the model is no longer BLUE. That is, it is not the most efficient (i.e., least variance) estimator. To correct for heteroskedasticity we use WLS, which is more efficent.

# If you suspect one predictor (e.g., age) may correlate with the errors you can use the inverse of that variable squared to weight the MSE by that variable

lm.fit.wls1=lm(lm.formula,data=Boston, weights=1/age^2)
summary(lm.fit.wls1) # Slight improvement in R-squared

# If you suspect that it is the dependent variable that is causing the errors to grow then you can use its square to weight the MSE.

lm.fit.wls2=lm(lm.formula,data=Boston, weights=1/medv^2)
summary(lm.fit.wls2) # Slight improvement in R-squared

# The most general, popular and efficient (i.e., lowest variance) WLS method involves 2 steps. Since it is the magnitude and systematic variability of the errors that causes heteroskedasticity, rather than the variables themselves, we can use the inverse of the errors squared as weights. As it turns out, this produces the most efficient WLS when heteroscedasticity is present. 

# Here are the 2 steps to do this:

# (1) Fit a plain OLS model on the data (which we already did above 
#     with lm.fit)

lm.fit=lm(lm.formula,data=Boston) # but we repeat here for convenience
summary(lm.fit)

# (2) Use the errors of the plain OLS fit to do the weighting for the 
#     WLS model.

lm.fit.wls3=lm(lm.formula,data=Boston, weights=1/lm.fit$residuals^2)
summary(lm.fit.wls3) # Slight improvement in R-squared

# Notice that the R-squared are almost pefectly close to 1. In fact, R-squared is no longer meaningful in WLS because it is no longer the proportion of explained variance, but the proportion of weighted variance, which is not very meaningful

# ASIDE

# There are many methods available for least sum of "weighted" least squares. The WLS method described above is pretty standard. But there are other methods and various weighting methods. Iterative Re-Weighted Least Squares (IRLS) is another popular method to compute "robust" estimators when heteroscedasticity is present.

# The MASS library has a residual linear model function rlm(), which does OLS with robust residuals. This method is equivalent to WLS, with one difference. Because the weights are calculated from residuals, but the final residuals are dependent on these weights, the IRLS solves this issue by itereating the model several times, calculating new residuals each time, re-weighting the model, and so on -- i.e., running WLS multiple times in iterations until the residuals don't change any more (the model converges). 

# For practical purposes the WLS method explained above is sufficient. However, IRLS is very effective at dealing with "valid outliers" which are outliers that pull the regression line in one direction or another, but if the data is valid you are not supposed to remove this outlier from the data. The rlm() function uses various weighting methods. Let's run the model above with rlm()

rlm.fit=rlm(lm.formula,data=Boston)
summary(rlm.fit) # Take a look 


## Generalized Linear Methods (GLM)

# The glm() function works just like the linear models function lm(), except that it can be used to fit models for a wider range of distributions, not just normal. For example, it is used to fit logistic regressions. First, let's read the South Africa heart disease data set from the authors' data site:

heart <- read.table(
    "http://statweb.stanford.edu/~tibs/ElemStatLearn/datasets/SAheart.data",
    sep=",",head=T,row.names=1)

# Note: the ISLR text authors have tons of data sets available at:
browseURL("http://statweb.stanford.edu/~tibs/ElemStatLearn/datasets/")
# To read this data, use the command above but change the respective 
# .data file name for the file you are interested.

# Now let's fit a logistic regression model (more on this later)

heart.fit = glm(chd ~ .,data=heart,family=binomial(link="logit"))
summary(heart.fit)

# Notice that the syntax is identical to the lm() function, except that we need to speciy the model family and link function 
# (family=binomial(link="logit"))

# You can also fit OLS regression models with either lm() or glm()

library(MASS) # Needed for the Boston data set
lm.fit=lm(medv~lstat+age,data=Boston) # OLS using lm()
summary(lm.fit) # Check it out

# Now try OLS with glm() using family=gaussian(link="identity")
glm.fit = glm(medv~lstat+age,data=Boston,
              family=gaussian(link="identity"))
summary(glm.fit) # Notice that the results are identical


#### 4. DATA PRE-PROCESSING ####


# Experts state that about 80% of an analytics project goes into data work that needs to be done before analysis can be done with that data. This is generally referred to as data "pre-processing". There are many reasons to do pre-processing and various types of pre-processing that can be done. But these can be generally classified into two broad categories: (1) data quality; and (2) data transformactions. 

# Data quality pre-processing involves things like dealing with things like: missing data; incorrect or inconsistent data; inappropriate data formats or spelling/punctuation issues, etc. A lot of the data quality work in data preprocessing is often done with the analytical tools, as they all have data evaluations and manipulation tools. But the most effective ways of working with data is the realm of "database" and "big data" fields, and it is a key skill in the "data science" profession.

# We will cover "data transformations" in this section. These have to do with data manipulations that are done to: 

# (1) comply with a particular model assumption (e.g., lagged models in forecasting; weighted regression models to correct for heteroscedasticity, etc.); 

# (2) improve the predictive accuracy of a model (e.g., logs, Box-Cox, etc.); and 

# (3) convert categorical and other non-quantitative data into quantitative data that can be used for statistical analysis 
# (e.g., categorical to dummy variables, word counts, etc.)

# While it is often necessary or desirable to transform predictor variables, many regression models are robust when it comes to predictor variables (e.g., predictor variables often don't need to be normally distributed). In contrast, dependent variables must be transformed to the correct types of values for the particular model. For, example, if the dependent variable is binary or categorical, you must transform the outcome variable and use a logistic, discriminant or other classification models. Good news: R makes this very easy.


## Transformation 1: Categorical To Dummy Variable Predictors

# Qualitative variables (e.g., states, categories, etc.) are not quantitative and they cannot be used as is for statistical analysis. Qualitative data has to be converted into some form of quantitative data. If the dependent variable is qualitative then you need to employ classification methods like logistic regression. When the independent variables are qualitative you can use the data with some conversions. R makes this very easy.

# The most common way to deal with qualitative variables is to create dummy variables. For example, if you have 50 states and you want to analyze whether the state where the house is located has an effect on the house value, you can create 50 dummy variables, one for each state. For example, the variable MD will take a value of 1 if the state is Maryland and 0 otherwise. 

# Each state dummy variable would be constructed in a similar manner. You would then leave one of these variables out of the model which will be the "baseline" or "reference" variable (e.g., MD). You would then include in the model the remaining 49 state dummy variables. The intercept coefficient of this model gives you the effect of the baseline or reference variable (e.g., the median housing value prediction for the state of MD). Each of the other 49 state coefficients will give you the price difference for that state, relative to the reference variable (i.e., MD).

# There are two ways to do this: you create the dummy variables yourself or you let R do it for you (with less control). Let's use the Carseats data set:

library(ISLR) # Contains the "Carseats" data set
data(Carseats) # Load the Carseats data set with qualitative variables
fix(Carseats) # Only if you want to edit the data
names(Carseats) # Briefly inspect the variable names
?Carseats # See the description for ShelveLoc

# In the model below, qualitative variables will be converted into multiple dummy variables. The qualitative variable ShelveLoc has 3 values: Bad, Medium and Good. If we include ShelveLoc in the model R will convert this into only 2 variables: ShelveLocGood and ShelveLocMedium. R automatically names these variables with the original variable name with the respective qualitative value appended to the variable name. R also drops one of the three dummy variables, automatically, which is the first one alphabetically, or ShelveLocBad in this case.  

# The "Dummy Variable Trap"

# If you have a group of dummy variables, which are mutually exclusive, then one of these variables is fully dependent on the others. For example if all the 49 state dummy variables have a value of 1, then the MD variable must be 1 (i.e., if it is not one of the 49 included states, it must be the excluded states). If you were to include all 50 variables, any one of these variables will be fully dependent on the other 49. This totally violates the OLS assumption of variable independence and the OLS is literally unsolvable because you would have perfect multicollinearity. This problem is commonly referred to as the "Dummy Variable Trap". Older statistical software would simply hang or give you an error (the standard errors are infinite). But modern statistical software detect this linear dependency and automatically exclude one of the variables to avoid the dummy variable trap.

levels(Carseats$ShelveLoc) # Check the unique levels of ShelveLoc
lm.fit=lm(Sales~.,data=Carseats)
summary(lm.fit)

# Notice that the qualitative variable ShelveLoc was automatically converted into dummy variables. Also notice that ShelveLocBad was excluded from the model and only ShelveLocMedium and ShelveLocGood were included. The intercept represents the average sales for ShalveLocBad, when all other variables are 0. ShelveLocMedium shows how much the price changes when you go from a bad shelf location to a medium shelf location/

# To see the categorical to dummy variable conversion:

attach(Carseats) # To load the file into memory
contrasts(ShelveLoc) # Shows how the dummy variables were coded

# It is pretty obvious from this contrast table that "Bad" is the baseline variable omitted.

# Re-Leveling

# If you want to change the baseline or reference dummy variable you can use the relevel() function to pick the reference level variable to exclude. The value you enter in ref has to match an existing level in the data (case sensitive). For example, in the above model "Bad" is the ShelveLoc reverence level chosen by R by default because it is the first one alphabetically. If you want to use "Good" as the reference level, do the following:

Carseats$ShelveLoc <- relevel(Carseats$ShelveLoc, ref="Good")
summary(lm(Sales~.,data=Carseats)) # Check it out


## Transformation 2: Polynomials

# We will cover polynomial models in more depth later on, but we discuss polynomials here in the context of variable transformations.

# Include a quadratic term in the model

lm.fit2=lm(medv~lstat+I(lstat^2), data=Boston) 

# Note the use of the I() function, which is the "as iS" function. ^2 in R has other interpretations, so I(lstat^2) is needed to tell R to treat the ^2 as a square

summary(lm.fit2)
lm.fit=lm(medv~lstat, data=Boston) # Model withouth quadratic term
summary(lm.fit)

# Note that the R-squared for the quadratic model is larger than the one for the linear model. However, to evaluate if the difference is significant we need an ANOVA test (or F-test, which is similar)

anova(lm.fit,lm.fit2) # Tests if quadratic model is superior

# The F-statistic is quite high and the p-value is <0.001, so, yes the quadratic model is statistically superior and provides
# additional explanatory power

par(mfrow=c(2,2)) # Lets split the screen into 2 x 2 frame
plot(lm.fit2) # Display diagnostic plots

# Polynomial Terms -- the "poly()" function

# You can use the poly() function to model higher polynomials (more on this later). For example, this will add quadratic, cube, etc. terms up to the 5th power:

lm.fit5=lm(medv~poly(lstat,5), data=Boston) 
summary(lm.fit5) # See the higher R-Squared
anova(lm.fit,lm.fit5) # Test if the polynomial model is superior

# Both, p-values and F-test supports the polynomial variables

# Note: there are subtle differences between elvating 
#    variables to a given power and using the poly()
#    function. We explain this further later.


## Transformation 3: Box-Cox

# The Box-Cox transformation is actually a family of various transformations (see lecture slides). It tries several values of a parameter called "lambda" and selects the one that best approximates a normal distribution for the outcome variable. The coefficients in ox-Cox transformed models are difficult to interpret, but a Box-Cox transformation my improve predictive accuracy. The "boxcox(){MASS}" function tests Box-Cox transformations

library(MASS) # Needed for the boxcox() function
attach(Boston) # We will work with this data

lm.fit=lm(medv~lstat, data=Boston) # Try a linear model first
summary(lm.fit) # Take note of the R squared

boxcox(lm.fit) # Now let's try Box-Cox transformations

# Notice the maximum likelihood is slightly above 0. Let's amplify the graph from lambda = -0.1 to 0.1 in 0.01 increments:

boxcox(lm.fit, lambda = seq(-0.1, 0.1, 0.01))

# Best lambda is around 0.04, let's model it. Let's transform the outcome variable accordingly:

medv.box=medv^0.04 # Let's create the Box-Cox transformed variable
lm.fit.box.cox=lm(medv.box~lstat, data=Boston)
summary(lm.fit.box.cox) # Notice the improvement in the R-Squared

# Let's split the plot window to see both regression lines side by side

par(mfrow=c(1,2)) # Divide the output into a 2x2 frame
plot(lstat, medv) # Plot the linear model first
abline(lm.fit,lwd=3,col="red") # And its regression line
plot(lstat, medv.box) # Now plot the Box-Cox transformed model
abline(lm.fit.box.cox,lwd=3,col="red") # Notice the improvement in fit


## Transformation 4: Log Models

# Dependent variables are often logged if they have skewed distributions. A log transformation is also necessary when the outcome variable contains counts (e.g., number of applicants, number of store visitors, etc.) -- see Transformation 5 below on count data.

# Independent variables with a skewed distributio don't need to be log-transformed if the sample size is large (degrees of freedom > 50. But with smaller samples the sample means can no longer assumed to be normal, so log transformation may be necessary.

require(ggplot2) # Contains the "diamonds" data set
attach(diamonds)
# Inspect for normality with histograms and QQ-Plots
hist(diamonds$price, main="Diamond Price", xlab="Price")
qqnorm(diamonds$price); qqline(diamonds$price)

# Note: a QQ-Plot plots the actual data quartiles against the quartiles of normally distributed data, so if the data is normal, the plot will be a straight line. The qqline function draws a reference line that goes throught he 1st and 3rd quartile of the data. The more the data departs from the line the less normal it is.

# Now let's look at the logged data
hist(log(diamonds$price), main="Diamond (Log) Price", xlab="Log Price")
qqnorm(log(diamonds$price)); qqline(log(diamonds$price))
# Much better normal distribution

# Let's look at housing data and model a log linear regression
attach(Boston)
hist(medv) # Slightly skewed to the left
qqnorm(medv); qqline(medv) # Produces a Q-Q Plot, along with a Q-Q line

# If the data is normally distributed, the dots fall along the line You can see how the data deviates from the line at the far right

# Now let's check the logged data
hist(log(medv)) # More normally distributed
qqnorm(log(medv)); qqline(log(medv)) # A bit better

summary(lm(medv~log(rm),data=Boston)) 

# The coefficient for log(rm) is 54.05; This means that a 1% increase in rooms increases medv by 54.05/100 or 0.5405 units

# Now let's log-transform the dependent variable only

summary(lm(log(medv)~rm,data=Boston)) 

# The coefficient for rm is 0.36; This means that a 1 unit increase in room leads to a 100*0.36 or 36% increase in medv

# Now let's try a log-log (elasticity) model

summary(lm(log(medv)~log(rm),data=Boston)) 

# The coefficient for log(rm) is 2.22. This means that a 1% increase in rooms leads to a 2.22% increase in medv


## Transformation 5: Count Data

# OLS is often used, but should not be used to predict count data (e.g., number of student applications, number of customers coming to the store, etc.) because the outcome variable is: 

# (1) discrete (no decimals);
# (2) non-negative; and 
# (3) truncated at 0. 

# The correct way is to use the "glm()" function with a "Poisson" distribution and the outcome variable needs to log transformed (i.e., the link function is link="log": 

College <- read.table("College.csv", header=TRUE, sep=",")
options(scipen="4") # To change the decimals display
summary(lm(Apps~Outstate+PhD+S.F.Ratio, data=College)) 

# Incorrecty modeled above as OLS. Try to intepret the meaning of a negative intercept. The correct way is with:

summary(glm(Apps~Outstate+PhD+S.F.Ratio, 
            family=poisson(link="log"), data=College))

# The family=poisson(link="log") attribute tells glm() that the response variable follows a Poisson distribution. The "link" function tells glm() to log-transform the outcome variable. Because y is logged (and the x's are not), the coefficients represent the percent increase in applications, when the x goes up by 1 unit.


## Transformation 6: Centering data

attach(Boston) # Let's center data in the Boston data set
head(Boston) # First, take a quick look at the data

# We can center the data with the scale() function. As we will see later on, the scale() function can also be used to standardize data -- "center=TRUE" will center the variable and "scale=TRUE" will standardize the variable

?scale()

# This will center the entire data frame, provided that all variables are numeric

Boston.centered = data.frame(scale(Boston, center=TRUE, scale=FALSE))

# Note that we also used the data.frame() function because the scale() function converts the data into a matrix and some functions like the linear model lm() function only work with data frames

head(Boston.centered) # Check it out
summary(lm(medv~lstat+age,data=Boston))
summary(lm(medv~lstat+age,data=Boston.centered))

# Note that the two regressions above produce identical results because centering does not change the coefficients, except for the intercept, which becomes (almost) 0 because all the data is centered, so the means of all centered variables is 0.

# Centering is particularly necessary when including interaction terms involving 2 continuous variables:

summary(lm(medv~lstat*age,data=Boston)) # With uncentered data
summary(lm(medv~lstat*age,data=Boston.centered)) # With centered data

# Notice in the regressions above that the results are no longer the same between the centered and original data once you include continuousxcontinuous interaction terms. The centered data is the correct way to model continuous interaction terms.

# Note: if you run the commands below you will alter the Boston data frame in your computer memory. This is OK, but some functions like predict() may not run properly with this extra data. If this happens, simply click on the broom icon above to clear objects from your workspace and then re-attach the original Boston data set.

# This will center specific columns

Boston$medv = scale(Boston$medv, center=TRUE, scale=FALSE)
Boston$lstat = scale(Boston$lstat, center=TRUE, scale=FALSE)
Boston$age = scale(Boston$age, center=TRUE, scale=FALSE)
head(Boston) # Check it out

# Interpreting interaction effect with continuous variables is not easy. Centering variables in interaction terms makes this interpretation easier. Interaction between 2 continuous variables means that the effect of one variable depends on the value of the other variable. The main effects in the above model show the effect of that variables, when the other variable is at its mean.


## Transformation 7: Standardizing data

# You can standardize data with the same scale() funtion but using scale=TRUE

attach(Boston) # Let's center data in the Boston data set
head(Boston) # First, take a quick look at the data

# This will standardizing all the data:

Boston.standardized = data.frame(scale(Boston, center=FALSE, scale=TRUE))
head(Boston.standardized) # Check it out

# Compare results

summary(lm(medv~lstat+age,data=Boston)) # Unstandardized

# Coefficients indicate how many units Y changes when X changes by 1

summary(lm(medv~lstat+age,data=Boston.standardized)) # Standardized

# Coefficients indicate how many standard deviations Y changes when X changes by 1 standard deviation

# As with centering, the commands below will alter the Boston data 
# frame in memory.

# This will center specific columns

Boston$medv = scale(Boston$medv, center=FALSE, scale=TRUE)
Boston$lstat = scale(Boston$lstat, center=FALSE, scale=TRUE)
Boston$age = scale(Boston$age, center=FALSE, scale=TRUE)
head(Boston) # Check it out

# Standardized regression

# You can run the regular linear model function and then extract standardized coefficients with the {lm.beta} package, which will yield "identical" results than runing a regression with all variables standardized.

install.packages("lm.beta") # If not installed already
library(lm.beta)

attach(Boston) # Let's center data in the Boston data set
head(Boston) # First, take a quick look at the data

# Run a regression model as usual and store it in an object

lm.fit = lm(medv~lstat+age,data=Boston)

# This object lm.fit does not have standardized coefficients:
summary(lm.fit)

# But the lm.beta() function calculates them
lm.standardized = lm.beta(lm.fit)
summary(lm.standardized) # Check it out


## Transformation 8: Rank transformations

attach(Boston)
head(Boston)

# To add a new column with ranks in the Boston data frame:

Boston$CrimeRankLoHi = rank(Boston$crim) # Lowest to highest
head(Boston) # Check it out

# Let's add a reverse rank column

Boston$CrimeRankHiLo = rank(-Boston$crim) # highest to Lowest
head(Boston)


## Transformation 9: Lagging data

# Let's work with a housing starts data file

HousingStarts=read.csv("HousingStarts.csv",header=T,na.strings="?")
HousingStarts=na.omit(HousingStarts) # Removes NA's

# Month -- data period
# T -- Month converted into a numeric ordinal sorted variable
# KUnits -- houses started x 1000
# S.P -- S&P index
# Q1, Q2, Q3, Q4 -- dummy variables for each quarter

head(HousingStarts)

# Let's run a regression to predict KUnits

lm.KUnits = lm(KUnits~T+S.P+Q2+Q3+Q4, data=HousingStarts)
summary(lm.KUnits)

# You first need to sort the data by the ordinal variable (e.g., time). In our case, the data was already sorted in Excel

# Let's do a Durbin-Watson (DW) test for serial correlation. This package has a DW test function for lm() objects:

install.packages("lmtest") # If not already installed
require(lmtest) # Activate the package

dwtest(lm.KUnits) # Run the DW test
# DW = 0.308 << 2 --> High positive serial correlation

# Let's try using 4 lags of the dependent variable as predictors

attach(HousingStarts)

# The {DataCombine} package has functions to work with data

install.packages("DataCombine") # If not already installed
library(DataCombine) # Activate the library

# The slide{DataCombine} function can be used to create lag variables. In this case we are creating 4 lagged variables. Note that we need to save the lagged data in a data frame, which could be the same or a new data frame. In this case we are saving the data to the same data frame HousingStarts. Also, use negative "slideBy" values to create lag variables and positive "slideBy" values to create lead variables.

HousingStarts = slide(HousingStarts, Var="KUnits", 
                      NewVar="KUnits.L1", slideBy=-1)
HousingStarts = slide(HousingStarts, Var="KUnits", 
                      NewVar="KUnits.L2", slideBy=-2)
HousingStarts = slide(HousingStarts, Var="KUnits", 
                      NewVar="KUnits.L3", slideBy=-3)
HousingStarts = slide(HousingStarts, Var="KUnits", 
                      NewVar="KUnits.L4", slideBy=-4)
head(HousingStarts)

# IMPORTANT Techincal Note: the slide() function works on data frames. Some time, data sets come in other formats or as more complex data frames and the slide() function complains with errors. The typical error is if you slide a column with 400 values by one, the resulting column will only have 399 values. But in a data frame, the first value is assigned an NA, so it works fine and you get 400 values. If you get one of these mismatch errors, a solution that often works is to re-create the frame like this: MyData <- as.data.frame(MyData). This command will create a simple data frame that works well with slide().

# Now let's try the regression model with all 4 lagged variables

lm.KUnits.all = lm(KUnits~T+S.P+Q2+Q3+Q4+
                KUnits.L1+KUnits.L2+KUnits.L3+KUnits.L4,
                data=HousingStarts)
summary(lm.KUnits.all) # Check out the results

# Notice that KUnits.L3 and KUnits.L4 are significant predictors of KUnits

dwtest(lm.KUnits.all) # Run the DW test
# DW = 2.388, which is acceptable -- no serial correlation


#### 5.1 MACHINE LEARNING ####


### ISLR Chapter 5 Lab: Cross Validation (CV) and the Bootstrap


## The Cross Validation Set (CVS) Approach

library(ISLR) # Contains the Auto data set
attach(Auto)
head(Auto)
?Auto # Take a look at the variables

# Set the seed to a fixed value to be able to replicate results

# Note: any routined that does random sampling will give different results each time because the sample will be different. But if you want to re-create identical results, you can set the seed (i.e., first observation in the sample) fixed to any number and if you set the seed to the same number you will get the same result each time.

set.seed(1) 

# Let's get half of the data into the training set, randomly
nrow(Auto)
train=sample(392,196) # Note: we will use these numbers as indices
train # Take a look

# Now let's fit the model on the training data
lm.fit=lm(mpg~horsepower,data=Auto,subset=train) # Or
lm.fit=lm(mpg~horsepower,data=Auto[train,])
summary(lm.fit) # Check out the rsults

# Let's calculate the Mean Square Error (MSE) for ALL the data
lm.fit.mse <- mean((mpg-predict(lm.fit,Auto))^2)
lm.fit.mse

# Let's get the MSE on the training data only [train]
lm.fit.mse.train <- mean((mpg-predict(lm.fit,Auto))[train]^2) 
lm.fit.mse.train

# Notice that the MSE is lower. Why? Because we are calculating the MSE on the same data we use to train the model!!

# Now let's calculate the MSE on the test data [-train]
lm.fit.mse.test <- mean((mpg-predict(lm.fit,Auto))[-train]^2) 
lm.fit.mse.test

mse.all = c("MSE Full"=lm.fit.mse, 
            "MSE Train"=lm.fit.mse.train,
            "MSE Test"=lm.fit.mse.test )
mse.all

# Notice this most tipical pattern for MSE:
# MSE Train < MSE Full < MSE Train
# Why is that? 

# Note: the command above takes each mpg data point in the full data set and subtracts the corresponding predicted values, thus yielding the prediction error for each obsevation. Since we are only interested in the MSE for the test data, we apply [-train] to eliminate all the records corresponding to the training set. And we then square each observation and take the mean to yield the MSE. Follow closely the use of parentheses

# Let's do the same on various non-linear models

lm.fit2=lm(mpg~poly(horsepower,2),data=Auto,subset=train) 
lm.fit2.mse <- mean((mpg-predict(lm.fit2,Auto))[-train]^2)
lm.fit2.mse

lm.fit3=lm(mpg~poly(horsepower,3),data=Auto,subset=train)
lm.fit3.mse <- mean((mpg-predict(lm.fit3,Auto))[-train]^2)
lm.fit3.mse

mse.all = c(mse.all, 
            "MSE Poly 2"=lm.fit2.mse, 
            "MSE Poly 3"=lm.fit3.mse)
mse.all
# Which model has the lowest MSE
  
# If we want another random sample test with 196 observations we need to change the seed, otherwise we will get the exact same sample.

# Try this yourself

set.seed(2)
train=sample(392,196)
lm.fit=lm(mpg~horsepower,subset=train)
mean((mpg-predict(lm.fit,Auto))[-train]^2)
lm.fit2=lm(mpg~poly(horsepower,2),data=Auto,subset=train)
mean((mpg-predict(lm.fit2,Auto))[-train]^2)
lm.fit3=lm(mpg~poly(horsepower,3),data=Auto,subset=train)
mean((mpg-predict(lm.fit3,Auto))[-train]^2)


## Leave-One-Out Cross-Validation (LOOCV)

# LOOCV can be done with the cv.glm() function in the {boot} package, which works well with the glm() function

library(boot) # Contains the cv.glm() function
library(ISLR) # Contains the Auto data set
attach(Auto)

# Note that the model below is a plain OLS model, but we need to use the glm() function because the cv.glm() requires a glm() object.

lm.fit=lm(mpg~horsepower,data=Auto)
summary(lm.fit)

# With identical result to
glm.fit=glm(mpg~horsepower,data=Auto)
summary(glm.fit)

# cv.glm,() Produces a list with the MSE results
?cv.glm()
cv.loo <- cv.glm(Auto,glm.fit) 

# Note: the cv.glm() function above usually has a third argument indicating the value of K which is the number of partitions for K-Fold validation. When omitted, as in this case, K is set to n (total observations) by default, thus applying LOOCV

# The delta component contains the MSE cross validation results 

cv.loo$delta 

# Note: delta has 2 numbers and they should be almost identical. If not, see below. The first delta value is the actual raw cross-validation MSE. To list just the CV MSE:

cv.loo$delta[1]

# Let's write a for loop to do 5 polinomials and storing results in a vector

# First, let's initialize the cv.error vector with 5 zeros
cv.error=rep(0,5) 
cv.error # Check it out

# Note: the loop below may take a little while to run

for (i in 1:5){ 
  glm.fit=glm(mpg~poly(horsepower,i),data=Auto) # fit for polinomial i
  cv.error[i]=cv.glm(Auto,glm.fit)$delta[1] # cv.error for polinomial i
}

# Check out the vector with MSE values for each of the 5 polinomials
cv.error 
# Looks like the 5th polynomial is the best, but the second is not bad 


## k-Fold Cross-Validation (KFCV)

# Let's start with a simple k-fold CV for, say K=10

library(boot) # Contains the cv.glm() function
library(ISLR) # Contains the Auto data set
attach(Auto)

glm.fit=glm(mpg~horsepower,data=Auto) # Fit a glm model
summary(glm.fit)

# TO view the full cv.glm output:
cv.10K <- cv.glm(Auto,glm.fit,K=10)
# The first $delta value is the raw cross-validation estimate of the prediction error

# TO view just the cross-validation MSE:
cv.10K$delta[1]

# Now let's do a loop to fit 10 polynomial models and calculate the respective cross validation MSE's.

set.seed(17) # Set arbitrarily to 17, can be any number

# Initialze error vector to 10 zeros for a 10 polinomial for loop this time

cv.error.10=rep(0,10) 
cv.error.10 # Check it out

# Note: the for loop below runs 10 regression models, one for each polinomial, so it may take a while too

for (i in 1:10){
  glm.fit=glm(mpg~poly(horsepower,i),data=Auto)
  cv.error.10[i]=cv.glm(Auto,glm.fit,K=10)$delta[1] # 10-Fold validation
  # Note: K is the number of folds, usually 5 to 10.
}

# Check out the MSE's for the 10 different polinomials
cv.error.10

# Looks like the 6th polynomial is the best (this may change with different samplings), but I think such a model would be too complex to interpret. You should use this polynomial if your goal is prediction accuracy, but you would be better off with the second polynomial if your goal is interpretation.

# Now let's try 4 different values of K=5,10,15,20 for a simple linear regression

set.seed(1) # Set arbitrarily to 1, can be any number
cv.error.4=rep(0,4) # Initialze error vector with 4 zeros
cv.error.4 # Check it out

# Initialze another vector to keep the values of K for plotting
cv.k=rep(0,4) 
cv.k # Check it out

glm.fit=glm(mpg~horsepower,data=Auto) # Fit a glm model
summary(glm.fit)

# Note: the for loop below runs 4 regression models, one for each value of K

for (i in 1:4){
  cv.k[i]=i*5
  cv.error.4[i]=cv.glm(Auto,glm.fit,K=i*5)$delta[1]
} 
# i*5-Fold (5,10,15,20) validation

cv.k # Check out the K values
cv.error.4 # Check out the MSE's for the 10 different polinomials
cbind(cv.k,cv.error.4) # List K values with their MSE side by side

# "l" yields a line
plot(cv.k, cv.error.4,"l", ylab="MSE", xlab="K-Fold") 

# How about LOOCV?

cv.error.LOOCV=cv.glm(Auto,glm.fit)$delta[1]
cv.error.LOOCV 
# Not much better than K=10 and slightly worse than K=20


## The Bootstrap

# Try on your own -- not covered in class, but I provide the code for you to explore if you wish

require(boot) # Contains the boot() function below

# This is a function to compute alpha, per 5.7

alpha.fn=function(data,index){
  X=data$X[index]
  Y=data$Y[index]
  return((var(Y)-cov(X,Y))/(var(X)+var(Y)-2*cov(X,Y)))
}

# Computes the alpha for all 100 observations in Portfolio
alpha.fn(Portfolio,1:100) 

set.seed(1)

# This creates 100 observations of size 100 with replacement
alpha.fn(Portfolio,sample(100,100,replace=T)) 

# The procedure above is the long way. Below is the fast way using the boot() function

# This produces 1000 bootstrap estimates for alpha
boot(Portfolio,alpha.fn,R=1000) 

# Estimating the Accuracy of a Linear Regression Model with the bootstrap method

# Here we use the bootstrap approach to evaluate the variability of regression coefficients. First we create a function to run regressions on the Auto data set and return the coefficients

boot.fn=function(fndata,index)
  return(coef(lm(mpg~horsepower,data=fndata,subset=index)))

# We then apply this regression to all 1 to 392 observations (a single regression)

boot.fn(Auto,1:392) 

# The steps below are the long way
set.seed(1)
boot.fn(Auto,sample(392,392,replace=T))

# This is the fast way with bootstrapping to compute standard errors on 1000 bootstraps
boot(Auto,boot.fn,1000) 

# This provides the coefficients for a single regression model
summary(lm(mpg~horsepower,data=Auto))$coef 

# Note both methods, plain regression and bootstrap give coefficients and standard errors, but the regression method is parametric and the boostrap is not. Now, let's run a bootstrap regression on the quadratic model 

boot.fn=function(data,index)
  coefficients(lm(mpg~horsepower+I(horsepower^2),data=data,subset=index))
set.seed(1)
boot(Auto,boot.fn,1000)
summary(lm(mpg~horsepower+I(horsepower^2),data=Auto))$coef

# Note that because the quadratic model fits the data better, the bootstrap and the plain regression produce very similar results


#### 5.2 VARIABLE SELECTION ####

##### We are here
### ISLR Chapter 6 (1) Lab: Model Selection

## Subset Selection Methods

# Comparing Full vs. Reduced Models with an F-Test (Not on the textbook)

# The sections below explore a number of methods to select variables to include in a model. Often the selection will be between a smaller model (i.e., reduced model) and one that includes additional variables (i.e., full model). Reduced models are more biased, but full models can have problems of multi-dimensionality, like multicollinearity. 

# So, it is a balancing act. A commonly used approach is to select the best predictor variables based on business knowledge and then test adding a few additional variables. When new variables are entered into a model they should be tested with an F-Test to see if thee added variables provide "significant" additional predictive power. If the test fails, then they should be removed. There is an easy way to do this with the ANOVA function.

# Let's use the baseball data to illustrate

library(ISLR) # Needed for the Hitters data set
head(Hitters) # Baseball data
Hitters=na.omit(Hitters) # To omit records with missing variables

# First fit both models, reduced and full (e.g.):

# Reduced
lm.reduced <- lm(Salary ~ 
                 AtBat + Hits + Walks, data=Hitters)
summary(lm.reduced) # Take a look

# Full
lm.full <- lm(Salary ~ 
              AtBat + Hits + Walks + Division + PutOuts, 
              data=Hitters)

summary(lm.full) # Take a look

# Use the anova() function to compare models, which performs an F-Test
anova(lm.reduced, lm.full) 
# Added variables add significant explanatory power

# Note: when the F-Test is significant, most of the coefficients of the added variables should be significant too

# Let's try a larger model by adding the variable "Errors"
lm.fuller <- lm(Salary ~ 
                AtBat + Hits + Walks + Division + PutOuts + Errors, 
                data=Hitters)
summary(lm.fuller) # Take a look

anova(lm.full, lm.fuller) 

# Added variable does not add significant explanatory power and it is no coincidence that the p-value for Errors is not significant


## Best Subset Selection

library(ISLR) # Contains the Hitters data set
names(Hitters) # Baseball data
head(Hitters)
fix(Hitters) # Only if you need to edit the data

# Note: please be careful with the fix() function because there is no undo if you change the data. If you make unwanted changes to the data, remove the data set from your work space and re-load it.

rm(Hitters)
names(Hitters) # Baseball data

# Let's explore the data set
dim(Hitters) # Check the number of records and variables

# Count empty salary records (i.e., is.na=TRUE)
sum(is.na(Hitters$Salary)) 

Hitters=na.omit(Hitters) # To omit records with missing variables

# Note: this is how the ISLR text authors do it. I would have created a new table named something like HittersFullData, just to distinguish the two. This example works fine for this data set, but it can be problematice with tables with many variables, where there are always missing values in various fields

sum(is.na(Hitters)) 
# The sum shouldbe 0 because there should be no more empty fields

# Subset selection using the {leaps} package

install.packages("leaps") # If not installed already
library(leaps) # Package that performs subset selection

# regsubset(){leaps} searches for the best predictive subsets
regfit.full=regsubsets(Salary~.,Hitters) 

# Note: best is based on minimizing RSS; the syntax is identical to regression lm()

options(width=140) # To prevent output wrapping

summary(regfit.full)

# Yields 8 subsets, with the respective variables marked with "*". Unless specified by "nvmax" the max number of variables in the subset is 8 by default.

summary(regfit.full)$rsq # Let's inspect the respective R-squares
# Naturally, R-squares go up as more variables are added to the model

# Now, let's try up to 19 variables in the subset:

regfit.full=regsubsets(Salary~.,data=Hitters,nvmax=19) 
reg.summary <- summary(regfit.full) # Let's save the summary in an object
reg.summary

options(width=80) # Back to wrapping at 80 characters

names(reg.summary) # Check out the subset data names
reg.summary$rsq # Let's inspect R-squares

# Let's plot the subset stats
par(mfrow=c(2,2)) # 2 x 2 layout

# RSS
plot(reg.summary$rss,xlab="Number of Variables",ylab="RSS",type="l")

# Adjusted R-Square
plot(reg.summary$adjr2,xlab="Number of Variables",ylab="Adjusted RSq", type="l")

# This command (like which.min) finds the maximum (minimum) value in a vector

which.max(reg.summary$adjr2) 

# Let's draw a single red dot on record 11, which is the max
points(11,reg.summary$adjr2[11], col="red",cex=2,pch=20) 

# Cp

plot(reg.summary$cp,xlab="Number of Variables",ylab="Cp",type='l')
which.min(reg.summary$cp)
points(10,reg.summary$cp[10],col="red",cex=2,pch=20)

# BIC

plot(reg.summary$bic,xlab="Number of Variables",ylab="BIC",type='l')
which.min(reg.summary$bic)
points(6,reg.summary$bic[6],col="red",cex=2,pch=20)

# The regsubsets() function has a built in plot() command to display subset variables (ordered worst to best)

?plot.regsubsets
par(mfrow=c(1,1)) # Back to 1 x 1 layout

plot(regfit.full,scale="r2")
plot(regfit.full,scale="adjr2")
plot(regfit.full,scale="Cp")
plot(regfit.full,scale="bic")
coef(regfit.full,6) # List coefficients for model #6


# Getting more data out of regsubsets() (not in Textbook)

# The regsubsets() object does not have the richer set of statistics that the lm() object provides. But there is a way to feed the regsubset() object model into an lm() model using the {HH} package (Heiberger & Holland), which is a general statistics package

install.packages("HH") # If not already installed
library(HH) # HH works well with regsubsets()
# Note: we will use lm.regsubsets{HH} to pass the model object to lm()
library(ISLR) # Contains the Hitters data set

# First, get the subsets as usual with regsubsets()
regfit.full <- regsubsets(Salary~.,Hitters) 

# Then create the corresponding summary object
regfit.sum <- summary(regfit.full) 
regfit.sum

# For example, to get an lm() object for model #3:
regfit.lm.3 <- lm.regsubsets(regfit.full, 3) 
summary(regfit.lm.3)

# IMPORTANT: the lm.regsubsets() function does not work well with categorical variables. In this case it is best to write lm() model by hand, for example:

which.min(regfit.sum$bic) # Yields model #6

# Now read the variables with "*" and enter them in the lm() model:

regfit.sum 
summary(lm(Salary~AtBat+Hits+Walks+CRBI+Division+PutOuts, data=Hitters))


## Forward and Backward Stepwise Selection using regsubsets()

# This command uses the "exhaustive" method by default
regfit.full <- regsubsets(Salary~.,Hitters,nvmax=19) 
summary(regfit.full)

# Forward selection
regfit.fwd=regsubsets(Salary~.,data=Hitters,nvmax=19,method="forward")
summary(regfit.fwd)

# Backward selection
regfit.bwd=regsubsets(Salary~.,data=Hitters,nvmax=19,method="backward")
summary(regfit.bwd)

# Comparing coefficients:
coef(regfit.full,7)
coef(regfit.fwd,7)
coef(regfit.bwd,7)

# Alternative ways to run stepwise regressions (not in the textbook):

# The forward and backward selection methods above work well. But you can get better models using stepwise regression with the lm() or glm() functions:

library(ISLR) # Contains the Hitters data set

# First, specify the smallest (null) and largest (full) models

# Null model with only the intercept (specifying the number 1 as a predictor fits a model with just the intercept and no other predictors)
Hitters.null <- lm(Salary ~ 1, data=Hitters) 

# Full mode with ALL the variables
Hitters.full <- lm(Salary ~., data=Hitters)

# Inpsect both models:
summary(Hitters.null)
summary(Hitters.full)

# step(){stats} Function: it performs forwards, backwards and stepwise variable selection between a "reduced" and "full" model. As long as the reduced model is a subset of the full model, it will work. Generally, we use the "null" model (just the intercept) as the reduced model, but it doesn't have to be. A couple of important comments about the step() function:

# Variables are included or excluded based on whether the AIC increases or decreases. This roughly coincides with p-values of around 0.15 in the coefficients (p<0.15 includes the variable; p>0.15 excludes the variable). You can change the inclusion/exclusion significance level by adding a parameter k in the step function. The default is k=2, which is approximately equivalent to p<0.15. If you want tighter significance levels you can use higher values of k. For example, k=2.7 yields approximately p<0.10.

# Because of all the issues associated with forward, backwards and stepwise variable selection, the consensus is that you should only use these as exploratory and preliminary approaches. Therefore, there is no need to change the default k value.

# Forward Selection: start with NULL model as a baseline
Hitters.forward <- step(Hitters.null, # Note: this can be either an lm() or a glm() object
                   scope=list(lower=Hitters.null, upper=Hitters.full), 
                   direction="forward", test="F")
summary(Hitters.forward)


# Forward Selection but with a smaller p-value. Let's try k=3
Hitters.forward.3 <- step(Hitters.null, # Note: this can be either an lm() or a glm() object
                        scope=list(lower=Hitters.null, upper=Hitters.full), 
                        direction="forward", test="F", k=3)
summary(Hitters.forward.3)


# Backward selection, start with FULL model as a baseline
Hitters.backward <- step(Hitters.full, 
                    scope=list(lower=Hitters.null, upper=Hitters.full), 
                    direction="backward", test="F")
summary(Hitters.backward)

# Stepwise selection:
# - Forward starts with NULL model
# - Backward starts with FULL model

Hitters.step.forward <- step(Hitters.null, 
                        scope=list(lower=Hitters.null, upper=Hitters.full),
                        direction="both", test="F")
summary(Hitters.step.forward)


Hitters.step.backward <- step(Hitters.full, 
                         scope=list(lower=Hitters.null, upper=Hitters.full),
                         direction="both", test="F")
summary(Hitters.step.backward)

# We can now treat the results like any lm() object:

summary(Hitters.forward)
summary(Hitters.backward)
summary(Hitters.step.forward)
summary(Hitters.step.backward)


## Choosing Among Models using cross-validation

# Complete this section on your own

# This code section comes from the textbook. It is a bit involved and contains a loop and some matrix algebra to do cross validation. You should be able to follow this on your own following my comments. But if you with to do cross valiadation, I recommend fitting your candidate models with glm() as we did earlier and testing for cross validation with cv.glm(){book} as we did earlier. It is a lot simpler.

library(ISLR) # Contains the Hitters data set

# Note: it is important that we remove observations with incomplete data using the na.omit() function. Some of the cross-validation routines below won't work if the number of observations don't match the number of predicted values, and this can happen when there are NA values in the data set.

Hitters=na.omit(Hitters)

# We need a train and a test set -- we do this randomly in this example

set.seed(1) # To get repeatable results

# Create a sample of TRUE and FALSE values for the number of rows in the Hitters table with replacement

train=sample(c(TRUE,FALSE), nrow(Hitters),rep=TRUE)
train # Check out the results

# Use the remaining observations for the test set
test=(!train) # Opposite of the training set
test # Check out the results

# Fit the model on the training subset
regfit.best=regsubsets(Salary~.,data=Hitters[train,],nvmax=19) 
summary(regfit.best) # Check it out

# We first need to make a model X matrix from the test data
test.mat=model.matrix(Salary~.,data=Hitters[test,]) 

# Note: the model.matrix function builds an X matrix (i.e., predictor variable matrix) from the data
test.mat # Check out the text X matrix

# What follows is too tedious, but in essence, it is a loop that runs 
# 19 times, one for each of the regsubset() models.

# We first create an initial vector with 19 NA's
val.errors=rep(NA,19) 
val.errors # Check out this vector

# Note: in the loop below the number of rows in the test set has to match the number of rows in the set predicted below. This will only happen if we eliminate all the NA's with the na.omit() function as we did above.

for(i in 1:19){
  # Get the coefficients for the i-th model
  coefi=coef(regfit.best,id=i) 
  
  # Note: in the next command we use the "%*%" operator, 
  # which is a matrix operator used to multiply 2 
  # "conformable" matrices -- i.e., matrices that that 
  # can be multiplied. FYI, 2 matrices can only be  
  # multiplied if the number of columns of the first 
  # matrix match the number of rows of the second matrix 
  # (e.g., M1[mxn] %*% M2[nxk]). Again, R is vectorized, 
  # so when you multiply 2 matrices with a straigh R 
  # multiplication, e.g., M1*M2, the resulting matrix will
  # contain the elements of M1 multiplied by the 
  # respective alements of M2. If what you need is a true 
  # matrix multiplication you need to use the matrix 
  # operator M1%*%M2

    pred=test.mat[,names(coefi)]%*%coefi 
    
  # The command above multiplies the X values from the test
  # matrix that match coefficient names times the respective 
  # coefficients for model i. This is necessary because 
  # there is no predict() function for regsubsets(). 
  # Remember that the prediction is X times the beta 
  # coefficients. 
  
  # Now, let's compute the MSE for the i-th model
  val.errors[i]=mean((Hitters$Salary[test]-pred)^2) 
}

# To see how the i-th pass of the loop works, check it out, for example for i=6

coefi=coef(regfit.best,id=6) # Coefficients for the 6th model
coefi # Take a look

# Matrix-multiply the X times the coefficients
pred=test.mat[,names(coefi)]%*%coefi 
pred # Take a look

# To compute the MSE for the 6th model (i=6):
val.errors[6]=mean((Hitters$Salary[test]-pred)^2) 
val.errors[6] # Take a look

# To see all 19 MSE values computed by the loop above
val.errors 
which.min(val.errors) # Now find the smallest of the 19 MSE's

# The result is model 10
coef(regfit.best,10) # Get the coefficients for that model


# The following creates a function to do the same steps above. Not necessary for this class, but for informational purposes only:

predict.regsubsets=function(object,newdata,id,...){
  form=as.formula(object$call[[2]])
  mat=model.matrix(form,newdata)
  coefi=coef(object,id=id)
  xvars=names(coefi)
  mat[,xvars]%*%coefi
}

# The final predictive model to be used should be re-fitted using the full data set, not just the training set. But because the cross validation found the 10-variable model to be the best, we now just focus on finding the best 10-variable model


#### 6. DIMENSION REDUCTION ####


### ISLR Chapter 6 (2) Lab: Regularization (Ridge, LASSO, PCR, pLS)

# In this section we explore popular modeling approaches for models with high-dimensionality. The first 2 (Ridge and LASSO) are "shrinkage" methods, which aim to shrink the coefficients of less important variables instead of removing them from the model. The magnitude of the shrinkage can be controlled with a tuning parameter called "shinkage factor" or simply "Lambda".

# The last 2 yield models that use linear combinations of variables, rather than the actual variables. The concept is that by finding directions in which the data have the highest variance (i.e., principal components), maybe the first few directions can explain most of the variability in the data, so that we don't need to use all dimensions.


## ISLR Lab 6.2 (1): Ridge Regression

# Ridge regression computes different coefficients than OLS, so they tend to be more biased than OLS. But by shrinking coefficients that may cause multi-collinearity, we reduce the variance of the model.

# OLS vs. Ridge

# The relationship between the Ridge and OLS coefficients is: Beta(Ridge) = Beta(OLS)/(1+Lambda), where Lambda is a tuning parameter that can take any value:

# If Lambda = 0, ridge and OLS regressions produce the exact same coefficients. 1/(1+Lambda) is the "shrinkage" factor: As Lamda gets largers, the smaller (and less significant) the reulting coefficients get "crushed) by the Lambda weight. If Lambda is extremely large, then all coefficients get crushed. Because the Lambda is not applied on the intercept, extreme values of Lambda yield the null model (just the intercept).

# Because Lambda causes the coefficients to shrink, they are "biased" compared to the unbiased OLS coefficients. So, Ridge regression will generally imrprove the MSE accuracy, but beyond a certain point (usually around 10) the coefficients will be too biased to be useful. Generally speaking Ridge regression works best when OLS estimates have high variance.

install.packages("glmnet") # If not installed already
library(glmnet) # Contains functions for Ridge and LASSO
library(ISLR) # Contains the Hitters data set

# Like we did above, we need to omit records with missing data
Hitters=na.omit(Hitters) 
# Do it again only if you just oppened the Hitters table

# Note: this package has a different syntax and it requires defining an X matrix (predictors) and a Y vector (response values) because this package does not use the y ~ x1 + x2 etc. syntax. we can use the model.matrix(){stats} function to create model matrices with just the predictor variables. Also, we need to remove qualitative variables because glmnet() only takes numerical data.

# X matrix with last column (qualitative) removed
x=model.matrix(Salary~.,data=Hitters[,-1]) 
x # Take a look

y=Hitters$Salary # y vector with just the outcome variable
y # Take a look

# alpha = 0 fits a Ridge Regression for a variety of descending lambda values

ridge.mod=glmnet(x,y,alpha=0) 
# Lambda = 0 --> OLS regression; 
# Lamda = very large --> large shrinkage --> null model (just intercept)

ridge.mod # take a look

# If you want a single value of lambda, for example 0 (i.e., same as OLS regression:

ridge.mod.0=glmnet(x,y,alpha=0, lambda=0) 
coef(ridge.mod.0) # take a look

# Note: Ridge regression standardizes the coefficients to avoid issues of scale invariance (i.e., OLS coefficients are scale invariant, so if we change inches with feet, the coefficients change proportionally; because of the shrinkage factor, Ridge coefficients are not scale invariant, thus the need to standardize the regression). However, Ridge regression can be run without standardizing coefficients simply by specifying "standardize=FALSE".

# Let's try one very large shrinkage penalty (i.e., null model):
ridge.mod=glmnet(x,y,alpha=0, lambda=100000)
coef(ridge.mod) # take a look

# You can also fit models with a sequence of lambda values
ridge.mod=glmnet(x,y,alpha=0, lambda=c(100000,10000,1000,100,10,5,0)) 
coef(ridge.mod) # take a look

# Note that the coefficients are listed from highest to lowest shrinkage (starting with lambda=100000), so it is customary to list a decreasing sequence of lambda values.


ridge.mod$lambda # Take a look
ridge.mod$lambda[3] # List the third lambda
coef(ridge.mod)[,3] # And the resulting coefficients

# Another way to try various Lambda values in a series of Ridge regressions is to create a sequence, for example the command below generates 100 sequence values stored in the object "grid". The sequence takes values from 10 to -2 and grid takes a range of values from 10^10 to 10^-2.

grid=10^seq(10,-2,length=100) 
grid # Take a look

# This command fits a model for each of the 100 lambda values in grid

ridge.mod=glmnet(x,y,alpha=0,lambda=grid) 
ridge.mod # Check it out

# Note: the ridge regression object is a matrix with one row for each predictor and one column for each value of lambda:

coef(ridge.mod)
str(ridge.mod) # To further inspect of the ridge.mod object
dim(coef(ridge.mod)) # Shows the coefficient matrix dimensions
# 20 (variables) x100 (lambdas) matrix

# Aside: l1 Norm (LASSO) vs. l2 Norm (Ridge)

# - l2 Norm: is the sum of the squared coefficients in a Ridge
#      regression. It measures the total amount of shrinkage
#      provided by the particular lambda value used. The smaller
#      l2, the larger the shrinkage. l2 Norm = sum of the model's 
#      squared coefficients

# - l1 Norm: is the sum of the absolute values of the coefficients 
#      in a LASSO regression. Like l2, it measures the total amount
#      of shrinkage obtained by a particular lambda value used. The
#      smaller l1 the larger the shrinkage

# Example: 50th Lambda
ridge.mod$lambda[50] # List the 50th lambda
coef(ridge.mod)[,50] # And its respective coefficients


l2.norm=sqrt(sum(coef(ridge.mod)[-1,50]^2)) 
l2.norm

# You can plot the l2 Norm
plot(ridge.mod)
# For some reason, it reports l1 Norm, but the visual representation of shrinkage is similar to l2 Norm.

# Example: 60th Lambda
ridge.mod$lambda[60]
coef(ridge.mod)[,60]
sqrt(sum(coef(ridge.mod)[-1,60]^2)) # l2 Norm
# l2 Norm[60] = 56.912

# Notice that the l2 Norm 50th Lambda are much smaller (i.e., shrunk) than those of the 60th Lambda (remember that the lambdas are sorte in descending order, so the 50th lambda is larger than the 60th)

# Prediction with Ridge Regression, but first:

# Note: the predict() function with Ridge regression can not only be used to make predictions, but for example, it can be used to obtain coefficients for a new value of lambda by including the keyword type="coefficients"; predict() with newx=[test,] generates predictions for the test data.

# Let's get Ridge coefficients for for lambda=50
predict(ridge.mod,s=50,type="coefficients")[1:20,] 

# The [1:20,] index yields the first 20 predictions. Since we are extracting coefficients for the new lambda it will yield the coefficients for all 20 predictors in the model

# Now let's do some predictions with test data

# Let's break up the data into 1/2 training and 1/2 test
set.seed(1)

# Let's get the random sample for the training data with numbers from 1/2 of the numbers 1 to nrows to be used as indices

train=sample(1:nrow(x), nrow(x)/2) 
train # Take a look
test=(-train)
test # Take a look

# Let's apply the random sample as indices for the response variable

y.test=y[test] 
y.test # Take a look

# Let's fit the Ridge regression model on the training data

# Note: the ISLR text authors use command below, but with a parameter thresh=1e-12. This is a convergence threshold and its explanation is too technical and beyond the scope of this class. The default thresh value is 1e-07, so I use the glmnet() function below without changing the default thresh value.

ridge.mod=glmnet(x[train,], y[train],alpha=0,lambda=grid)
# Check the coefficients, with fewer decimals
print(coef(ridge.mod), digits=2)
plot(ridge.mod)

# Now let's predict on the test data with lambda=4 (i.e., s=4)

ridge.pred=predict(ridge.mod,s=4,newx=x[test,]) # Get predictions (newx) on the test data
ridge.pred # Take a look

# Cross Validation MSE
mean((ridge.pred-y.test)^2) # Calculate the MSE on the test data

# Let's test a very large lambda -- i.e., close to the Null model
ridge.pred=predict(ridge.mod,s=1e10,newx=x[test,]) 
# Note 1e10 means 10 to the 10th power

mean((ridge.pred-y.test)^2) # Calculate the MSE
# The MSE is larger than for the null model than for lambda=4

# Let's try OLS with lambda=0 -- i.e., the OLS model
ridge.pred=predict(ridge.mod,s=0,newx=x[test,],exact=T) 
mean((ridge.pred-y.test)^2)
# The MSE is also larger than for the OLS model than for lambda=4

# OLS regression model yields the same coefficients
lm(y~x, subset=train) 

# compare the 2, they are the same (or very close)
predict(ridge.mod,s=0,exact=T,type="coefficients")[1:20,] 

# Ridge Regression Cross Validation with {glmnet}

# The {glmnet} library comes with the cv.glmnet() function to do cross validation testing of Ridge regressions

set.seed(1) # To get replicable results

# 10-fold cross validation (the default validation). The k-fold value can be changed with the folds argument

# With the training data only
cv.out=cv.glmnet(x[train,],y[train],alpha=0) 

# With the full data
cv.out.full=cv.glmnet(x,y,alpha=0) 

# This function creates the glmnet cross validation object. You can then get information from this object, for example:

# Plotting the MSE against log(lambda)
plot(cv.out)
plot(cv.out.full)

# To find the best lambda where mean cross-validated error is minimized:

bestlam=cv.out$lambda.min 
bestlam # Take a look

bestlam.full=cv.out.full$lambda.min 
bestlam.full # Take a look


# Now you can make predictions with the best lambda

ridge.pred=predict(ridge.mod,s=bestlam,newx=x[test,]) 
mean((ridge.pred-y.test)^2) # Calculate its MSE

# Now, let's re-fit the model with the full data set
out=glmnet(x,y,alpha=0)

# Extract the coefficients for the best lambda
predict(out,type="coefficients",s=bestlam)[1:20,] 


## ISLR Lab 6.2 (2): LASSO Regression

# Identical syntax to Ridge, but uses alpha=1

# Notice that we follow the same sequence than for Ridge above but also notice that some coefficients become 0 with Lasso (which is not the case with Ridge); you can also list non-zero coefficients at the end

# The syntax for LASSO models is identical to the one for Ridge, but with alpha=1

lasso.mod=glmnet(x[train,],y[train],alpha=1,lambda=grid)
plot(lasso.mod) # Plot the coefficient shrinkage visual

set.seed(1)
cv.out=cv.glmnet(x[train,],y[train],alpha=1)
plot(cv.out) # Plot the MSE against log(lambda)

# To find the best lambda where mean cross-validated error is minimized:

bestlam=cv.out$lambda.min #
bestlam # Check it out

# Now you can do cross validation with the best lambda

lasso.pred=predict(lasso.mod,s=bestlam,newx=x[test,])
mean((lasso.pred-y.test)^2)

# Now you can fit the model with all the data

out=glmnet(x,y,alpha=1,lambda=grid)
lasso.coef=predict(out,type="coefficients",s=bestlam)[1:20,]
lasso.coef

# Notice that, in contrast to Ridge, some coefficients shrink all the way down to 0

lasso.coef[lasso.coef!=0] # List only coefficients different than 0


## Principal Components Regression (PCR)

# We will use the {pls} package for PCR and PLS

install.packages("pls") # If not installed already
library(pls) # Has the Principal Components Regression pcr() function
library(ISLR) # Has the Hitters data set

set.seed(2) # To get repeatable results

# The pcr syntax is similar to lm
pcr.fit=pcr(Salary~., data=Hitters,scale=TRUE,validation="CV")

# Note: scale=TRUE is needed to standardize predictors, which is necessary when variables are in different scales (e.g., lbs, feet, etc.).

# Also, validation="CV" does 10-fold cross validation. validation="LOO" does leave-one-out cross validation

# Take a look at the results with CV scores and % variance explained for each factor
summary(pcr.fit) 

# Notes: 

# 1. CV values are root MSE, not MSE, but you can square them

# 2. CV's RMSE's go down as more components are included but notice that after the first few components, the further reduction in RMSE with one more component is not substantial

# 3. Same thing for variance explained; it increases with each addional component, but as you can see, the first few components explain a large proportion of the variance

# This can be visualized with the Scree plot using MSE's
validationplot(pcr.fit,val.type="MSEP") 
validationplot(pcr.fit,val.type="RMSEP") # Or with RMSE 

# Cross validation with PCR

# Let's do PCR in the training data only and evaluate it with the test data set

# Since we previously remove NA's from the Hitters data set, let's remove it from the work environment and re-open it

rm(Hitters)
data(Hitters)
head(Hitters)

set.seed(1)
pcr.fit=pcr(Salary~., data=Hitters,subset=train,scale=TRUE, 
            validation="CV")
validationplot(pcr.fit,val.type="MSEP") 

# Lowest MSE is with 7 components. So, let's predict on the test set with 7 components

pcr.pred=predict(pcr.fit,x[test,],ncomp=7) 
pcr.pred # Take a look at the predicted values
mean((pcr.pred-y.test)^2) # Compute the MSE

# We can now fit the model with 7 components on the full data set
pcr.fit.7=pcr(Salary~., data=Hitters,scale=TRUE, ncomp=7)
summary(pcr.fit.7)

# The command above provides statistic showing:

# 1. How much of the variance of the original predictors (X) is explained by the components (7 components explain 92.26% of the variance).

# 2. How much of the outcome variable variance is explained by the model (7 components explain 46.69% of the variance in Salary)

# The pcr() object is very complex and is full of information:

str(pcr.fit) # Show all the contents of pcr.fit, then for example:
pcr.fit$coefficients # For models using 1, 2 ... M components
pcr.fit$loadings # The linear weight of each variable on each component
pcr.fit$scores # Resulting from applying loadings to each data point


## Partial Least Squares (PLS) Regression

# For PLS we use the same {pls} library, but we use the plsr() function instead.

library(pls) # Contains the plsr() function

set.seed(1)

# The plsr() syntax is identical to the pcr() syntax

pls.fit=plsr(Salary~., data=Hitters,subset=train,scale=TRUE, 
             validation="CV") # Fit the model on training set
summary(pls.fit)

validationplot(pls.fit,val.type="MSEP") # Lowest MSE with 2 components
pls.pred=predict(pls.fit,x[test,],ncomp=2) # Predict on the test set
mean((pls.pred-y.test)^2) # Calculate MSE for the test set

# Now you can re-fit the model with the full data set and 2 components
pls.fit.2=plsr(Salary~., data=Hitters,scale=TRUE,ncomp=2) 
summary(pls.fit.2)


#### 7. NON-LINEAR MODELS ####


## Interaction Terms - Binary x Continuous

# Interaction effects should not be interpreted by thembselves, but in conjunction with their respective main effects before an interaction enhances or offsets a main effect.

# Binary x Continuous interactions are easy to interpret because the interaction effect specifies how much the main effect of the continuous variable changes when the binary variable changes in value from 0 to 1.

# Let's compare a linear with an interaction model to predict car gas mileage

library(ISLR) # Contains the Auto data set

#Let's convert the origin variable into a new variable called "foreign" =1 if European or Japanese and 0 if Amaerican.

data(Auto)
Auto$foreign=ifelse(Auto$origin==1,0,1)

# Linear model without interaction
fit.linear <- lm(mpg~
                 horsepower+weight+foreign+year,
                 data=Auto)
summary(fit.linear)

# Let's add an (binaryxcontinuous) interaction term 
fit.inter <- lm(mpg~
                horsepower+weight+foreign+year+
                foreign*weight,
                data=Auto)
summary(fit.inter)

fit.inter.2 <- lm(mpg~
                horsepower+weight+foreign+year+
                foreign*weight+foreign*year,
                data=Auto)
summary(fit.inter.2)

anova(fit.linear, fit.inter, fit.inter.2)

# Interpretation: 

# 1. The linear model indicates that foreign cars have better gas mileage than domestic cars, other things being equal. When we add a foreign*weight interaction term the interaction is negative and significant. Thismeans that the negative effect of weight on gas mileage is stronger for foreign cars that for domestic cars. Or, conversely, the positive effect of being a foreign car is diminished for heavier cars.

# 2. Interestingly, when we add an interaction term foreigh*year, it not only becomes significant, but now the main effect of foreign is negative. This means that foreign cars are less fuel efficient, but this effect is offset rapidly with newer cars.

# 3. The ANOVA tests shows that the 2 interaction model is better than the 1 interaction model, which in turn is better than the linear model.

# R makes this easier for you because ff you only include the interaction term, R knows that the respective main effects also need to be included because interaction effects are meaningless by themselves. Note how R includes the main effects even if we don't explicitly include them:

fit.inter.2 <- lm(mpg~
                  horsepower+foreign*weight+foreign*year,
                  data=Auto)
summary(fit.inter.2)

# If you would like to exclude the main effects for some strange reason, you can do this using the ":" rather than the "*" operator:

fit.inter.not <- lm(mpg~
                 horsepower+foreign:weight+foreign:year,
                 data=Auto)
summary(fit.inter.not)

# Try to intepret these results. It's not really possible.

# You can use the ":" to specify interaction terms when you have explicitly modeled the main effects:

# A recap on how to interprete binary x continuous interaction effects:

# 1. If the interaction effect is not significant, there 
#    are no interaction effects

# 2. If the interaction effect is significant:

#    2.1 If the sign of the interaction effect is in the 
#        same direction as the main effect, then the other 
#        variable "enhances" the main effect.

#    2.2 If the sign of the interaction effect is in the 
#        opposite direction than the main effect, then the 
#        other variable in the interaction term "offsets" or 
#        "diminishes" the main effect.

#    3.1 If the continuous variable does not have a significant main
#        effect, then it's effect is not significant when the binary
#        variable value is 0, but it is significant when it is 1.

# For example, in the model below lstat has a negative effect on median home values and the interaction effect with age is significant. This means that age and lstat offset each other. In other words, lstat has a negative effect on median home values, but this negative effect is diminished with the age of the housing.


## Interaction Terms - Continuous x Continuous

# These interaction effects are tricky to interpret. Proceed with caution.

# When multiplying two continuous variables to create an interaction term the resulting model will suffer from a number of issues:

# 1. High multicollinearity -- if the two main effects are 
#    somewhat correlated, their product will be highly 
#    correlated with both

# 2. Scale invariance -- when you change the scale of a 
#    variable in OLS (e.g., inches to feet) the p-value 
#    of its coefficient does not change and the value of 
#    the coefficient will change proportionally (e.g., 
#    the effect of increasing 1 foot is 12 times the 
#    effect of increasing 1 inch)

# 3. Effect interpretation -- the interaction effect 
#    represents the effect change of one variable when 
#    the other one is 0, and vice versa 
#    (y=b1x1+b2x2+bintx1x2). But this is not useful if 
#    0 is not a possible value for one of the variables 
#    (e.g., number of rooms in a house; weight of a car).

# Centering the dependent variable and both variables involved in the interaction term solves the problems above:

# 1. With uncentered variables, if both variables have 
#    a positive value then their product will be positive, 
#    thus generating collinearity. But if the variables 
#    are centered, then their values may be positive or 
#    negative, so their product will be less correlated

# 2. With centered variables, it can be shown that the 
#    main effects will remain scale invariant.

# 3. Because centered variables take the value of 0 at 
#    their respective means, the resulting interaction 
#    term represents the effect of one variable when the 
#    other one is at its mean, which is more meaningful 
#    for interpretation. 

# Once the variables are centered, they are modeled in a similar manner to binary variables. Let's illustrate this:

library(MASS) # To access the Boston data set
attach(Boston)

# This is the incorrect way and may lead to wrong conclusions when we don't center variables

inter.fit.uncenter <- lm(medv~lstat*age,data=Boston)
summary(inter.fit.uncenter)

# Now let's center the response variable and the two variables in the continuous x continuous interaction term:

Boston$medv = scale(Boston$medv, center=TRUE, scale=FALSE)
Boston$lstat = scale(Boston$lstat, center=TRUE, scale=FALSE)
Boston$age = scale(Boston$age, center=TRUE, scale=FALSE)

inter.fit.uncenter <- lm(medv~lstat*age -1,data=Boston)

# Note: The -1 fits a regression without an intercept. Since we have centered all variables, the regression line should go through the origin. Forcing the regression through the origin is not necessary if there are other uncentered variables in the model

summary(inter.fit.uncenter)


## Polynomial Regression

# Before we start with polynomials, let's take a look at the Wage data

library(ISLR) # Contains the Wage data
attach(Wage) # Please note the W in caps
head(Wage)

# Caution: note that there is a variable also called "wage" but with a lower case w, which contains the wage for each person

plot(wage, age) # Take a look at the data, visually

# A casual inspection of the plot suggests that the relationship between wage and age is not linear

Wage$wage # Take a look at all the wages
Wage$age # and all the ages

# Let's start simple, with a linear model
fit.poly1=lm(wage~age,data=Wage)
summary(fit.poly1)
# Good fit; age is significant; very low R-Square

# Let's try a squared model
fit.poly2=lm(wage~poly(age,2),data=Wage)
summary(fit.poly2)
# Good fit; significant squared term; R-Square improve just a tad

# Let's fit a polynomial up to the power of 4
fit.poly4=lm(wage~poly(age,4),data=Wage)
summary(fit.poly4)

anova(fit.poly1, fit.poly2, fit.poly4)

# Good fit; significant squared and cube term; 4th poly coefficient is not significant; R-Square improve just a smigeon. Higher polynomial model has stronger predictive power.

# The higher the poly power; the higher the R-square; the better the fit; but you start running into dimensionality problems and overfitting and the model becomes more difficult to intepret.

# Important Note: the poly() function does not give coefficients for x, x-square, x-cube, etc., but for an "orthogonal polynomial" of these variables. This sounds complicated, but these are simply the principal components of the polynomial vairables. This is done by the poly() function because including various powers of a variable will create high multi-collinearity. With these orthogonal polynomials, all 4 variables have 0 correlation, no multi-collinearity, therefore yielding more stable models. However, the interpretation of orthogonal polynomials is tricky because it is hard to relate them to the original variable x. But polynomial are hard to interpret anyway, orthogonal or not.

# If you would like to fit a model using the raw variables x, x-squared, x-cube, etc., without converting these variables into an orthogonal polynomial, just use the attribute raw=TRUE or raw=T

fit.poly4.raw=lm(wage~poly(age,4,raw=T),data=Wage)
summary(fit.poly4.raw)

# Alternatively, you can elevate to the respective power manually
fit.poly4.I=lm(wage~age+I(age^2)+I(age^3)+I(age^4),data=Wage)
summary(fit.poly4.I)
# Notice that the results are identical to the previous poly model

# Predictions with Polynomials

# Rather than using all data points, let's get a list of the unique age values in the data and make predictions for these values. We start by computing the range of the data, that is the lower and upper values of the age variable range using range()
agelims=range(age)
agelims # Take alook -- the ages range between 18 and 80

# Now lets create a sequence of numbers containing every age in the data using the seq() function and store it in an object named age.grid:

age.grid.by10=seq(from=agelims[1],to=agelims[2], by=10)

# agelims is a vector with 2 values, so agelims[1]=18 and agelims[2]=80, so the command above creates a sequence of ages from 18 to 80 increments of 10.

age.grid.by10 # Take a look

# If we omit the "by=10" the ages will be incremented by 1 (default)

age.grid=seq(from=agelims[1],to=agelims[2])
age.grid # Take a look

# Now let's run the predict() function for all the ages in the data, and include standard errors in the output

preds=predict(fit.poly4.raw,newdata=list(age=age.grid),se=TRUE)

# The command above seems convoluted, but we are using new data to make predictions. Since our only prediction is a variable named "age", we need to use the command list(age=age.grid) to create a variable called "age" and assign to this variable each of the unique age values contained in age.grid. Notice that age.grid and list(age=age.grid) yield the same values:

age.grid
list(age=age.grid)

# but notice that the list has the $age name designation, which the fit.poly.raw linear model expects

# Now, let's take a look at the predicted wages and standard errors for these predictions

preds 

# Let'do some plotting -- NOTE: you can only plot Y against a single X predictor

# Let's split the plot frame and do some visualization and move the margins to make room for a title

par(mfrow=c(1,1),mar=c(4.5,4.5,1,1),oma=c(0,0,4,0)) 
# mar() controls the number of lines at the bottom, left, top right
# oma() control the outer margins -- play with these values

# Plot the dots first
plot(age,wage,xlim=agelims,cex=.5,col="darkgrey") # Do the plot first
title("Degree-4 Polynomial",outer=T) # Add a title

# Now draw a line with the ages and predicted wage values
lines(age.grid,preds$fit,lwd=2,col="blue")

# Now draw confidence intervals at +/- 2 standard errors
lines(age.grid,preds$fit-2*preds$se.fit,lwd=1,col="red") 
lines(age.grid,preds$fit+2*preds$se.fit,lwd=1,col="red") 

# One important observation: whether you use the raw x, x-squared, x-cube, etc. or orthogonal polynomials, the predicted values will be identical. Take a look

preds2=predict(fit.poly4,newdata=list(age=age.grid),se=TRUE)
# preds uses raw polynomials and preds2 uses orthogonal polynomials

max(abs(preds$fit-preds2$fit)) # Notice how small are the differences

# If you would like to find the best polynomial, you can test how much predictive power you add every time you add a higher polynomial term, using the anova() function, as explained above for testing reduced vs. extended sets:

fit.1=lm(wage~age,data=Wage) # Just x
fit.2=lm(wage~poly(age,2,raw=T),data=Wage) # Add x-squared
fit.3=lm(wage~poly(age,3,raw=T),data=Wage) # etc.
fit.4=lm(wage~poly(age,4,raw=T),data=Wage)
fit.5=lm(wage~poly(age,5,raw=T),data=Wage)

# Now let's do an F-Test with ANOVA
anova(fit.1,fit.2,fit.3,fit.4,fit.5)

# These results support model 3, which has x-cube -- beyond that the power does not increase significantly

summary(fit.3) # Note that all coefficients are significant

# Interestingly, when we add higher power coefficients the model breaksdown

summary(fit.5) 

# Important note: we used raw variables, but the book example uses orthogonal polynomials.This means that the coefficients will be different, but the ANOVA F-Tests should yield similar results

# You can try adding other variables and testing them with F-tests, for example:

fit.1=lm(wage~education+age,data=Wage)
fit.2=lm(wage~education+poly(age,2, raw=T),data=Wage)
fit.3=lm(wage~education+poly(age,3, raw=T),data=Wage)
anova(fit.1,fit.2,fit.3)


## Polynomial Logistic Regression

# IMPORTANT: Try on your own after the classification models lecture

# Let's try the same method with Logistic regression with the dependent variable as the probability that Wage is greater than 250K using orthogonal polynomial

library(ISLR) # Contains the Wage data
attach(Wage)
head(Wage)

fit.logit=glm(I(wage>250)~poly(age,4),data=Wage,family=binomial)
summary(fit.logit) # Take a look

# Before we do predictions, let's re-create the age.grid data. No need to re-create it if you have not shut down R Studion sin you created it

agelims=range(age)
age.grid=seq(from=agelims[1],to=agelims[2])

# Now let's do predictions on the same age range we used above

preds=predict(fit.logit,newdata=list(age=age.grid), se=T)
# The preds vector has one predicted value for each age.grid value
preds # Take a look at the log-odds of Wage>250K predictions

preds.odds=exp(preds$fit) # Odds predictions of Wage>250K
preds.odds # Take a look

preds.probs=preds.odds/(1+preds.odds) # Probability predictions
preds.probs # Take a look

# Now let's compute the confidence interval as predicted value +/- 2 standard errors, using the log odds (you can try odds and probs).

se.bands = cbind(preds$fit-2*preds$se.fit,
                 preds$fit+2*preds$se.fit)
se.bands # Take a look

# And also let's do the same for odds and probabilities:

se.bands.odds = exp(se.bands)
se.bands.odds # Take a look
se.bands.probs = se.bands.odds/(1+se.bands.odds)
se.bands.probs # Take a look

# Note: if we use type="response" with the predict() function, it causes the predicted values to be the probabilities; otherwise the default is log-odds.

preds.probs.2=predict(fit.logit,newdata=list(age=age.grid), 
              type="response", se=T)
preds.probs.2 # Take a look

# Now let's do the plotting

plot(age,I(wage>250),xlim=agelims,ylim=c(0,1))
lines(age.grid,preds.probs,lwd=2, col="blue")

# matlines (matrix lines) works like lines but plots all columns of a matrix, in this case it plots both columns of se.bands.probs against age
matlines(age.grid,se.bands.probs,lwd=1,col="red",lty=3)

# We can aplify up the plot by changing the ylim to 0,0.2 and dividing the I by 5 just so that the 1's show up in the 0,0.2 range

plot(age,I(wage>250)/5,xlim=agelims,ylim=c(0,0.2))
lines(age.grid,preds.probs,lwd=2, col="blue")
matlines(age.grid,se.bands.probs,lwd=1,col="red",lty=3)

# Notice the "wagging the tail" issue, typical of polynomials


## Step Functions

library(ISLR) # Contains the Wage data
attach(Wage)
head(Wage)

# As illustrated in the plot above, polynomials tend to over-fit the data and yield high-variance models. "Wagging the tail" is a common issue with polynomials in which the standard error band widens at the tail-end of the data. Why do you think that is? Well, if there is error in x, the errors get amplified with powers of x, particularly as x gets larger.

# Step functions alleviate this problem to some extent. A step function fits a bunch of horizontal lines in different "segments" or "partitions" of the data. The points where the partitions begin and end are called "cut points". To fit a Step function, we can use the cut() function to arbitrarily divide the age data into, say 4 partitions.

table(cut(age,4))
fit.step=lm(wage~cut(age,4),data=Wage)
summary(fit.step) # Take a look

# Let's do some predictions with the age.grid data
preds=predict(fit.step,newdata=list(age=age.grid),se=T)
preds # Take a look

# Let's inspect the results visually
plot(age,wage,xlim=agelims,cex=.5,col="darkgrey") # Do the plot first
title("Step Regression of Wage on Age",outer=T) # Add a title

# Let's draw a line with the ages and predicted wage values
lines(age.grid,preds$fit,lwd=2,col="blue") 

# And also the confidence interval line with age; 
# Note: you can use this method or the matlines() method above
lines(age.grid,preds$fit-2*preds$se.fit,lwd=1,col="red") 
lines(age.grid,preds$fit+2*preds$se.fit,lwd=1,col="red") 
# Notice that the "tail wagging" issue has been reduced

# The problem now is that we have a bunch of horizontal lines, which don't capture trends. It seems like sloping the lines can give us a better fit, which is what Piecewise Linear Regression does.


## Piecewise Linear Regression 

# This code is not in the textbook

library(ISLR) # Needed to acces the Wage data set
attach(Wage)
head(Wage)

# To fit a sequence of regression lines sequentially along the data, we first need to figure out the "knots" or "cut points", where the regression slope changes. Take a look at the data first:
plot(age,wage)

# Or, better, lets gray the dots to see the lines better
plot(age,wage,xlim=agelims,cex=.5,col="darkgrey")

# Visually, it appears that the data changes directions at ages 25, 40 and 60. So, let's build a stepwise linear regression model with 3 knots yielding 4 different but connected regression lines (i.e., segments) to the right and left of each knot. To do this, we can create dummy variables that are 0 to the left of each knot and 1 to the right. We can then add the interaction term of this dummy variable with age.

fit.piecewise=lm(wage~age+
                      I((age-25)*(age>25))+
                      I((age-40)*(age>40))+
                      I((age-60)*(age>60)), 
                      data=Wage)

# Note that the I() function creates the respective dummy variables and interaction terms. Also note that we use (age-25) rather than age in the first interaction term, which is equivalent to moving the Y axis to the knot at age=25 and then multiply it by (age>25), which will yield 0 for age<=25 and age for age>25 we then apply the I() function to the whole operation.

summary(fit.piecewise) # Take a look at the results

# Interpretation: the intercept is at -42.47. The regression slope starts with 5.38K more wage dollars for every additional year of age, up to age 25. At that point the slope changes to 5.38-3.50=1.88K more wage per year of age, upt to age 40. Then, it changes to 1.88-1.98 = -0.10K less wage dollars for every additional year of age (i.e., almost flat), up to age 60. After that it declines at the rate of -0.10-1.40 = -1.50K fewer dollars for each additional year of age.

# Let's look at this visually. First, let's create a vector with age values of interest -- 0, the 3 knots and 80 (the largest age in the set)

age.knots=c(0,25,40,65,80)

# Now let's predict wages for these 5 values, with standard errors
preds=predict(fit.piecewise,list(age=age.knots), se=T)

# Note also that we assign a variable name "age" to the age.knot list because that's the predictor variable name stored in the fit.piecewise object. 

# Now, let's plot all the data using gray dots
plot(age,wage,col="gray")

# Now let's draw blue lines between the knots, which will show the picewise linear model line by connecting the dots between knots

lines(age.knots,preds$fit,col="blue",lwd=2)

# Lower and upper confidence interval lines
lines(age.knots,preds$fit-2*preds$se.fit,col="red",lwd=1)
lines(age.knots,preds$fit+2*preds$se.fit,col="red",lwd=1)
# A little "tail wagging, but not as much as with the polynomial"


## Splines

# The piecewise linear model above is very interpretable, and tend to has better fit than polynomials and step functions because we can set as many knots as we want and therfore control the slopes in the various resulting segments. But if we are not so interested in interpretation, and are more interested in making predictions, regression splines are an alternative option. Spline regressions are easier to formulate and we can not only fit linear splines, but also polynomial splines tjat connect knots with curves, rather than lines. Naturally, interpretation becomes almost impossible as we include polynomial splines, but the prediciton can be more accurate some times because the regression line can follow the data more precisely (but be careful with overfitting). Let's take a look.

library(ISLR) # Needed to acces the Wage data set
library(splines) # Needed to fit spline models
attach(Wage)

# Linear Spline Regression

# We use the bs(){splines} function, which builds polynomial splines at the specified cut points. "degree=1" specifies a linear spline,whereas higher degrees specify polynomials

fit.x1=lm(wage~bs(age,knots=c(25,40,60), degree=1),data=Wage)

# This model fits wage as a linear function of age, so it will return 4 coefficients -- 1 for age and then 1 for each of the three segments after each knot. That is, if d=1 (degree 1) and K=3 (knots) there will be K+1=4 coefficients (one for each segment). 

summary(fit.x1) # Take a look

preds=predict(fit.x1,newdata=list(age=age.grid),se=T)
plot(age,wage,col="gray")
lines(age.grid,preds$fit,col="blue",lwd=2)

# You should see 4 different regression lines changing at the knots, almost identical to the piecewise linear model above.

preds=predict(fit.x1,list(age=age.knots),se=T)
# Note: read the red warning -- it's not an error, just a warning

preds # Take a look at the predicted wages at the knots
plot(age,wage,col="gray")
lines(age.knots,preds$fit,col="blue",lwd=2)

# Confidence intervals
lines(age.knots,preds$fit-2*preds$se.fit,col="red",lwd=1)
lines(age.knots,preds$fit+2*preds$se.fit,col="red",lwd=1)

# Another way to locate the knots

# In the model above we arbitrarily set the knots at ages 25, 40 and 60. However if we would like to split the spline segments and knots evenly we can use the "df" (degrees of freedom) parameter, rather than the "knots" parameter. If df=4, this means that there are 4 spline segments with 3 knots in between. Take a look:

dim(bs(age,df=4, degree=1)) # Creates 4 partitions with 3 knots

# Check out the knot locations
attr(bs(age,df=4, degree=1),"knots") # Knots are evenly spaced
attr(bs(age,df=6),"knots") # Defalut degree is 3 or cubic

# Notice that this also provides 3 knots because 3 degrees of freedom are taken by the 3 powers of age

# Let's fit a linear spline with df=4

fit.x1.df=lm(wage~bs(age,df=4,degree=1),data=Wage)
summary(fit.x1.df)
preds=predict(fit.x1.df,newdata=list(age=age.grid),se=T)
plot(age,wage,col="gray")
lines(age.grid,preds$fit,col="blue",lwd=2)

# Confidence intervals
lines(age.grid,preds$fit-2*preds$se.fit,col="red",lwd=1)
lines(age.grid,preds$fit+2*preds$se.fit,col="red",lwd=1)
# You should see a similar piecewise linear model but with 4 knots evenly spaced.


## Polynomial and Cubic Splines

# For some reason "cubic" splines are very popular. One of the reasons is that a polynomial of power 3 provides enough curves, inflexion points, peaks and valleys to fit most data patterns. Beyond the power of 3 the spline becomes too "wiggly", overfitting, and almost impossible to interpret. This is why the B-Spline function bs() uses a polynomial degree default of 3, or a "cubic spline" but, naturally, you can change this with the "degree" attribute.The next model fits a cubic spline, i.e., degree=3

fit.x3=lm(wage~bs(age,knots=c(25,40,60)),data=Wage) 

# Technical Note: the bs() function generates a B-Spline Basis function which is a convenient and simple way to model a polynomial spline. The most popular polynomial spline is the cubic spline, so I refer to cubic splines in this explanation, but the principle applies to any polynomial. The idea is to fit a separate cubic regression in each of the spline segments. But formulating separate cubic regressions is too complex and uses too many degrees of freedom. 

# The B-Spline approach simplifies this by estimating a general cubic model for all the data, and then estimating a cubic term for each segment, which specifies how much the coefficient of the cubic term changes in each segment. For convenience, this segment correction is only applied on the cubic term (or highest polynomial term), thus simplifying the model. For example, the model above will yield 7 coefficients (or 1+d+k coefficients for a B-spline polynomial model of degree d with k knots):

# 1. The first coefficient is the regression intercept

# 2. The next 3 coefficients (1-3) are for x, x^2 and x^3 (or d 
#   coefficients for x to x^d in a d polynomial)

# 3. The next 3 coefficients (4-6) are for the basis function for
#   each of the 3 knots (or k coefficients for k knots), that is for:
#   Knot 1: (x-k1)^3*I(x-k1)
#   Knot 2: (x-k2)^3*I(x-k2) and
#   Knot 3: (x-k3)^3*I(x-k3)
#   Knot n: (x-kn)^3*I(x-kn) (for more than 3 knots)

summary(fit.x3) # Take a look

# This is difficult to interpret, but the good news is that if you are using cubic splines is because your analysis goal is predictive accuracy, not interpretation.

# Now let's calculate the predicted values and plot them:

preds=predict(fit.x3,newdata=list(age=age.grid),se=T)

# Note: we are using the age.grid values (which contain all unique ages in the data) rather than age.knots because we are no longer plotting straight lines between knots (the spline is curvilinear)

plot(age,wage,col="gray")
lines(age.grid,preds$fit,col="blue",lwd=2)

# Notice that we have a curvilinear model, but it really contains 4 separate curves joined at the knots. 

# Confidence intervals, this time with "dashed" lines

lines(age.grid,preds$fit+2*preds$se, col="red", lty="dashed")
lines(age.grid,preds$fit-2*preds$se, col="red", lty="dashed")


## Natural Cubic Splines

# Polynomial splines are notorious for having high variance at the beginning and tail ends of the data range, as exemplified in the plot above. A "Natural Spline" makes a simple correction to reduce this problem by forcing the first and last segments to a straight line, rather than a curve.

# The ns() function produces natural cubic splines (so there is no "degree" attribute with this function)

fit.ns=lm(wage~ns(age,df=4),data=Wage)
preds.ns=predict(fit.ns,newdata=list(age=age.grid),se=T)

# Let's first superimpose a natural spline line in the current plot
lines(age.grid, preds.ns$fit,col="green",lwd=2)

# Now let's graph a clean plot for the natural spline
plot(age,wage,xlim=agelims,cex=.5,col="darkgrey")
title("Natural Cubic Spline")
lines(age.grid,preds.ns$fit,col="green",lwd=2)

# Confidence intervals
lines(age.grid,preds.ns$fit-2*preds.ns$se,col="red",lwd=1,lty="dashed")
lines(age.grid,preds.ns$fit+2*preds.ns$se,col="red",lwd=1,lty="dashed")


## Smoothing Spline

# A quick spline Summary:

# A piecewise spline fits a different model in each segment delimited by knots, but the lines of two contiguous segments don't connect at the knot

# A spline forces these segment models to connect at the knots using basis functions or other means. But the model may have high variance at the head and tail ends of the curve. Also, the slope of the model at the right and left side of the knots will be different.

# A natural spline minimizes the first problem by forcing the first and last segments to a straight line

# A smoothing spline addresses the second problem by forcing the curve to have the same slope at the left and right and all around a each knot

# This model specifies an arbitrary df=16
fit.smooth1=smooth.spline(age,wage,df=16) 
fit.smooth1 
# See how the model find the lambda and CV corresponding to df=16

# This model lets cross-validation find the best lambda
fit.smooth2=smooth.spline(age,wage,cv=TRUE) 
fit.smooth2$lambda # The best lambda
fit.smooth2$df # And the corresponding degrees of freedom

# Let's plot the results

plot(age,wage,xlim=agelims,cex=.5,col="darkgrey")
lines(fit.smooth1,col="red",lwd=2)
lines(fit.smooth2,col="blue",lwd=2)
title("Smoothing Spline")
legend("topright",legend=c("16 DF","6.8 DF"),
       col=c("red","blue"),lty=1,lwd=2,cex=.8)


## Local Regression

# Try on your own -- We are not focusing on local regression in this class, but here are some R commands if you wish to model one

# loess(){stats} fits local regressions

fit.local=loess(wage~age,span=.2,data=Wage) 
fit.local.2=loess(wage~age,span=.5,data=Wage)
plot(age,wage,xlim=agelims,cex=.5,col="darkgrey")
title("Local Regression")

lines(age.grid,predict(fit.local,data.frame(age=age.grid)),
      col="red",lwd=2)

lines(age.grid,predict(fit2,data.frame(age=age.grid)),
      col="blue",lwd=2)

legend("topright",legend=c("Span=0.2","Span=0.5"),
       col=c("red","blue"),lty=1,lwd=2,cex=.8)


## Generalized Additive Models (GAMs)

# Try on your own

# In OLS regression, if the predictors are truly independent with 0 correlation, then it makes no difference to fit several individual simple linear regression models, one for each variable, than fitting a multivariate model with all the variables. The coefficients in both modeling options should be identical. 

# Also, the sum of R squares of the individual single models will equal the R square of the multivariate model. However, when there is some correlation among the predictors, this does not hold true any more. Reduced models will be more biased due to corrlation, and larger models will begin to experience multicollinearity, high variance and other dimensionality problems.

# The idea behind GAMs is that, since we can add individual single models into a multivariate full model, you could add instead different transformations (i.e., basis functions) for each variable. Some variables can be modeled as polynomials, some as splines, others as natural cubic splines, and so on.

# Again, GAM models are almost impossible to interpret, but they can help improve predictive accuracy

# One way to do this is to simply use the lm() function with a different basis function for each variable or not, as needed

gam1=lm(wage~ns(year,4)+ns(age,5)+education,data=Wage)

# But the {gam} library provides more options

install.packages("gam") # If not installed already
library(gam)

# We use the s() function for smoothing splines: Year with 4 df's and age with 5 df's We leave education as is (it is a qualitative variable)

gam.m3=gam(wage~s(year,4)+s(age,5)+education,data=Wage) 
par(mfrow=c(1,3))
plot(gam.m3, se=TRUE,col="blue") # Plot each variable in gam.m3

# We can also plot non-gam objects (such as gam1 which is an lm object) with plot.gam

plot.gam(gam1, se=TRUE, col="red")

# We can fit a number of models gam.m1=gam(wage~s(age,5)+education,data=Wage)
gam.m2=gam(wage~year+s(age,5)+education,data=Wage)

# And then test them with an F test with anova()
anova(gam.m1,gam.m2,gam.m3,test="F")

# Note that gam.m2 is superior to gam.m1, but gam.m3 does not increase predictive power

summary(gam.m3) # Take a look at the summary

# Now let's make some predictions
preds=predict(gam.m2,newdata=Wage) # Predicting on the full training set

# To include local regression in GAM use the lo() function Notice that we use both, the s() function on year and lo() on age

gam.lo=gam(wage~s(year,df=4)+lo(age,span=0.7)+education,data=Wage)
plot.gam(gam.lo, se=TRUE, col="green")

gam.lo.i=gam(wage~lo(year,age,span=0.5)+education,data=Wage)
install.packages("akima")
library(akima)
plot(gam.lo.i)


## GAM and Logistic Regression

# Try on your own

# We can easily fit a logistic model using the I() function in the dependent variable

gam.lr=gam(I(wage>250)~year+s(age,df=5)+education,
           family=binomial,data=Wage)
summary(gam.lr)

par(mfrow=c(1,3))
plot(gam.lr,se=T,col="green")
table(education,I(wage>250))

gam.lr.s=gam(I(wage>250)~year+s(age,df=5)+education,
             family=binomial,data=Wage,
             subset=(education!="1. < HS Grad"))
plot(gam.lr.s,se=T,col="blue")


#### 8. CLASSIFICATION MODELS ####


### ISLR Chapter 4 Lab: Classification -- Logistic Regression, LDA, QDA, and KNN

# Classification models predict outcomes that are either binary or categorical. There are two broad categories of classification models -- association and tree based. In this section we cover association models based on regression and discriminant analysis methods.

# We will be using the Stock Market (Smarket) data set frequently in this section. A few notes are in order.

library(ISLR) # Contains the Smarket data set
attach(Smarket)

?Smarket # Review the variables in this data set.
dim(Smarket) # Retrieve the dimensions of the Smarket data table
# 1250 observations and 9 variables

# This data set does not yield very interesting results in logistic models but the results illustrate a few important points. It also illustrates the use of lag transformations in logistic models. Let's explore the data

names(Smarket)
head(Smarket)

# One important thing to note is that the variable "Direction" is categorical, not binary. So, we have two choices, create a binary variable called "Up" =1 when Direction is up and 0 otherwise. But in the example below we don't make conversions until later and we let R take care of this for us.

summary(Smarket)

# To plot correlation scaterplots of the data
pairs(Smarket) 

# Will give an error because the variable Direction is not numeric
cor(Smarket) 

# Remove that variable from the correlation matrix
cor(Smarket[,-9]) 

# We can use the ggpairs(){GGally} function instead, since it works with categorical variables too.

library(GGally)
ggpairs(Smarket)

## Binomial Logistic Regression

# The outcome in binary predictive logistic model is one of two values: 0 or 1; yes or no; success or failure; approve or disapprove; etc.

# The syntax for logistic regression is the same as lm(){stats}, but it uses the glm(){stats} function rather than the lm() function. glm() stands for "Generalized Linear Model", which covers a number of linear regression models and various transformations of the dependent variable (e.g., logistic). 

# A linear model with no transformation of the dependent variables estimated with glm() and a "gaussian" distribution yields the exact same results as OLS with the lm() function. But glm() supports other distributions and transformations of the dependent variable. The "link" function is the type of transformation of the dependent variable. 

# Different regression methods require specific "model family" and "link" function parameters:

# - Binomial Logistic regression is family=binomial(link="logit")
# - OLS regression is family=gaussian(link="identity")
# - Binomial Probit regression is family=binomial(link="probit")
#   Probit stands for "Probability Unit" and it works just like 
#   logistic, except that it uses a different transformation 
#   function for Y. 
# - Count data models uses family=poisson(link="log")
            
glm.fit = glm(Direction~
              Lag1+Lag2+Lag3+Lag4+Lag5+Volume,
              data=Smarket,
              family=binomial(link="logit"))

# Let's look at the coefficient plot

install.packages("coefplot") # If not installed already
require(coefplot)

coefplot(glm.fit) # Nice function to display coeffients visually

# Note that, visually, all the 95% confidence intervals cross the 0 mark, so none of the coefficients are significant whe all lag variables are included in the model.

# Let's look at fit statistics

summary(glm.fit) # Let's look at summary statistics

# Sure enough, none of the coefficients are significant

logLik(glm.fit) # Get the log-likelihood
-2*logLik(glm.fit) # Should be equal to the residual deviance, or just
deviance(glm.fit) # Should yield the same value

# AIC = deviance + penalty, so it should be somewhat higher than the deviance
AIC(glm.fit) 

# The penalty is 2*Number of variables in the model.Smaller deviance and AIC are better; it means that there is a smaller likelihood that the predicted values deviate from actual values (just like MSE), that is, how much it is not explained by the model.

log.odds = coef(glm.fit) # To get just the coefficients
log.odds # They are very close to 0

# To convert Log-Odds to multiplicative change in odds
odds <- exp(coef(glm.fit))
odds # Naturally, they are very close to 1

# TO convert odds to probabilities
prob = odds/(1+odds) 
prob # Around 50%, almost like flipping a coin

cbind(log.odds, odds, prob) # Check them out together

# To get the 95% confidence intervals of Log-Odds coefficients
confint(glm.fit)

# exp(x) = e^x -- converts log-odds into odds;The 95% confidence interval of odds:
exp(confint(glm.fit)) 

# 95% confidence interval for the probabilities
exp(confint(glm.fit))/(1+exp(confint(glm.fit))) 

# The predict() function outputs (by default) predicted values for all observations in the training data
glm.probs=predict(glm.fit,type="response")
# type="response" attribute gives the "probability" of Y=1

glm.probs[1:10] # List first 10

# To display what 0 and 1 mean in the response variable
contrasts(Direction) 

# Let's convert predicted values into a label "Up" if the probability is > 50%, "Down" othersies

glm.pred = ifelse(glm.probs>0.5, "Up", "Down")
glm.pred

# Confusion matrix

# To cross tabulate Prediction (probabilities) with Direction (actual)
conf.mat <- table(glm.pred,Direction) 
conf.mat

# Proportion of observations in the diagonal (i.e., correct predictions)
Error.Rate=(457+141)/1250 
Error.Rate # Check it out

# Instead of reading numbers, you can use the generic table indices for the off-diagonal table elements:

Error.Rate=(conf.mat[2,1]+conf.mat[1,2])/length(glm.pred)
Error.Rate

# Sensitivity -- rate of correct positives

glm.sensitivity=507/(141+507) # Proportion of correct positives
glm.sensitivity
# Or
glm.sensitivity=conf.mat[2,2]/(conf.mat[1,2]+conf.mat[2,2])
glm.sensitivity

# Specificity -- rate of correct negatives

glm.specificity=145/(145+457) # Proportion of correct negatives
glm.specificity
# Or
glm.specificity=conf.mat[1,1]/(conf.mat[1,1]+conf.mat[2,1])
glm.specificity

# False Positives -- 1 - specificity

glm.false.pos <- 1 - glm.specificity
glm.false.pos

glm.fit.stats <- 
  c(Error.Rate, glm.sensitivity, glm.specificity, glm.false.pos)
names(glm.fit.stats)=
  c("Error Rate", "Sensitivity", "Specificity", "False Positives")

glm.fit.stats

# Classification threshold (lambda)

# Note: the glm.probs>0.5 defines the "threshold" for classification of the predictive model.

# We can tune this value depending on the model needs. For example, if we want to be conservative in our predictions a value of glm.probs>0.6 will only classify an observation as "Up" or 1 if the predicted probability is greater than 60%.

glm.pred.cons <- ifelse(glm.probs>0.60, "Up", "Down")
glm.pred.cons

# To get the "training error rate" (proportion of off diagonal values):

1-mean(glm.pred.cons==Direction) 
mean(glm.pred.cons!=Direction) # Same thing

# Compare with the conservative prediction
conf.mat.cons <- table(glm.pred.cons,Direction)
conf.mat.cons # Check out the dramatic changes
# Conclusion -- the threshold really matters

# Mean when prediction values match the actual Direction
mean(glm.pred.cons==Direction) 

# Mean when prediction values DON'T match the actual Direction
# i.e., the Error Rate
mean(glm.pred.cons!=Direction) 

# Let's build a confusion matrix for the conservative predictions

Error.Rate.cons <- (conf.mat.cons[2,1]+conf.mat.cons[1,2])/length(glm.pred.cons)
Error.Rate.cons # Same as above

glm.sensitivity.cons <- 
  conf.mat.cons[2,2]/(conf.mat.cons[1,2]+conf.mat.cons[2,2])

glm.specificity.cons <- 
  conf.mat.cons[1,1]/(conf.mat.cons[1,1]+conf.mat.cons[2,1])

glm.false.pos.cons <- 
  1 - glm.specificity.cons

glm.fit.stats.cons <- 
  c(Error.Rate.cons, glm.sensitivity.cons, glm.specificity.cons, glm.false.pos.cons)
names(glm.fit.stats.cons)=
  c("Error Rate", "Sensitivity", "Specificity", "False Positives")

glm.fit.stats.cons

glm.fit.stats.compare <- rbind(glm.fit.stats, glm.fit.stats.cons)
glm.fit.stats.compare

# Now, let's create a training model with part of the data and test it with the holdout data.

# In this example, we will use data before 2005 for the training subsample and everything else for testing

train=(Year<2005) # Creates a vector mamed "train"

# The train vector above contains TRUE/FAlse values for each observation, TRUE for Year<2005 and FALSE otherwise. This is called a "Boleean" vector. Take a look:

train # Check it out

# Boolean vectors are very useful to partition the data. For example, to creates a holdout set with all obvervations not on the training set

Smarket.2005=Smarket[!train,] 

# Inspect the test data set, it has 252 observations and 9 variables
dim(Smarket.2005) 

# Use train to get the data in the training set an !train to get data not in the training set. For example, this creates a vector with the values of the Direction variable for the hold out data set, Which we will use shortly to build the confusion matrix.

Direction.2005=Direction[!train] 
Direction.2005 # Check it out

# Let's train the model using only the training data set

glm.fit=glm(Direction~
            Lag1+Lag2+Lag3+Lag4+Lag5+Volume,
            data=Smarket,
            family=binomial,
            subset=train)

summary(glm.fit)

# Let's predict values in the holdout set
glm.probs=predict(glm.fit,Smarket.2005,type="response")

# First, create a test vector with all values equal to "Down"
glm.pred=rep("Down",252) 

# Change the value to "Up" of the predicted probability is > 0.5
glm.pred[glm.probs>.5]="Up" 

# Confusion matrix predicted vs. actual (i.e., Direction)
table(glm.pred,Direction.2005) 
mean(glm.pred==Direction.2005) # Correct rate
mean(glm.pred!=Direction.2005) # Error rate

# Let's do some predictions with a reduced model with only Lag1 and Lag2

# Do this part on your own

glm.fit=glm(Direction~
            Lag1+Lag2,
            data=Smarket,
            family=binomial,
            subset=train)

summary(glm.fit)

glm.probs=predict(glm.fit,Smarket.2005,type="response")
glm.pred=rep("Down",252)
glm.pred[glm.probs>.5]="Up"

table(glm.pred,Direction.2005)
mean(glm.pred==Direction.2005) # Correct rate
mean(glm.pred!=Direction.2005) # Error rate

# Let's make a prediction for 3 observations with data on Lag1 and Lag2

predict(glm.fit,newdata=data.frame(Lag1=c(1.2,1.5),
                                   Lag2=c(1.1,-0.8)),type="response")



## EXAMPLE: more interesting Logistic model with South African heart desease data

browseURL("http://statweb.stanford.edu/~tibs/ElemStatLearn/datasets/SAheart.info.txt")

heart <- 
  read.table("http://statweb.stanford.edu/~tibs/ElemStatLearn/datasets/SAheart.data",
  sep=",",head=T,row.names=1)

attach(heart)
head(heart)

# Logistic model predicting coronary heart desease
heart.fit = glm(chd ~ ., family=binomial, data=heart )
summary(heart.fit)

# Looks like tobacco, ldl, family history, type a and age are the strongest predictors of coronary heart desease (chd). Interestingly Once you controll for these factors obesity and alcohol are not significant predictors. Take a closer look:

require(coefplot)
coefplot(heart.fit)

# You can see in the plot that some variables have confidence intervals that don't cross the 0 mark, i.e., they are significant

# Fit statistics

-2*logLik(heart.fit) # 2LL
deviance(heart.fit) # Should yield the same value
AIC(heart.fit) # 2LL + 2*Number of variables

# Transforming coefficients
log.odds = coef(heart.fit) # To get just the coefficients
log.odds # Check it out

# To convert Log-Odds to multiplicative change in odds
odds <- exp(coef(heart.fit)) 
odds # Check it out

prob = odds/(1+odds) # TO convert odds to probabilities
prob # Check it out

cbind(log.odds, odds, prob) # Check them out together

# Confidence intervals

# To get the 95% confidence intervals of Log-Odds coefficients
confint(heart.fit) 

# (Log-Odds^e) -- the 95% confidence interval of odds
exp(confint(heart.fit)) 

# Get predicted values with the training data
heart.probs=predict(heart.fit,type="response") 
# type="response" above gives the "probability" of Y=1
heart.probs[1:10] # List first 10

# Confusion matrix

# Convert probability to prediction
heart.pred = ifelse(heart.probs>0.5, 1,0) 
conf.mat.heart <- table(heart.pred,chd) # To cross tabulate Prediction with Actual
conf.mat.heart

heart.error <- (conf.mat.heart[2,1]+conf.mat.heart[1,2])/length(glm.pred.hear)

heart.sensitivity <- 
  conf.mat.heart[2,2]/(conf.mat.heart[1,2]+conf.mat.heart[2,2])

heart.specificity <- 
  conf.mat.heart[1,1]/(conf.mat.heart[1,1]+conf.mat.heart[2,1])

heart.false.pos <- 
  1 - heart.specificity

heart.fit.stats <- 
  c(heart.error, heart.sensitivity, heart.specificity, heart.false.pos)

names(heart.fit.stats)=
  c("Error Rate", "Sensitivity", "Specificity", "False Positives")

heart.fit.stats


## Mutinomial Logistic Regression

# This code is not in the textbook

# A multinomial logit model is identical to a binomial logit model, except that the categorical outcome variable has more than 2 possible values. For example, suppose that you are trying to predict when people will buy rural, suburban or urban homes. In this case, the dependent variable has 3 possible values. This model can be easily fitted using 2 binomial logit models. First, you create select a baseline or reference value (e.g., rural) and then create dummy variables for the two other categories (i.e., suburban and urban). You then build a binomial logit model with suburban (=1 if suburban, 0 otherwise) and estimate it. You then do the same with urban (=1 if urban, 0 otherwise). Each regression will give you the effect on the log odds of someone buying a suburban or rural house respectively.

# This is a valid approach, but since you fit 2 separate models you get separate fit statistics for each of the models. There are statistical routines that can extimate the two binomial logit models together and give you one set of fit statistics for the whole model.

# More generally, a multinomial model is one in which the outcome variable has K categorical values. In our example above K = 3. This model is fit with a multinomial logistic regression composed of K-1 binomial logit models. There are R packages and functions that will estimate all K-1 models jointly. The most popular ones are:

# multinom(){nnet}; mlogit{mlogit}; and 

# {VGAM} package (Vector Generalized and Additive Models) has the vglm() function (Vector Generalized Linear Model), which runs multinomial logistic and other categorical regressions

# ASIDE: two other packages to fit multinomial logistic models: multinom(){nnet}, glmnet(){glmnet}

install.packages("VGAM") # If not installed already
library(VGAM) # Contains the vglm() function
library(car) # Contains the Womenlf data set we use below

# Data set about Women's Labor Force Participation
attach(Womenlf)
head(Womenlf)
? Womenlf

# Let's fit a model for labor participation, based on husband's income,and children in the household

vglm.fit = vglm(partic~
                hincome+children, 
                family=multinomial(refLevel=1), 
                data=Womenlf)

# Notice the attribute refLevel=1
levels(Womenlf$partic)
# Which corresponds to "fulltime" and can be changed as needed

vglm.summary = summary(vglm.fit)
vglm.summary

# Interpretation: 

# The coefficients in multinomial logit, just like in binomial logit, show the effect of a 1 unit increase in the predictor
# variable on the log-odds of the dependent variable. But this is the difference:

# - In binomial logit, the coefficient is about the log-odds of the response variable being 1 (relative to 0, of course)

# - In multinomial logit, the coefficient is about the log-odds of the response variable being in that category, relative to  the reference category (i.e., the response variable left out of the one specified with the "refLevel" attribute)

# Fit Statistics, similar to binomial logistic with glm()

logLik(vglm.fit) # Log-likelihood
-2*logLik(vglm.fit) 
# Should be equal to the residual deviance
deviance(vglm.fit) # Should yield the same value
AIC(vglm.fit) # Akaike Information Criterion = deviance+2*NumVariables

# Let's manipulate the coefficients a bit

coef.log.odds = coef(vglm.fit) # Log Odds
coef.log.odds # Take a look

# Notice that each variable has 2 values. Since we have 3 categories in the response variable and the first one was left out as the reference variable, the first coefficient is for the log odds of the second response category; and the second one is for the third response category.

# Now let's get the odds and probabilities

coef.odds = exp(coef.log.odds) # Odds
coef.prob = coef.odds/(1+coef.odds) # Probabilities
coef.all = cbind(coef.log.odds, coef.odds, coef.prob) # All 3
coef.all # Tale a look

# Same thing -- 2 coefficients for each variable; we would get 3 coefficients if we had 4 response categories, and so on.

# Let's find predicted values

pred.log.odds = predictvglm(vglm.fit, newdata=NULL, se.fit = TRUE)

# Notes: newdata can be used to specify a test or new data set to predict if omitted or NULL the predictions are done on the training set

pred.log.odds # Take a look

# Just like with the coefficients, we get 2 predictions for each observation -- one for the log-odds of being in the second category (compared to the first) and the other for the third category.

# Let's manipulate the predicted values

pred.log.odds$se.fit # Standard errors
pred.log.odds$fitted.values # Predicted values, log odds
pred.odds = exp(pred.log.odds$fitted.values) # Predicted odds
pred.prob = pred.odds/(1+pred.odds) # Predicted probabilities
pred.all = cbind(pred.log.odds$fitted.values, 
                 pred.odds, pred.prob)

# vglm() reports the above data without column names, let's create them

colnames(pred.all)=
  c("LogOdds2","LogOdds3", "Odds2", "Odds3", "Prob2", "Prob3")

pred.all # Take a look


## Linear Discriminant Analysis (LDA)

require(ISLR) # Needed for the Smarket data set
require(MASS) # Contains the lda(){MASS} function
attach(Smarket)

train=(Year<2005) # Creates a vector mamed "train" as we did before
Smarket.2005=Smarket[!train,] # As we did before
Direction.2005=Direction[!train] # As we did before

# Let's an LDA model with training data from the Smarket data set using the lda() function

lda.fit=lda(Direction~Lag1+Lag2,data=Smarket,subset=train) 

# An alternative way to specify the training subset

lda.fit=lda(Direction~Lag1+Lag2,data=Smarket,subset=Year<2005) 

lda.fit # Show the output (including the coefficients)

# Let's inspect the plot, showing the LDA combinations that yield Up and Down

plot(lda.fit) 

# Let's now predict with the test data
lda.pred=predict(lda.fit, Smarket.2005)
names(lda.pred) # Print lda.pred attributes for reference
# Note: predict() returns 3 elements:

# (1) $class -- the outcome variable classification

lda.pred$class # Check out the predicted values

# (2) $posterior -- which is actually a matrix, with each 
#     column showing the posterior probability that the 
#     observation belongs to the first, second, etc. class; 
#     and 

head(lda.pred$posterior) # 2 columns, for "Down" and "Up"

# (3) $x which contains the linear discriminants (i.e., 
#     linear combination of the coefficients 
#     (beta1*lag1+beta2*lag2) reported in lda.fit above.
#     Check the posterior probabilities, in this case
#     it has 2 columns for Down and Up

head(lda.pred$x) 
# A large $x predicts "Up" and a small x predicts "Down". The cutoff for classification of "Up" vs. "Down" is the mean of the $x values, which should hover around (but not exactly at) 0.

# Let's build the confusion matrix

# Create a vector with just the predicted values of "class"
lda.class=lda.pred$class 

# Confusion matrix with predicted vs. actual (i.e., Direction)
lda.conf <- table(lda.class,Direction.2005) 
lda.conf

lda.correct <- mean(lda.class==Direction.2005) # Correct rate
lda.error <- mean(lda.class!=Direction.2005) # Error rate
lda.stats <- c(lda.correct, lda.error)
names(lda.stats) <- c("Correct", "error")
lda.stats

sum(lda.pred$posterior[,1]>=.5)
sum(lda.pred$posterior[,1]<.5)

lda.pred$posterior[1:20,1] # First column is "Down"
lda.pred$posterior[1:20,2] # Second column is "Up"

lda.class[1:20]


## Quadratic Discriminant Analysis (QDA)

# The syntax for the qda() function is identical to lda().

attach(Smarket)
train=(Year<2005) # As we did before
Smarket.2005=Smarket[!train,] # As we did before
Direction.2005=Direction[!train] # As we did before

qda.fit=qda(Direction~Lag1+Lag2,data=Smarket,subset=train)
qda.fit # It does not provide linear discriminants like LDA
qda.class=predict(qda.fit,Smarket.2005)$class

# QDA confusion matrix

qda.conf <- table(qda.class,Direction.2005)
qda.conf

qda.correct <- mean(qda.class==Direction.2005) # Correct rate
qda.error <- mean(qda.class!=Direction.2005) # Error rate
qda.stats <- c(qda.correct, qda.error)
names(qda.stats) <- c("Correct", "error")
qda.stats

both.stats <- rbind(lda.stats, qda.stats)
both.stats
# QDA does a better job than LDA with this data


## K-Nearest Neighbors (KNN)

# Complete all KNN code on your own

library(class) # needed for the knn() function

# KNN does estimation and prediction in one step, as opposed to Logistic, LDA and QDA. It requires 3 matrices and a scalar k: 

# 1. Training predictors;
# 2. Testing predictors; 
# 3. Training class vector (the y's)
# 4. Value of K (how many near neighbors to use)

# 1. Column bind the two training predictor variables
train.X=cbind(Lag1,Lag2)[train,]

# 2. Column bind the two test predictor variables
test.X=cbind(Lag1,Lag2)[!train,] 

# 3. Vector with response values ("Up" or "Down") in the training set
train.Direction=Direction[train] 
train.Direction # Check it out

# 4. k -- a smaller K is more overfitting; a larger K 
#   provides a smoother classifier boundary

set.seed(1) # To get repeatable results

# knn() function with its 3 matrix parameters, plus k
knn.pred=knn(train.X,test.X,train.Direction,k=1) 

table(knn.pred,Direction.2005) # Confusion matrix
mean(knn.pred==Direction.2005) # Accuracy rate
(83+43)/252 # Same result
mean(knn.pred!=Direction.2005) # Error rate

# Let's try 3 nearest neighbors
knn.pred=knn(train.X,test.X,train.Direction,k=3)
table(knn.pred,Direction.2005)
mean(knn.pred==Direction.2005) # Better

# Application to Caravan Insurance Data

dim(Caravan)
attach(Caravan)
head(Caravan)
summary(Purchase)
348/5822

# Note on standardization -- when the scale of items may be an issue, it is customary to standardize variables, by subtracting the mean and dividing by the standard deviation, so that the mean of the stanardized variable is now 0 and the standard deviation is 1 -- scale is no longer an issue.

# scale() standardizes data (exclude col 86, which is qualitative)
standardized.X=scale(Caravan[,-86]) 

var(Caravan[,1]) # Check the variance of the first column
var(Caravan[,2]) # Check the variance of the first column
var(standardized.X[,1]) # Variance of the standardized variable is 1
mean(standardized.X[,1]) # Mean is zero (or very, very small)
var(standardized.X[,2]) # Same thing

# Let's fit and predict in one pass. Also, let's use the first 1000 observations as the test set

test=1:1000 
train.X=standardized.X[-test,] # Matrix (1)
test.X=standardized.X[test,]  # Matrix (2)
train.Y=Purchase[-test] # Matrix (3)
test.Y=Purchase[test]
set.seed(1)

knn.pred=knn(train.X,test.X,train.Y,k=1)

mean(test.Y!=knn.pred) # Error rate
mean(test.Y!="No") # Number of people who buy insurance
table(knn.pred,test.Y)
10/(68+10) # Accuracy of Yes predictions only

knn.pred=knn(train.X,test.X,train.Y,k=3)
table(knn.pred,test.Y)
5/26

knn.pred=knn(train.X,test.X,train.Y,k=5)
table(knn.pred,test.Y)
4/(11+4) # Accuracy of Yes predictions only

# Let's use logistic regression with the same data to compare results

glm.fit=glm(Purchase~.,data=Caravan,family=binomial,subset=-test)
glm.probs=predict(glm.fit,Caravan[test,],type="response")
glm.pred=rep("No",1000) # Set all responses to "No"

# Use the classifier probability>0.5 set to "Yes"
glm.pred[glm.probs>.5]="Yes" 
# We are wrong about predicting "Yes" EVERY TIME

table(glm.pred,test.Y) 
glm.pred=rep("No",1000)

# Let's solve this problem by lowering the classifier threshold
glm.pred[glm.probs>.25]="Yes" 
table(glm.pred,test.Y)
11/(22+11) # Accuracy rate is 33.3% which is better


#### 9. DECISION TREES ####


### ISLR Chapter 8 Lab: Decision Trees

# Decision trees are mainly used for classification models, but they can also be used for association problems with regression trees. We focus primarily on classification trees, but we cover regression trees below for completeness.


## Regression Trees

library(MASS) # Contains the Boston data set
library(tree) # Needed to fit decision trees

# Say, for example, that you have 2 predictors. A regression tree will find which of the two variables divides the observations more accurately into two portions, and at which value of that variable, and then assigns a predicted value for each of the two portions equal to their respective response value mean. It then takes each of the two portions and further subdivides them, either with the same variable or the other variable, whichever separates the portion better. 

# The criteria for evaluating which variable to use for the split and at which value is based on minimizing the MSE. The process continues with further subdivisions of the data. Each subdividision portion is called a "leaf" and the splitting point is called a "node". In principle, one could continue the data splitting until each data point is a leaf, but this would overfit the data. The methods below help decide where to stop "growing" the tree using cross validation methods.

# Let's illustrate a regression tree with the Boston data set

set.seed(1) # To get replicable results

# Training set using the first 1/2 of the data
train = sample(1:nrow(Boston), nrow(Boston)/2) 

# Fit a regression tree on all the variables in the training set using the tree(){tree} function
tree.boston=tree(medv~.,Boston,subset=train) 

# Get a quick summary of variables used, terminal nodes and mean deviance (sum of squared errors)
summary(tree.boston) 
# The summary shows the number of terminal nodes and it's respective residual mean deaviance

# Now let's visualize the tree
plot(tree.boston) # Plot the tree
# Oops!! No labels
text(tree.boston,pretty=0) # Let's make it pretty and add labels

# Cross validation of tree results. Let's explore the CV for various pruned trees
cv.boston=cv.tree(tree.boston) 

# Let's plot tree size (number of terminal nodes) vs. deviance
# Note: type='b' is for "both", points and lines
plot(cv.boston$size,cv.boston$dev,type='b') 
# Notice that the lowest deviance is for the most complex tree

# But let's prune to just 5 terminal nodes
prune.boston=prune.tree(tree.boston,best=5) 
plot(prune.boston)
text(prune.boston,pretty=0)

# Now let's test the trained model on the other 1/2 test data (i.e., -train)

yhat=predict(tree.boston,newdata=Boston[-train,]) 
boston.test=Boston[-train,"medv"] # These are the actual values
boston.test # Take a quick look
plot(yhat,boston.test) # Let's plot predicted vs. actual
abline(0,1) # And draw a line
mean((yhat-boston.test)^2) # And calculate the MSE

# Note: the square root of the MSE is the standard error on the predicted values


## Classification Trees

# Classification trees work just like regression trees, but the response variable is binary (i.e., a classification). While decision are generally not as precise as logistic regression models, and despite the fact that they are not very useful for interpretation there is an abundance of sophisticated decision tree methods (e.g., Bootstrap Aggregation, Random Forests, Boosting, etc.), which can be quite accurate for prediction. 

# These tree methods differ on things like: how the tree branching happens; how much to grow a tree; when to prune the tree; which variables to use for splitting leaves; etc. We discuss some of these methods below. But first we start with just plain trees.

install.packages("tree") # If not installed already
library(tree) # Needed to fit classification trees
library(ISLR) # Contains the Carseats data set

# Carseats is simulated data set of child car seat sales in 400 stores
attach(Carseats) 
head(Carseats) # Take a quick look at the data

# For classification trees, if the response variable is not binary, we need to convert it to binary using some criteria,  for example Sales<=8K

# ifelse is a useful function for this
High=ifelse(Sales<=8,"No","Yes") # Storing the results in object "High"

# Add the results of "High" to the data
Carseats=data.frame(Carseats,High) 
head(Carseats) # Check out that the "High" variable was added

# Let's fit a tree on all the data, except Sales 

tree.carseats=tree(High~.-Sales,Carseats) 
# Inspect the number of knots, deviance and training error
summary(tree.carseats) 

# Note: the residual mean deviance is based on the log likelyhood function, the smaller the better. By itself, it is not a very useful fit statistic, but it is excellent to compare various tree modesl -- the model with the smallest deviance (between actual and predicted values is better)

# Now let's analyze the tree visually

plot(tree.carseats) # Display tree
text(tree.carseats, pretty=0) # Display data labels

# pretty=0 displays category names for categorical variables, rather than just a letter. please refer to
?text.tree
tree.carseats # Display the data for every leaf

# Let's now evaluate the test error

set.seed(2)

# Take 200 observations for the training set (you can try other training/test samplings)

train=sample(1:nrow(Carseats), 200) 
Carseats.train=Carseats[train,]
Carseats.train # Take a look
Carseats.test=Carseats[-train,] # And the rest for the test set.
Carseats.test # Take a look

# Let's create the "High.test" object from the "High (Yes/No)" object we computed for all the response values
High.test=High[-train]

# Note, the command above does not yield the opposite of High. Rather it creates the High.test vector with all the observations that are not in the training set (i.e., the test set). Remember that the brackets [] are used as an index, not for math operations

# Let's do some machine learning

# Fit the model on the training set
tree.carseats=tree(High~.-Sales,Carseats,subset=train) 
tree.carseats=tree(High~.-Sales,Carseats.train) # Alternatively
# Predict the test set
tree.pred=predict(tree.carseats,Carseats.test,type="class") 
table(tree.pred,High.test) # Confusion matrix
(86+57)/200 # Accuracy rate = 71.3%

# Let's explore pruning the tree

set.seed(3)

# cv.tree() does the cross validation of the various pruned trees

# Note: FUN=prune.misclass uses the misclassification error for cross validation and prunning. Othewise, the default is deviance

cv.carseats=cv.tree(tree.carseats,FUN=prune.misclass)
names(cv.carseats)

# Note: "dev" reports the cross validation error rate
cv.carseats 
# Note the tree with the smallest cross validation error ("dev")

# Let's inspect the tree visually

par(mfrow=c(1,2)) # Let's split the graphics screen

# Let's plot CV for each tree size
plot(cv.carseats$size,cv.carseats$dev,type="b") 

# Plot CV for various k-fold values
plot(cv.carseats$k,cv.carseats$dev,type="b") 

# Now prune tree back to 9 nodes
prune.carseats=prune.misclass(tree.carseats,best=9) 
plot(prune.carseats) # Plot the tree
text(prune.carseats,pretty=0) # With labels

# Let's evaluate the tree

# Predict on the test set
tree.pred=predict(prune.carseats,Carseats.test,type="class") 
table(tree.pred,High.test) # Confusion matrix
(94+60)/200 
# 77%, which is an improvement over the full tree and more interpretable


## Bootstrap Aggregation -- Bagging

# The tree methods illustrated in the remainder of this section rely on the modeling of more than one tree and then aggregating the result. The methods differ in what varies from tree to tree.

# Bagging stands for "bootstrap aggregation". Bootstrap means to draw a random sample to fit a tree, and then repeat this many times with new samples with replacement. Each tree includes all variables in the model and a subset of observations. The results are then aggregated. The rationale behind this method is that bootstrapping and aggregating reduces variance and tends to produce more accurate and stable results than single trees. The main tuning parameter in Bagging is the size of the random sample and the number of trees fitted and aggregated.

# As we discuss below, Bagging is a special case of Random Forest. The main difference is that in Random Forest, the number of variables m used to fit the individual trees is a subset of all the available variables p, so m<=p. In Bagging, m=p, thus a special case of Random Forest. Therefore, both methods use the same library and function randomForest(){randomForest}.

library(randomForest) 
?randomForest()
library(MASS) # Contains the Boston housing data set
set.seed(1) # To get repeatable results

# Let's re-create the Boston training subset we created above. No need to do this if you have not quit R since you computed the training sample above. Otherwise, re-creat "train"

train = sample(1:nrow(Boston), nrow(Boston)/2) 
boston.test=Boston[-train,"medv"]

# Let's fit a Bagging model (i.e., Random Forest with all variables included in the training data. 

# IMPORTANT: we are fitting a bagged regression tree, but the same method applies to bagged classification trees

bag.boston=randomForest(medv~.,data=Boston,subset=train,
                        mtry=13,importance=TRUE)

# Note: mtry=13 tells Random Forest to use 13 predictors, which is the full set, thus a Bagging model with m=p. The importance attribute is set to TRUE to obtain each variable's importance in reducing error

bag.boston # Take a quick look

# Notice that the model was fit on 13 variables and 500 trees

# Let's do predictions on the test set

yhat.bag = predict(bag.boston,newdata=Boston[-train,]) 
plot(yhat.bag, boston.test) # Then plot predicted vs. actual
abline(0,1) # Draw a line
mean((yhat.bag-boston.test)^2) # Get the mean squared error
# Notice that the MSE is almost 1/2 of the regression tree MSE

# To fit a model with a different number of trees, use the ntree=25 (for 25 trees, or any other number of trees)

bag.boston=randomForest(medv~.,data=Boston,subset=train,
                        mtry=13,ntree=25)

yhat.bag = predict(bag.boston,newdata=Boston[-train,])

mean((yhat.bag-boston.test)^2)
# Notice that the MSE is a bit higher than with 500 trees


## Random Forest

# Note: Again, Bagging is a special case of Random Forest. In Random Forest we use m sample predictors from a set of p available predictors such that m<=p. We also vary the m predictors from tree to tree to to reduce the correlation among the trees. The limitation of Bagging is that all trees are fitted with the same predictors, so results are likely to be somewhat correlated. Random Forest with m<p helps correct for this because every tree will be different.

# We use the same randomForest() function, but specify a smaller number of sampled predictors with "mtry" than the number of available predictors, i.e., m<p. If not specified, m=p/3 is the default.

set.seed(1) # To get replicable results

rf.boston=randomForest(medv~.,data=Boston,
                       subset=train,mtry=6,importance=TRUE)
rf.boston # Inspect the results

plot(rf.boston) # Notice how MSE declines as more trees are sampled
# It seems like 150 trees may be sufficient.

# Let's do predictions with the test data
yhat.rf = predict(rf.boston,newdata=Boston[-train,])

mean((yhat.rf-boston.test)^2)

# Note that the MSE for this model is even smaller than for the Bagged model

# One shortcoming of trees is that there are no coefficients or p-values to ascertain which variables have stronger effects. The importance() function helps overcome this problem by displaying the importance of each variable to the tree model.

importance(rf.boston) # To view the importance of each variable

# The 2 values of importance reported are:

# (1) Mean decreases in accuracy when the variable is 
#     excluded from the model

# (2) Decrease in "impurity" when the data is split by 
#     that variable, averaged over all trees

# Higher values are best for either

varImpPlot(rf.boston) # We can also plot the results

# The results show that overall community wealth (lstat) and house size (rm) are the most important predictors.


## Boosting

install.packages("gbm") # If not installed already
library(gbm) # Generalized Boosted Regression Models 
library(MASS) # Contains the Boston data set

# Like Bagging and Random Forest, Boosting models several trees and aggregates the result. Unlike Bagging and Random Forest, Boosting does not fit several random trees, but it fits an initial tree and then fit another one to explain the residuals (errors), then again, etc. 

# Bagging and Random Forest are considered "fast" learning methods because the best model is generated in the first few samples and subsequent trees may or may not improve the MSE, whereas Boosting is considered to be a "slow" learning method because every new tree builds upon and improves the prior tree. 

# The tunning parameter "lambda" (works just like shrinkage in Ridge and LASSO) controls the speed of learning.

# Aside: to understand this concept, imagine that you run an OLS regression with certain variables and you get some fairly large residuals (i.e., errors). You can then build another OLS regression model to explain (i.e., predict) those residuals. This new regression will explain some of the error variance, but will also yield new errors (smaller than the first ones, becasue some of the variance in the errors is already explained with the second model). 

# Then you can fit a third regression model to explain the new residuals, and so on. You can then aggregate all the regression models, which on the aggregate, will have small residuals. Boosting applies this concept when generating trees.
 
set.seed(1) # To get replicable results

# Let's fit a Boosting model on the Boston data. Use:

# - distribution="gaussian" (i.e., normal distribution) 
#   for regression models.

# - distribution="bernoulli" for classification models

# Let's fit a model with 5000 trees, limitting the depth of each tree to 4 and using all available predictors

boost.boston=gbm(medv~.,data=Boston[train,],
                 distribution="gaussian",n.trees=5000,
                 interaction.depth=4)

summary(boost.boston) # Provides relative influence stats and plot
# Note again, that lstat and rm are the most important variables

# Let's plot their partial dependencies to see how predicted price houses vary with lstat and rm

par(mfrow=c(1,2))
plot(boost.boston,i="rm")
plot(boost.boston,i="lstat")

# Let's now do predictions with the test data

yhat.boost=predict(boost.boston,newdata=Boston[-train,],n.trees=5000)
mean((yhat.boost-boston.test)^2) # Computing the means squared error
# The MSE is 14.62 (you may get a sligthtly different value), which is not much different than Bagged and Random Forest models

# Shrinkage -- Boosting has a similar "shrinkage" effect on variables just like Ridge and LASSO regression. The shrinkage applies over each tree model, including the first one. A small lambda shrinks he prior tree model more, thus making it less important for the final aggregated model (i.e., slow learning). Large lambdas give more weithg to the initial trees, thus learning fast.

# To vary the shrinkage factor (lambda) use the shrinkage attribute (the default is 0.01).

boost.boston=gbm(medv~.,data=Boston[train,],
                 distribution="gaussian",n.trees=5000,
                 interaction.depth=4,shrinkage=0.2,verbose=F)

# Now let's do predictions wiht the test data

yhat.boost=predict(boost.boston,newdata=Boston[-train,],n.trees=5000)
mean((yhat.boost-boston.test)^2)
# Not much different


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


#### Other Topics ####

# We will not cover these topics in this class, although I may give you a quick overview if time permits. But I provide the R code for these methods for you to explore if you wish. This code is mostly from the ISLR book and the topics are well explained in the book.


### ISLR Chapter 9 Lab: Support Vector Machines


## Support Vector Classifier

install.packages("e1071") # Contains several machine learning methods
library(e1071)

# Let's generate some observations in two classes, X and Y
set.seed(1)
x=matrix(rnorm(20*2), ncol=2)
y=c(rep(-1,10), rep(1,10))
x[y==1,]=x[y==1,] + 1
plot(x, col=(3-y)) 

# Note that the randomly generated data is not separable by a straight line

# We need to encode the response as a factor variable
dat=data.frame(x=x, y=as.factor(y)) 
# We now use the svm() function to fit a support vector classifier
svmfit=svm(y~., data=dat, kernel="linear", cost=10,scale=FALSE)

# the kernel="linear" argument is used to fit a support vector classifier the scale=FALSE tells SVM NOT to stadardize the variables. In some cases we may want to standardize the data and use scale=TRUE

# Let's plot the SVC fit
plot(svmfit, dat)

# svmfit is the fitted model output and the input data

# Note: the jagged line is really a straight line

# Also, note that the support verctors as noted as crosses -- to find out which ones they are:

svmfit$index

# To get some basic information on the model
summary(svmfit) 
# e.g., 7 support vectors, cost=10, 2 classes, 4 support vectors in 1 and 3 in the other

# Let's try a different cost, e.g., 0.1
svmfit=svm(y~., data=dat, kernel="linear", cost=0.1,scale=FALSE)
plot(svmfit, dat)
svmfit$index
summary(svmfit)

# Let's do cross validation with the tune() function available in the "e1071" library
set.seed(1)

# This is how we can test various cost values

tune.out=tune(svm,y~.,data=dat,kernel="linear",
              ranges=list(cost=c(0.001, 0.01, 0.1, 1,5,10,100)))

# This will display the cross validation errors for each model
summary(tune.out) 
# Note: the cross validation was done with 10-fold

# Best performance is with cost=0.1, but you can list the best model with these 2 commands:

bestmod=tune.out$best.model
summary(bestmod)

# We can use the predict() function to predict the class label of test observations

xtest=matrix(rnorm(20*2), ncol=2)
ytest=sample(c(-1,1), 20, rep=TRUE)
xtest[ytest==1,]=xtest[ytest==1,] + 1
testdat=data.frame(x=xtest, y=as.factor(ytest))

# Using the best model to predict with the test data
ypred=predict(bestmod,testdat) 
table(predict=ypred, truth=testdat$y)

# Let's try to predict with different cost values
svmfit=svm(y~., data=dat, kernel="linear", cost=.01,scale=FALSE)
ypred=predict(svmfit,testdat)
table(predict=ypred, truth=testdat$y)

# Now let's try data that is separable by a straight line
x[y==1,]=x[y==1,]+0.5
plot(x, col=(y+5)/2, pch=19)
dat=data.frame(x=x,y=as.factor(y))
svmfit=svm(y~., data=dat, kernel="linear", cost=1e5)
summary(svmfit)

plot(svmfit, dat)
svmfit=svm(y~., data=dat, kernel="linear", cost=1)
summary(svmfit)
plot(svmfit,dat)


## Support Vector Machine

# We proceed just like with support vector classifier, but using kernel="polynomial" or kernel="radial" depending on the desired fit method.

# Let's generate some random data

set.seed(1)
x=matrix(rnorm(200*2), ncol=2)
x[1:100,]=x[1:100,]+2
x[101:150,]=x[101:150,]-2
y=c(rep(1,150),rep(2,50))
dat=data.frame(x=x,y=as.factor(y))
plot(x, col=y)
# Obviously, the separating boundary is not linear

# Separate 1/2 of the data for the training set
train=sample(200,100)
svmfit=svm(y~., data=dat[train,], kernel="radial", gamma=1, cost=1)
plot(svmfit, dat[train,])
summary(svmfit)

# Given the large number of training errors in the fitted model. So, let's try a larger cost (at the expense of a more irregular decision boundary).

svmfit=svm(y~., data=dat[train,], kernel="radial",gamma=1,cost=1e5)
plot(svmfit,dat[train,])

# Let's inspect the cross validation errors for a few costs and gamma values

set.seed(1)
tune.out=tune(svm, y~., data=dat[train,], kernel="radial", 
              ranges=list(cost=c(0.1,1,10,100,1000),
                          gamma=c(0.5,1,2,3,4)))
summary(tune.out)

# Best model is with cost=1 and gamma=2

# Now let's predict on the test set (i.e., -train)

table(true=dat[-train,"y"], 
      pred=predict(tune.out$best.model,newx=dat[-train,]))


## ROC Curves

install.packages("ROCR") # Needed for ROC curves
library(ROCR)

# Quick function to plot and ROC curve for a given vector
rocplot=function(pred, truth, ...){
  predob = prediction(pred, truth)
  perf = performance(predob, "tpr", "fpr")
  plot(perf,...)}

# Note: use decision.values=T to obtain fitted values. Positive fitted values then the observations are assigned to one class. 

# Negative fitted values are assigned to the other class
svmfit.opt=svm(y~., data=dat[train,], kernel="radial",
               gamma=2, cost=1,decision.values=T)

# Now, the predict() function will output the fitted values
fitted=attributes(predict(svmfit.opt,dat[train,],
                          decision.values=TRUE))$decision.values

par(mfrow=c(1,2))
rocplot(fitted,dat[train,"y"],main="Training Data")

# Let's increase the gamma value to 50

svmfit.flex=svm(y~., data=dat[train,], kernel="radial",
                gamma=50, cost=1, decision.values=T)

fitted=attributes(predict(svmfit.flex,dat[train,],
                          decision.values=T))$decision.values

rocplot(fitted,dat[train,"y"],add=T,col="red")
# This gives a better model (hugging the corner more closely)

# Let's now try the ROC curves on the test data

fitted=attributes(predict(svmfit.opt,dat[-train,],
                          decision.values=T))$decision.values

rocplot(fitted,dat[-train,"y"],main="Test Data")

fitted=attributes(predict(svmfit.flex,dat[-train,],
                          decision.values=T))$decision.values
rocplot(fitted,dat[-train,"y"],add=T,col="red")

# Gamma=2 (svmfit.opt) does better with the test data


## Support Vector Machine with Multiple Classes

# svm() will use one vs. one approach for multiple classes. Let's generate some data

set.seed(1)

x=rbind(x, matrix(rnorm(50*2), ncol=2))
y=c(y, rep(0,50))
x[y==0,2]=x[y==0,2]+2
dat=data.frame(x=x, y=as.factor(y))
par(mfrow=c(1,1))
plot(x,col=(y+1))

svmfit=svm(y~., data=dat, kernel="radial", cost=10, gamma=1)
plot(svmfit, dat)

# Application to Gene Expression Data

library(ISLR)

# the Khan data set has xtrain, xtest, ytrain and ytest data sets already prepared

names(Khan) 
dim(Khan$xtrain)
dim(Khan$xtest)
length(Khan$ytrain)
length(Khan$ytest)
table(Khan$ytrain)
table(Khan$ytest)
dat=data.frame(x=Khan$xtrain, y=as.factor(Khan$ytrain))

# Let's try a linear kernel

out=svm(y~., data=dat, kernel="linear",cost=10)
summary(out)
table(out$fitted, dat$y)
# Note that there are no training errors (e.g., data is separable by a straight line)

# NOw let's try it in the test set

dat.te=data.frame(x=Khan$xtest, y=as.factor(Khan$ytest))
pred.te=predict(out, newdata=dat.te)
table(pred.te, dat.te$y)
# Now there are 2 test set errors


### ISLR Chapter 10 Lab: Principal Components Analysis & Clustering


## Principal Components for Descriptive Analytics

# Note: we have covered Principal Components for two applications in this class -- Principal Components Regression and Factor Analysis. But Principal Components is a popular statistical method that simply rotates the covariance matrix of a data set and it is used in a number of statistical applications. This section discusses the use of Principal Components for Descriptive Analytics. This is not the focus of this course but the R code is provide below for your enjoyment.

# Also note that the libraries and functions described in this section are different than the ones covered earlier. There are many paths to Rome.

# Let's look at the USArrests data in the base R pacakge
USArrests
# Rows in this data set are named by states in alphabetical order
states=row.names(USArrests)
states
names(USArrests) # These are the variables collected for each state

# Get the mean for each column (using 1 instead of 2 to get means by row)

apply(USArrests, 2, mean) 
apply(USArrests, 2, var) # Get the variance for each column

# Note that means and variances differ widely. This means that we need to scale variables before doing PCA. Otherwise the Assault variable would dominate the analysis.

# The prcomp() function does principal components in the base R package
pr.out=prcomp(USArrests, scale=TRUE) 

# Notice that we are scaling the variables to have standard deviation of 1. Also note: by default, prcomp() centers variables to have mean of 0

names(pr.out) # Check out the output variables for prcomp()
class(pr.out) # It shows that pr.out is a prcomp() object
summary(pr.out) # Shows various statistics of the principal components

pr.out$sdev # Standard deviations of the principal components

# Squaring the standard deviations gives us the variance explained or "eigenvalues"

pr.out.eigen = pr.out$sdev^2 
pr.out.eigen # Display the eigen values

# Note: one important reason to display eigen values is because it is used by the "Kaiser" criteria to decide how many principal componenents are good enoug. The Kaiser criteria is one of the most popular methods for this. Simply, the average eigen values equal 1 (because variables were scaled). The Kaiser criteria says that you should retain all the principal components with eigenvalues > 1 (i.e., above average variance). In this example, only PC1 meets this criteria.

pr.out$center # Variable means before centering
# Standard deviation (i.e., square root of variance) before scaling
pr.out$scale 
pr.out$rotation # Shows all the rotated principal components

# Display the scree plot
screeplot(pr.out, main="Scree Plot", xlab="Components") 
# Display the scree plot as a line diagram
screeplot(pr.out, type="line", main="Scree Plot") 
# Shows the data and the principal components in one diagram

biplot(pr.out, scale=0) 
# x is a matrix that contains the calculation of the principal component for each data point

pr.out$x 

# ASIDE -- Not in the textbook -- Varimax Rotation

# Note: principal components are often further rotated to "tweak" and cleanup the components a bit more. The rotation makes large factor loadings larger and small factor loadings smaller, such that the most correlated variables are easier to identify because they have larger factor loadings when rotated. The most popular rotation method is the one developed by Kaiser and is called "Varimax". Think of this as further rotating the already rotated principal components just a tad. This is how to rotate the principal components

pr.out.varimax=varimax(pr.out$rotation) 

# Now compare the two sets of principal components and note the the rotated components does a better job at grouping variables. This is a most popular application in survey analysis methods

pr.out.varimax # Varimax rotated components
pr.out$rotation # Original principal components

# Interesting fact: you can rotate the principal components 180 degrees and get the same results

dim(pr.out$x)
biplot(pr.out, scale=0)
pr.out$rotation=-pr.out$rotation # Flip the signs
pr.out$x=-pr.out$x
# The direction changes, but not the line orientation
biplot(pr.out, scale=0) 

# To compute the proportion of variance explained by each principal component, enter:
pve = pr.out.eigen/sum(pr.out.eigen) 
pve # Take a look

# Notice that the first principal component explains 62% of the variance in the data, not bad.

# To plot the proportion of variance explained:
plot(pve, xlab="Principal Component", 
     ylab="Proportion of Variance Explained", ylim=c(0,1),type='b')

# The "cumulative" proportion of variance is useful because it shows how much variance is explained by the first x components. This can be obtained with the cumsum() function
cumsum(pve)

# Notice that the first 2 principal components explain 86.7% of the variance

# Now let's plot this

plot(cumsum(pve), xlab="Principal Component", 
     ylab="Cumulative Proportion of Variance Explained", 
     ylim=c(0,1),type='b')

# Notice that the first 2 principal components


## K-Means Clustering

set.seed(2)
x=matrix(rnorm(50*2), ncol=2)
x[1:25,1]=x[1:25,1]+3
x[1:25,2]=x[1:25,2]-4
km.out=kmeans(x,2,nstart=20)
km.out$cluster

plot(x, col=(km.out$cluster+1), 
     main="K-Means Clustering Results with K=2", 
     xlab="", ylab="", pch=20, cex=2)

set.seed(4)
km.out=kmeans(x,3,nstart=20)
km.out

plot(x, col=(km.out$cluster+1), 
     main="K-Means Clustering Results with K=3", 
     xlab="", ylab="", pch=20, cex=2)

set.seed(3)
km.out=kmeans(x,3,nstart=1)
km.out$tot.withinss
km.out=kmeans(x,3,nstart=20)
km.out$tot.withinss


## Hierarchical Clustering

hc.complete=hclust(dist(x), method="complete")
hc.average=hclust(dist(x), method="average")
hc.single=hclust(dist(x), method="single")

par(mfrow=c(1,3))
plot(hc.complete,main="Complete Linkage", xlab="", sub="", cex=.9)
plot(hc.average, main="Average Linkage", xlab="", sub="", cex=.9)
plot(hc.single, main="Single Linkage", xlab="", sub="", cex=.9)

cutree(hc.complete, 2)
cutree(hc.average, 2)
cutree(hc.single, 2)
cutree(hc.single, 4)

xsc=scale(x)

plot(hclust(dist(xsc), method="complete"), 
     main="Hierarchical Clustering with Scaled Features")

x=matrix(rnorm(30*3), ncol=3)
dd=as.dist(1-cor(t(x)))

plot(hclust(dd, method="complete"), 
     main="Complete Linkage with Correlation-Based Distance",
     xlab="", sub="")

# NCI60 Data Example -- see textbook for explanation

# The NCI60 data
library(ISLR)
nci.labs=NCI60$labs
nci.data=NCI60$data
dim(nci.data)
nci.labs[1:4]
table(nci.labs)

# Principal components analysis on the NCI60 Data

pr.out=prcomp(nci.data, scale=TRUE)

Cols=function(vec){
  cols=rainbow(length(unique(vec)))
  return(cols[as.numeric(as.factor(vec))])
}

par(mfrow=c(1,2))
plot(pr.out$x[,1:2], col=Cols(nci.labs), pch=19,xlab="Z1",ylab="Z2")
plot(pr.out$x[,c(1,3)], col=Cols(nci.labs), pch=19,xlab="Z1",ylab="Z3")
summary(pr.out)

plot(pr.out)
pve=100*pr.out$sdev^2/sum(pr.out$sdev^2)

par(mfrow=c(1,2))
plot(pve,  type="o", ylab="PVE", 
     xlab="Principal Component", col="blue")

plot(cumsum(pve), type="o", ylab="Cumulative PVE", 
     xlab="Principal Component", col="brown3")

# Clustering the Observations of the NCI60 Data -- see textbook for explanation

sd.data=scale(nci.data)
par(mfrow=c(1,3))
data.dist=dist(sd.data)

plot(hclust(data.dist), labels=nci.labs, 
     main="Complete Linkage", xlab="", sub="",ylab="")

plot(hclust(data.dist, method="average"), labels=nci.labs, 
     main="Average Linkage", xlab="", sub="",ylab="")

plot(hclust(data.dist, method="single"), labels=nci.labs,  
     main="Single Linkage", xlab="", sub="",ylab="")

hc.out=hclust(dist(sd.data))
hc.clusters=cutree(hc.out,4)
table(hc.clusters,nci.labs)

par(mfrow=c(1,1))
plot(hc.out, labels=nci.labs)
abline(h=139, col="red")
hc.out

set.seed(2)
km.out=kmeans(sd.data, 4, nstart=20)
km.clusters=km.out$cluster
table(km.clusters,hc.clusters)
hc.out=hclust(dist(pr.out$x[,1:5]))

plot(hc.out, labels=nci.labs, 
     main="Hier. Clust. on First Five Score Vectors")

table(cutree(hc.out,4), nci.labs)