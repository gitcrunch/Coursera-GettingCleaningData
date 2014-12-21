#Import library for melt and cast data
library(reshape2)

#Read the test data into R
testX <- read.table("UCI HAR Dataset/test/X_test.txt")
testY <- read.table("UCI HAR Dataset/test/y_test.txt")
testSubject <- read.table("UCI HAR Dataset/test/subject_test.txt")

#Read the training data into R
trainX <- read.table("UCI HAR Dataset/train/X_train.txt")
trainY <- read.table("UCI HAR Dataset/train/y_train.txt")
trainSubject <- read.table("UCI HAR Dataset/train/subject_train.txt")

## Preprocessing variable names for later use
#read the feature file into data frame
featuresDF <- read.table("UCI HAR Dataset/features.txt")
#extract column "V2" feature name into a vector
featureList <- as.vector(featuresDF[,"V2"])
#match all the columns with mean value in feature list
meanVar <- grep("-mean\\(\\)", featureList, value = TRUE)
#match all the column with std value in feature list
stdVar <- grep("-std\\(\\)", featureList, value = TRUE)
#Reading the acitivity names into R for furture processing
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
###End of variable processing######

#The function perform the column bind of X, Y, and Subject data 
#for test and train data respectively
processData <- function(subjectdata, activitydata, maindata){
#column bind all test data ( 
cData <- cbind(subjectdata, activitydata, maindata)
#Assign "Subject" to column 2 of testData
colnames(cData)[1] <- "Subject"
#Assign "activityID" to column 1 of cData
colnames(cData)[2] <- "activityID"
#Assign feature names to name of column 3 to 563 of cData
colnames(cData)[3:563] <- featureList

#Merge activity list into main data on activity ID to add a column with activity name
tempData <- merge(cData, activities, by.x = "activityID", by.y = "V1")
#change coulmn "V2" into meaningful name "activityname"
colnames(tempData)[564] <- "ActivityName"


#Compose a varibale name list required for final data extraction from tempData
finalVarList <- c("Subject", "ActivityName", meanVar, stdVar)
#Extract end data product from tempData
#It should return a dimension of 2947 X 68 data frame for test dataset
cDataFinal <- tempData[, finalVarList]
return (cDataFinal)
}

#prepare final test data by combine X, Y, main measurement data by calling function
#processData
testDataFinal <- processData(testSubject, testY, testX)
#prepare final train data by combine X, Y, main measurement data by calling function
#processData
trainDataFinal <- processData(trainSubject, trainY, trainX)

#Merge final test and training data through row binding function
meanStdFinalData <- rbind(trainDataFinal, testDataFinal)

#Write the merged final data to file using write.table with row name set to false
write.table(meanStdFinalData, "meanSTD_measurementTidy.txt", row.name = FALSE)

#Processing to create a tidy dataset with the average of each variable for 
#each activity and each subject

meltData <- melt(meanStdFinalData, id=c("Subject", "ActivityName"))
avgPerActSub <- dcast(meltData, Subject + ActivityName ~ variable, mean)
#write the data into final data file
write.table(avgPerActSub, "averagePerActivityPerSubjectTidy.txt", row.name = FALSE)


