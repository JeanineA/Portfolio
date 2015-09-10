#Code Book
This code book for the Getting and Cleaning Data course project includes information about the source data, decisions made during the transformation to a tidy dataset, and information about the variables in the tidy data set.

##Source Study 

The source data was collected from the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) to complete an assignment for a Coursera course named Getting and Cleaning Data. The assignment involved working with the [data set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and producing tidy data representation of the source data. See below for more detail on the source data. 

##Source Data Notes

The following information about the source data is quoted from [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The values in the source data are normalized and bounded within [-1,1].

"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

"Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

"These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag


The set of variables that were estimated from these signals are and were used in the Tidy Data project are:  

* mean(): Mean value
* std(): Standard deviation

##Tidy Data Set Notes

In both the source data and the Tidy Data output, measured such as "tBodyAcc-XYZ" as listed above are in fact stored as three separate variables: tBodyAcc-X, tBodyAcc-Y, and tBodyAcc-Z. 

Identification of the mean and standard deviation variables are based on  having "mean()" or "std()" in the variable name. 
Original variable names were made more friendly by replacing "-", "(", and ")" with a period and removing any resulting repeating periods.  

#Tidy Data Variables
* activity_name: the activity that the subject was doing at the time of the measurement (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
* subject_id: 1 to 30 each representing a participant in the study
* tBodyAcc.mean.X
* tBodyAcc.mean.Y
* tBodyAcc.mean.Z
* tGravityAcc.mean.X
* tGravityAcc.mean.Y
* tGravityAcc.mean.Z
* tBodyAccJerk.mean.X
* tBodyAccJerk.mean.Y
* tBodyAccJerk.mean.Z
* tBodyGyro.mean.X
* tBodyGyro.mean.Y
* tBodyGyro.mean.Z
* tBodyGyroJerk.mean.X
* tBodyGyroJerk.mean.Y
* tBodyGyroJerk.mean.Z
* tBodyAccMag.mean.
* tGravityAccMag.mean.
* tBodyAccJerkMag.mean.
* tBodyGyroMag.mean.
* tBodyGyroJerkMag.mean.
* fBodyAcc.mean.X
* fBodyAcc.mean.Y
* fBodyAcc.mean.Z
* fBodyAccJerk.mean.X
* fBodyAccJerk.mean.Y
* fBodyAccJerk.mean.Z
* fBodyGyro.mean.X
* fBodyGyro.mean.Y
* fBodyGyro.mean.Z
* fBodyAccMag.mean.
* fBodyBodyAccJerkMag.mean.
* fBodyBodyGyroMag.mean.
* fBodyBodyGyroJerkMag.mean.
* tBodyAcc.std.X
* tBodyAcc.std.Y
* tBodyAcc.std.Z
* tGravityAcc.std.X
* tGravityAcc.std.Y
* tGravityAcc.std.Z
* tBodyAccJerk.std.X
* tBodyAccJerk.std.Y
* tBodyAccJerk.std.Z
* tBodyGyro.std.X
* tBodyGyro.std.Y
* tBodyGyro.std.Z
* tBodyGyroJerk.std.X
* tBodyGyroJerk.std.Y
* tBodyGyroJerk.std.Z
* tBodyAccMag.std.
* tGravityAccMag.std.
* tBodyAccJerkMag.std.
* tBodyGyroMag.std.
* tBodyGyroJerkMag.std.
* fBodyAcc.std.X
* fBodyAcc.std.Y
* fBodyAcc.std.Z
* fBodyAccJerk.std.X
* fBodyAccJerk.std.Y
* fBodyAccJerk.std.Z
* fBodyGyro.std.X
* fBodyGyro.std.Y
* fBodyGyro.std.Z
* fBodyAccMag.std.
* fBodyBodyAccJerkMag.std.
* fBodyBodyGyroMag.std.
* fBodyBodyGyroJerkMag.std.



