Getting and Cleaning Data - Course Project
==========================================

This repo contains the code that accomplishes the final project of the [Getting and Cleaning Data], part of the [Data Science Specialization] and available at [Coursera].



Introduction
-----------

The purpose of the project is to demonstrate the skills acquired in the course to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. The original data were collected from the accelerometers from the Samsung Galaxy S smartphone and available at:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The dataset is the result of experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (*WALKING*, *WALKING_UPSTAIRS*, *WALKING_DOWNSTAIRS*, *SITTING*, *STANDING*, *LAYING*) wearing a smartphone (Samsung Galaxy S II) on the waist. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones



Project Structure
--------

There are two main files in the project:

1. CodeBook.md
    - describes the variables, the data and all transformations performed to clean up the data
2. run_analysis.R
    - executes the cleaning process and output a file called *tidyData.txt*. More information can be found at the CodeBook.


Installation
------------

The script requires the **plyr** and **dplyr** packages, you may need to install them.

```sh
install.packages('plyr')
install.packages('dplyr')
```



Usage
-----
Simply run the script called **run_analysis.R**. If the dataset folder isn't in the current working directory, the script will download and unzip the data. This process may take a while, since the dataset has 60 MB.

The script will produce the *tidyData.txt* file previously described



[Getting and Cleaning Data]:https://www.coursera.org/course/getdata
[Data Science Specialization]:https://www.coursera.org/specialization/jhudatascience/1
[Coursera]:https://www.coursera.org/
