run_analysis <- function() {
    library(dplyr)
    # Read the training data from the files in dataset
    X_train <- read.table('UCI HAR Dataset/train/X_train.txt')
    subject_train <- read.table('UCI HAR Dataset/train/subject_train.txt')
    y_train <- read.table('UCI HAR Dataset/train/y_train.txt')
    
    # Merge data to create training set data
    train_data <- cbind(subject_train,y_train,X_train)
    
    # Read the test data from the files in dataset
    X_test <- read.table('UCI HAR Dataset/test/X_test.txt')
    subject_test <- read.table('UCI HAR Dataset/test/subject_test.txt')
    y_test <- read.table('UCI HAR Dataset/test/y_test.txt')
    
    # Merge data to create test set data
    test_data <- cbind(subject_test, y_test, X_test)
    
    # Merge the training and the test sets to create one data set
    data <- rbind(train_data, test_data)
    
    # Labels the data set with descriptive variable names
    var_names <- c('Subject.No', 'Activity', as.character(read.table('UCI HAR Dataset/features.txt')[,2]))
    names(data) <- var_names
    
    # Extracts only the mean and standard deviation for each measurement 
    mean_idx <- grep('mean()',var_names,fixed = TRUE)
    std_idx <- grep('std()',var_names, fixed = TRUE)
    var_idx <- sort(union(mean_idx,std_idx))
    data <- data[,c(1,2,var_idx)]
    
    # Uses descriptive activity names to name the activities in the data set
    act <- read.table('UCI HAR Dataset/activity_labels.txt')
    act[,2] <- as.character(act[,2])
    for (i in 1:nrow(act)) {
        data[,2] <- replace(data[,2], grep(act[i,1],data[,2]), act[i,2])
    }
    
    # Create tidy data set with average of each variable for each activity and each subject
    tidy_data <- summarise_each((group_by(data,Subject.No,Activity)),funs(mean))
}
