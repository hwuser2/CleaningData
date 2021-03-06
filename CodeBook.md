CodeBook for Getting and Cleaning Data Course Project
=====================================================

## Introduction
This code book provides:
* A section titled “Study Design”, which describes how the data was collected and the features that were selected, as given in the feature_info.txt file provided with the course data set.
* A section titled “Code Book” which describes the original variables, as given in the feature_info.txt file, and the variables selected whose means were calculated.
* A section titled “Transformations” which describes the transformations that were performed to the original variables to obtain the outputs.

## Study Design
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ, 
tGravityAcc-XYZ, 
tBodyAccJerk-XYZ, 
tBodyGyro-XYZ, 
tBodyGyroJerk-XYZ, 
tBodyAccMag, 
tGravityAccMag, 
tBodyAccJerkMag, 
tBodyGyroMag, 
tBodyGyroJerkMag, 
fBodyAcc-XYZ, 
fBodyAccJerk-XYZ, 
fBodyGyro-XYZ, 
fBodyAccMag, 
fBodyAccJerkMag, 
fBodyGyroMag, 
fBodyGyroJerkMag.


## Code Book
The set of variables that were estimated from the above signals are: 

mean(): Mean value, 
std(): Standard deviation, 
mad(): Median absolute deviation, 
max(): Largest value in array, 
min(): Smallest value in array, 
sma(): Signal magnitude area, 
energy(): Energy measure. Sum of the squares divided by the number of values, 
iqr(): Interquartile range, 
entropy(): Signal entropy, 
arCoeff(): Autorregresion coefficients with Burg order equal to 4, 
correlation(): correlation coefficient between two signals, 
maxInds(): index of the frequency component with largest magnitude, 
meanFreq(): Weighted average of the frequency components to obtain a mean frequency, 
skewness(): skewness of the frequency domain signal, 
kurtosis(): kurtosis of the frequency domain signal, 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window, 
and angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean, 
tBodyAccMean, 
tBodyAccJerkMean, 
tBodyGyroMean, and
tBodyGyroJerkMean.

The complete list of variables of each feature vector is available in 'features.txt'


## Transformations
The below transformations were performed to obtain the variables (columns) which were used to calculate means.  The final output is in wide format.
* Second instances of variables whose names were already found were deleted.  In other words, second or more occurrences of variables were deleted resulting in unique variable names, and no repeated variables.
* Parenthesis were removed from the variable names.
* Only variables whose names ended in mean(), mean()-X, mean()-Y, mean()-Z, std(), std()-X, std()-Y, and std()-Z were selected.
* Dashes were removed from the variable names.
* Variable names were changed to lower case.

* The variables chosen were:

tbodyaccmeanx, tbodyaccmeany, tbodyaccmeanz, tbodyaccstdx, tbodyaccstdy, tbodyaccstdz, tgravityaccmeanx, tgravityaccmeany, tgravityaccmeanz, tgravityaccstdx, tgravityaccstdy, tgravityaccstdz, tbodyaccjerkmeanx, tbodyaccjerkmeany, tbodyaccjerkmeanz, tbodyaccjerkstdx, tbodyaccjerkstdy, tbodyaccjerkstdz, tbodygyromeanx, tbodygyromeany, tbodygyromeanz, tbodygyrostdx, tbodygyrostdy, tbodygyrostdz, tbodygyrojerkmeanx, tbodygyrojerkmeany, tbodygyrojerkmeanz, tbodygyrojerkstdx, tbodygyrojerkstdy, tbodygyrojerkstdz, tbodyaccmagmean, tbodyaccmagstd, tgravityaccmagmean, tgravityaccmagstd, tbodyaccjerkmagmean, tbodyaccjerkmagstd, tbodygyromagmean, tbodygyromagstd, tbodygyrojerkmagmean, tbodygyrojerkmagstd, fbodyaccmeanx, fbodyaccmeany, fbodyaccmeanz, fbodyaccstdx, fbodyaccstdy, fbodyaccstdz, fbodyaccjerkmeanx, fbodyaccjerkmeany, fbodyaccjerkmeanz, fbodyaccjerkstdx, fbodyaccjerkstdy, fbodyaccjerkstdz, fbodygyromeanx, fbodygyromeany, fbodygyromeanz, fbodygyrostdx, fbodygyrostdy, fbodygyrostdz, fbodyaccmagmean, fbodyaccmagstd, fbodybodyaccjerkmagmean, fbodybodyaccjerkmagstd, fbodybodygyromagmean, fbodybodygyromagstd, fbodybodygyrojerkmagmean, and fbodybodygyrojerkmagstd.