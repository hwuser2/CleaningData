CleaningData
============
This repo contains the submissions for the course project for Getting and Cleaning Data.

This README file contains instructions for running the code in the file run_analysis.R and a description of how the script workks.

## Instructions for running code and viewing results.
The file with the script is run_analysis.R.  This script is run by invoking the function runMainProgram().  In order to run properly, the data set UCI_HAR_Dataset must be in the working directory.  The output of the program is a text file titled TidyDataSet.txt.  This file can be better viewed by reading the file into R as follows:
data <- read.table(file_path, header = TRUE)
View(data)
Citation for above code: David's Project FAQ, https://class.coursera.org/getdata-009/forum/thread?thread_id=58

