# ITEC621 Class Files

### Intro
I often find that GitHub is an easier place to find everything quickly so this repository was set up to contain everything important to the ITEC 621 - Predictive Analytics class at American University.  

### Overview
I created this repo to handle a few tasks:
  1. Organize the compexity of the massive R code script 
  2. Creating a quick script to replace the 'ITEC 621 R Packages.R' file for the following reasons
    - The original file cannot be quickly re-run to load all the required packages.
    - The original script attempts to re-install the packages if you select the whole thing to run
  3. 2KSB makes it difficult to quickly view files that I just want to browse or double check something.  I added a MISC folder to accommodate these types of files

### Useful URLs & Tips
Tips:

  - The https cloud CRAN is supported by RStudio within AWS and is automatically load balanced to the closest AWS region to your location.  This is usually option 0 or can be included in the install.packages() method.
    - e.g. install.packages("ggplot2", repos = "https://cran.rstudio.com")

URLs:
  1. [List of all ISLR Videos](https://www.r-bloggers.com/in-depth-introduction-to-machine-learning-in-15-hours-of-expert-videos/)
  2. [Free PDF of ISLR Text  - 6th Printing](www-bcf.usc.edu/~gareth/ISL/ISLR Sixth Printing.pdf)
  3. [RMarkdown Cheatsheet](https://www.rstudio.com/wp-content/uploads/2015/02/rmarkdown-cheatsheet.pdf)
  4. [R Statistics Essential Training - Lynda](https://www.lynda.com/R-tutorials/R-Statistics-Essential-Training/142447-2.html)
  5. [togaware OnePageR - A survival guide to Data Science with Readings/Scripts/Presentations](http://togaware.com/onepager/)

### File Structure

  - README.md
  - Leacture_Slides
    - All Lecture Slides broken down by lesson
  - Helpful_Info
    - qqplot.R
    - Q-Q Plot.pdf
  - R_Packages
    - ITEC 621 R Packages.R
    - Quick_Install.R
  - R_Scripts
    - Table_of_contents.R
    - 1_R_Introduction
    - 2_R_For_Analytics
    - 3_Regression_Refresher
    - 4_Data_Pre-Processing
    - 5-1_MachineLearning
    - 5-2_Variable_Selection
    - 6_Dimension_Reduction
    - 7_Non-linear_Models
    - 8_Classification_Models
    - 9_Decision_Trees
    - 10_Survey_Data_models
    - Other Topics
  - ISLR Scripts
    - Index_and_General_info.R
    - ISLR_Textbook_Scripts_Full.R
    - Chapter2.R
    - Chapter3.R
    - Chapter4.R
    - Chapter5.R
    - Chapter6.R
    - Chapter7.R
    - Chapter8.R
    - Chapter9.R
    - Chapter10.R
  - Misc_Class_Files
    - HW_Template.Rmd
    - ISLR Textbook Scripts.R
    - ITEC621Markdown.Rmd
    - Predictive Modeling Summary_v2.pdf
