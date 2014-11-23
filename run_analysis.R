## This file contains the functions for the Getting and Cleaning Data course
## project.  The script can be run by executing the runMainProgram() function.

library(data.table)
library(reshape2)

## This is the main function that should be run to complete this assignment.
## This function will call the needed functions below in the proper order.
## The final step writes the tidy data set to a text file in the working
## directory.
runMainProgram <- function() {
    readData()
    doBinds()
    setColNames()
    setActivityNames()
    setUniqueColumnNames()
    getCorrectColumnsAndTidy()
    t4 <<- meanDataSet()
    write.table(t4, "TidyDataSet.txt", row.names = FALSE)
}

## Read in data sources and store in R varialbes.
readData <- function() {
    path <- "./UCI_HAR_Dataset/"
    activityLabels <<- read.table(paste(path, "activity_labels.txt", sep = ""))
    features <<- read.table(paste(path, "features.txt", sep = ""))
    
    path <- "./UCI_HAR_Dataset/test/"
    subjectTest <<- read.table(paste(path, "subject_test.txt", sep = ""))
    xTest <<- read.table(paste(path, "X_test.txt", sep = ""))
    yTest <<- read.table(paste(path, "y_test.txt", sep = ""))
    
    path <- "./UCI_HAR_Dataset/train/"
    subjectTrain <<- read.table(paste(path, "subject_train.txt", sep = ""))
    xTrain <<- read.table(paste(path, "X_train.txt", sep = ""))
    yTrain <<- read.table(paste(path, "y_train.txt", sep = ""))
 }

## Bind rows and columns of data set according to below:
## 1. cbind X_train (7352x561) with subject_train (7352x1)
## 2. cbind the results with ytrain (7352X1)  to get a data table of 7352x563
## 3. cbind X_test (2947x561) with subject_test (2947x1 )
## 4. cbind the results with yTest (2947x1) to get a data table of 2947x563
## 5. row bind results of 2 and 4 above to get a data table of 10299x563
doBinds <- function() {
    t1 <- cbind(xTrain, subjectTrain)
    t1 <- cbind(t1, yTrain)
    t2 <- cbind(xTest, subjectTest)
    t2 <- cbind(t2, yTest)
    t3 <<- rbind(t1, t2) #Global variable and main data 
}

## Set the right most column names to Subject and Activity
setColNames <- function() {
    colNames <- features[ , 2]
    colNamesChar <- as.character(colNames)
    colNamesChar <- c(colNamesChar, 'Subject', 'Activity')
    names(t3) <<- colNamesChar
}

## Change Activity Name numbers to Activity Lables.
setActivityNames <- function() {
    t3$Activity[t3$Activity == 1] <<- 'WALKING'
    t3$Activity[t3$Activity == 2] <<- 'WALKING_UPSTAIRS'
    t3$Activity[t3$Activity == 3] <<- 'WALKING_DOWNSTAIRS'
    t3$Activity[t3$Activity == 4] <<- 'SITTING'
    t3$Activity[t3$Activity == 5] <<- 'STANDING'
    t3$Activity[t3$Activity == 6] <<- 'LAYING'
}

## Eliminate columns with duplicate names.
setUniqueColumnNames <- function() {
    t3 <<- t3[ , unique(names(t3))]
}

## Filter table to only select columns for means and std.
## Eliminaate parenthesis ().
## Use a regular expression to select the correct columns.
getCorrectColumnsAndTidy <- function() {
    names(t3) <<- gsub("()", "", names(t3), fixed = TRUE)
    myFilter <- 
        grepl("(mean|std|mean-[XYZ]|std-[XYZ])$|Subject|Activity", names(t3))
    t3 <<- t3[, myFilter]
    names(t3) <<- gsub("-", "", names(t3), fixed = TRUE)
    names(t3) <<- tolower(names(t3))
}

## This function creates a new variable t4, which contains the mean of the
## t3 data set first ordered by subject, then by activity.
meanDataSet <- function() {
    t4 <<- data.frame(t3)
    t4 <<- melt(t4, id.vars = c("subject", "activity"))
    t4 <<- dcast(t4, subject + activity ~ variable, fun.aggregate = mean)
}

