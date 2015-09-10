# Getting and Cleaning Data Course Project
This repository hosts the R code and documentation files for the Data Science's track course "Getting and Cleaning Data."

##Overview

This project serves to demonstrate the collection and cleaning of a tidy data set that can be used for subsequent analysis.
The source data for this project is Human Activity Recognition Using Smartphones. A full description of the source data used as a basis for this project can be found at The UCI Machine Learning Repository. 
This project requires data transformations and calculations to create a tidy data set. A description of the data transformations and resulting tidy dataset can be found this repro's Code Book.

##Using this Script
In order to run this script, the source data files must be downloaded and unzipped, and your working directory in R set to where these files are located.
The run_analysis.R script requires the Shape2 package. Upon starting the script, if the Shape2 package is not yet installed, you will be prompted to install the package and the script will exit. 
  
##Project Summary
 The following is a summary description of the project instructions

You should create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set. 
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set 
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Description of Script Actions
The following steps are performed in the run_analysis.R script provided in this repository. 

1. Check to see if the Reshape2 library is installed. Prompt the user to install the package if it is missing, then quit the script.  If the package is installed, the package is loaded via the library() command. 
2. Load the activity description file (activity_labels.txt)
3. Load the measurement names file (features.txt)
4. Load the test files (x_test.txt, subject_test.txt,y_test.txt),apply column names, and combine into one data frame. 
5. Load the train files (x_train.txt, subject_train.txt,y_train.txt), apply column names, and combine into one data frame. 
6. Combine the test and train datasets.  
7. Reduce the dataframe to only include the mean and standard deviation variables, using the following criteria: 
	variable name contains "mean()" or variable name contains "std()". 
8. Make friendly variable names by replacing "-", "(" and ")" with a period, and eliminating any series of periods in the resulting name. 
9. Replace activity IDs with the activity labels for readability.
11. Melt the dataset using the Reshape2 library to reshape the data for easier handling.
12. Cast the melted dataset to calculate the mean of each measurement variable by activity and subject.
13. Produce "my_tidy_data.txt" as the expected output for the assignment.


