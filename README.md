CleaningData
============
This repo contains the submissions for the course project for Getting and Cleaning Data given by Coursera.org.

This README file contains instructions for running the code in the file run_analysis.R and a description of how the script workks.

## Instructions for running the code and viewing the results.
The file with the script is run_analysis.R.  This script is run by invoking the function runMainProgram().  In order to run properly, the data set UCI_HAR_Dataset must be in the working directory.  The output of the program is a text file titled TidyDataSet.txt.  This file can be better viewed by reading the file into R as follows:
* data <- read.table(file_path, header = TRUE)
* View(data)
* Citation for above code: David's Project FAQ, https://class.coursera.org/getdata-009/forum/thread?thread_id=58

## Description of how the code works
* The runMainProgram() function calls the other functions.  These functions are described in the order they are called below.
* The readData() function, reads the data from the UCI_HAR_Dataset and stores the data in R variables, whose names are pneumonics of the data files.
* The doBinds() function properly binds the data files together into a data.frame named t3.  The data files are bound as follows:
  1. cbind X_train (7352x561) with subject_train (7352x1)
  2. cbind the results with ytrain (7352X1)  to get a data table of 7352x563
  3. cbind X_test (2947x561) with subject_test (2947x1 )
  4. cbind the results with yTest (2947x1) to get a data table of 2947x563
  5. row bind results of 2 and 4 above to get a data table of 10299x563
* The setColumnNames() function sets the right most column names of t3 to Subject and Activity.
* The setActivityNames() function changes the Activity Name numbers to Activity Lables according to the mapping in the activity_labels.txt input file.
* The setUniqueColumnNames() function eliminates columns with duplicate names.
* The getCorrectColumnsAndTidy() function filters the table to only select columns (i.e. variables) for means and standard deviations.  The function also eliminates parenthesis and underscores in the column names, and sets all the column names to lower case.  This function uses a regular expression to select the correct colums.  Only columns whose names ended in mean(), mean()-X, mean()-Y, mean()-Z, std(), std()-X, std()-Y, and std()-Z were selected.  Including the activity and subject columns, this resulted in 68 columns.  The dimension of t3 is (10299, 68).
* The meanDataSet() function created a new data.frame named t4, which contains the means of the variables of the t3 data set first ordered by subject, then by activity.  It does this in an efficient manner using the melt() and dcast() packages from the reshape2 library.  The dimension of t4 is (180, 68). t4 is the tidy set output required by the project.
* Finally, t4 is output to a text file named TidyDataSet.txt using write.table().
