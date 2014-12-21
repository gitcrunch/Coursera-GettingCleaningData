Coursera-GettingCleaningData
============================
1. Introduction:
This is the project work for Getting and Cleaning Data Class @coursera.org

2. The Course Project Requirements:
The course project requirement can be found here https://class.coursera.org/getdata-016/human_grading/view/courses/973758/assessments/3/submissions

3. Input data:
Input data can be found here
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
Note: input data folder structure "UCI HAR Dataset" needs to be kept as is after unzip and on the same folder level as run_analysis.R in order for R script to run without error.

4. Files Found in this Repository
	1) README.md-------this file.
	2) CodeBook.md------the file describes the variables, the data, and transformations that are performed to generate two tidy datasets: meanSTD_measurementTidy.txt and averagePerActivityPerSubjectTidy.txt from input data described in section 3.
  <list> 3) meanSTD_measurementTidy.txt--------Tidy data generated that includes mean and standard deviation for each measurement.
	4) averagePerActivityPerSubjectTidy.txt-------Tidy data generated to show summary statistics on the average of each measurement 																									variable for each activity and each subject.
	5) run_analysis.R--------The R script that generates files "meanSTD_measurementTidy.txt" and "averagePerActivityPerSubjectTidy.txt" by 											 running command "source("run_analysis.R") at R prompt.
