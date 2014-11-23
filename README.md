CleaningData
============
This repo contains the submissions for the course project for Getting and Cleaning Data.

This README file contains instructions for running the code in the file run_analysis.R and a description of how the script workks.

## Instructions for running code and viewing results.
The file with the script is run_analysis.R.  This script is run by invoking the function runMainProgram().  In order to run properly, the data set UCI_HAR_Dataset must be in the working directory.  The output of the program is a text file titled TidyDataSet.txt.  This file can be better viewed by reading the file into R as follows:
data <- read.table(file_path, header = TRUE)
View(data)
Citation for above code: David's Project FAQ, https://class.coursera.org/getdata-009/forum/thread?thread_id=58

## Description of how the code works
* The runMainProgram() function calls the other functions.  These functions are described in the order they are called below.
* The readData() function, reads the data from the UCI_HAR_Dataset and stores the data in R variables, whose names are pneumonics of the data files.
* The doBinds() function properly binds the data files together into a data.frame named t3.  The data files are bound as follows:
  1. cbind X_train (7352x561) with subject_train (7352x1)
  2. cbind the results with ytrain (7352X1)  to get a data table of 7352x563
  3. cbind X_test (2947x561) with subject_test (2947x1 )
  4. cbind the results with yTest (2947x1) to get a data table of 2947x563
  5. row bind results of 2 and 4 above to get a data table of 10299x563
