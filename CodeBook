

1. Input Data: 
The input data can be found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
After the unzip, the data folder is named "UCI HAR Dataset", files that are used for further processing for this project are:

  features.txt
  activity_labels.txt
  test/subject_test.txt
  test/X_test.txt
  test/y_test.txt
  train/subject_train.txt
  train/X_train.txt
  train/y_train.txt

2. Steps of Cleaning Processes

  1) X, Y and Subject data for test and train dataset are read into R respectively. 
  2) Feature list is read in from features.txt and is used for the variable names later. 
     The list is further filtered through regular expression to grep only mean and standard deviation variables. 
  3) Activity ID and names are read in from activity_labels.txt.
  4) X, Y and Subject are subsequently combined together through cbind for test and train dataset respectively. (Implemented through
     a function named "processData" in run_analysis.R)
  5) Combined X, Y, Subject data of test and train are then respectively merged with activity data frame on Activity ID.
  6) The merged data for test and train respectively are subsequently subsetted based on the coloumn variables that only include
     the value of mean and standdard deviation.
  7) Combined test and train datasets from step 6 are merged together through rbind() method to produce a single dataset
     and write to the final data file "meanSTD_measurementTidy.txt" using write.table.
  8) The single dataset created in step 7 is melted and summarized mean measurement values per subject per activity 
     through dcast method to generate the final data file "averagePerActivityPerSubjectTidy.txt"  
     
     
