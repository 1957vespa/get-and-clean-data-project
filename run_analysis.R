library(dplyr)

#  merges  training and  test in one dataset
trainDataSet <- read.table("UCI HAR Dataset\\train\\X_train.txt")
testDataSet <- read.table("UCI HAR Dataset\\test\\X_test.txt")
finalSet <- rbind(trainDataSet,testDataSet)

trainLabel <- read.table("UCI HAR Dataset\\train\\y_train.txt")
testLabel <- read.table("UCI HAR Dataset\\test\\y_test.txt")
mergeLabel <- rbind(trainLabel,testLabel)

subjectTrain <- read.table("UCI HAR Dataset\\train\\subject_train.txt")
subjectTest <-  read.table("UCI HAR Dataset\\test\\subject_test.txt")
mergeSubject <- rbind(subjectTrain,subjectTest)

# get mean + S.deviations
features <- read.table("UCI HAR Dataset\\features.txt") 
ind <- grep("-mean\\(\\)|-std\\(\\)", features$V2)
finalSet <- finalSet[,ind]

# add lables
activityLabels <- read.table("UCI HAR Dataset\\activity_labels.txt")
mergeActvity <- factor(mergeLabel$V1,label=activityLabels$V2)

# labels 
names(finalSet) <- as.character(features$V2[ind])

#create another clean dataset and average

AverageDataset <- aggregate(x=finalSet, by=list(mergeSubject$V1,mergeActvity), FUN="mean")
AverageDataset <- rename(AverageDataset, Subject=Group.1, Activity=Group.2)

# save the tidy data set "AverageDataset" to txt
write.table(AverageDataset, file = "finalDataset.txt", row.name=FALSE) 

