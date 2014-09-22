The cleaning process
--------------------

The overall steps performed in run_analysis.R script to clean the original dataset are as follows:
1. Merge the training, testing, subject id and activity id data to create one dataset;
    - Several files were used to collect such information, as *X_train.txt*, *subject_train.txt*, *y_train.txt* and the corresponding files for the test set;
    - The *features.txt* file was used to apropriately label the dataset with descriptive variable names;
2. Select only variables of mean and standard deviation for each measurement. Other variables were discarded;
3. Convert the activity ids to descriptive activity names;
    - The *activity_labels.txt* file was used;
4. Calculate the average of each variable for each activity and each subject;
5. Write the second dataset in a file called *tidyData.txt*.



The Output Dataset
------------------

There is 68 columns and 10,299 rows in the tidy dataset:
- The first two columns correspond to the subjects ids and their activities during data collection;
- The remaining 66 columns correspond to the average of the mean and standard deviation of the following features:
  - tBodyAcc-XYZ
  - tGravityAcc-XYZ
  - tBodyAccJerk-XYZ
  - tBodyGyro-XYZ
  - tBodyGyroJerk-XYZ
  - tBodyAccMag
  - tGravityAccMag
  - tBodyAccJerkMag
  - tBodyGyroMag
  - tBodyGyroJerkMag
  - fBodyAcc-XYZ
  - fBodyAccJerk-XYZ
  - fBodyGyro-XYZ
  - fBodyAccMag
  - fBodyAccJerkMag
  - fBodyGyroMag
  - fBodyGyroJerkMag

These features came from the accelerometer and gyroscope signals collected while the 30 volunteers performed six activities (*WALKING*, *WALKING_UPSTAIRS*, *WALKING_DOWNSTAIRS*, *SITTING*, *STANDING*, *LAYING*) wearing a smartphone (Samsung Galaxy S II) on the waist.

Most variables has a "-XYZ" used to denote 3-axial signals in the X, Y and Z directions. Also, all variables have a "mean()" or "std()" to denote the mean value and standard deviation of the measurements.

**The tidy dataset has only the average of each feature for each activity and each subject**. To examine the entire merged dataset, you may check the *mergedData* in the workspace.

To examine the entire merged dataset, you can check the *mergedData* variable, available in the workspace after the end of the script.
