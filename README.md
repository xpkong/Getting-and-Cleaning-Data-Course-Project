# Readme for run_analysis.R

Package required: dplyr

To run the script run_analysis.R, place the script in the working directory and ensure that the data for the project is extracted in the working directory. The script should not be in the 'UCI HAR Dataset' folder. The data for the project can be obtained from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Details of what run_analysis.R does:
1.  Merges the training and the test sets to create one data set by
    i.      Reading the training data from the files in dataset
    ii.     Merging the training data to create training set data
    iii.    Reading the test data from the files in dataset
    iv.     Merging the test data to create test set data
    v.      Merging the training and the test sets to create one data set

2.  Appropriately labels the data set with descriptive variable names.
    i.      Reading the variable names from the dataset and using it to name the columns

3.  Extracts only the measurements on the mean and standard deviation for each measurement. 
    i.      Only variable names that contains 'mean()' or 'std()' are extracted

4.  Uses descriptive activity names to name the activities in the data set
    i.      The numeric values in the 'activity' variable are replaced with their respective descriptive activity names.
    
5.  Creates a tidy data set with average of each variable for each activity and each subject
    i.      The output of run_analysis.R creates a data frame with is the tidy data set with average of each variable for each activity for each subject. The data frame is created such that each variable is placed in one column, and each different observation of that variable is in a different row.
