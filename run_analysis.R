library(plyr); library(dplyr)

## It will download and unzip the data only if there isn't the dataset folder in
## the current working directory
if (!file.exists('./UCI HAR Dataset')) {
  file_url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
  download.file(file_url, destfile = "projectdata.zip",  mode = "wb",  method = "curl")
  dateDownloaded <- date()
  unzip("projectdata.zip")
}

## To avoid unnecessary computation, it will create some variables only if they
## don't exist in the environment

## The 'merged dataset' joins the training, testing, subject id and activity data
if (!exists("mergedData")) {
  
  # Read features names
  features <- read.table('UCI HAR Dataset/features.txt')
  header <- c(t(features[2]), 'Subject', 'Activity')
  
  # Read training data
  X_train <- read.table('UCI HAR Dataset/train/X_train.txt')
  subject_train <- read.table('UCI HAR Dataset/train/subject_train.txt')
  y_train <- read.table('UCI HAR Dataset/train/y_train.txt')
  
  # Read testing data
  X_test <- read.table('UCI HAR Dataset/test/X_test.txt')
  subject_test <- read.table('UCI HAR Dataset/test/subject_test.txt')
  y_test <- read.table('UCI HAR Dataset/test/y_test.txt')
  
  # Merge all together
  train <- cbind(X_train, subject_train, y_train)
  test <- cbind(X_test, subject_test, y_test)
  mergedData <- rbind(train, test)
  names(mergedData) <- header
  
  # There is a little glitch in the features names. Some variables have a wrong
  # 'BodyBody' comparing features_info.txt with features.txt.
  # E.g: 'fBodyAccJerkMag' was transcripted as 'fBodyBodyAccJerkMag'
  names(mergedData) <- gsub('BodyBody', 'Body', names(mergedData))
  
  # The tbl_df has some advantages over the regular data frame when printing the
  # object. Uncomment the next line if you want to examine the data frame
  #mergedData <- tbl_df(mergedData)
  
  # Removing some temporary variables
  rm(features, header, X_train, subject_train, y_train, X_test, subject_test, y_test, train, test)
}

## The 'selected dataset' has just the mean and standard deviation of each measurement
## Furthermore, it has descriptive activity names, instead of activity ids
if (!exists("selectedData")) {
  
  # Extracts only the measurements on the mean and standard deviation for each measurement
  selectedData <- select(mergedData, contains('mean\\(\\)'), contains('std\\(\\)'), Subject, Activity)
  
  # Converts the activity ids to descriptive activity names
  selectedData$Activity[selectedData$Activity == 1] <- 'WALKING'
  selectedData$Activity[selectedData$Activity == 2] <- 'WALKING_UPSTAIRS'
  selectedData$Activity[selectedData$Activity == 3] <- 'WALKING_DOWNSTAIRS'
  selectedData$Activity[selectedData$Activity == 4] <- 'SITTING'
  selectedData$Activity[selectedData$Activity == 5] <- 'STANDING'
  selectedData$Activity[selectedData$Activity == 6] <- 'LAYING'
}
  
## The last dataset combines the average of each variable for each activity and each subject
if (!exists("tidyData")) {
  tidyData <- ddply(selectedData, .(Subject, Activity), numcolwise(mean))
  write.table(tidyData, 'tidyData.txt', row.names = FALSE) 
}
