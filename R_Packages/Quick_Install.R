#################################################################################
#                                                                               #
#                                                                               #
#                             Quick Package Install                             #
#                                                                               #
#                                                                               #
#################################################################################

## List of all required packages for ITEC 621
##
## Note: More can be added to this list as needed
packages <- c("car", "caret", "coefplot", "corrplot", 
              "ctv", "DataCombine", "GGally", "gbm", 
              "ggplot2", "glmnet", "HH", "Hmisc", 
              "ISLR", "lattice", "lm.beta", "lmtest", 
              "leaps", "MASS", "perturb", "pls", "psych", 
              "tree", "VGAM", "caret", "gam", "akima", 
              "e1071", "ROCR", "data.table", "XML", 
              "xlsx", "xlsxjars", "rJava")

## Use for loop to check if a package is installed rather 
## than trying to re-install a package every time
for (package in packages) {
  if (!package %in% row.names(installed.packages())) {
    message(sprintf("%s is not installed.  Trying to install now", package))
    install.packages(package, repos = "https://cran.rstudio.com")
  } else if (package %in% row.names(installed.packages())) {
    message(sprintf("%s already installed!!", package))
  }
}

## Double check to make sure everything ran correctly.  
## You can do this by re-running lines 23-30
##
## If you get an error like the one below you'll need to resolve it
##      
##      # ERROR: configuration failed for package ‘rJava’
##      # * removing ‘/home/oxbx08/R/x86_64-pc-linux-gnu-library/3.3/rJava’
##      # Warning in install.packages :
##      #   installation of package ‘rJava’ had non-zero exit status
##
## FYI: rJava & xlsxjars caused issues because of Java dependencies 

## Load all the packages from the same list above
lapply(packages, library, character.only = TRUE)
