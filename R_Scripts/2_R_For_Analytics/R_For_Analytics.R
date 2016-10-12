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