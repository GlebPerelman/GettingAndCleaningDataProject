#You should create one R script called run_analysis.R that does the following. 


#Merges the training and the test sets to create one data set.

xTrain <- read.table("UCI HAR Dataset/train/X_train.txt")
yTrain <- read.table("UCI HAR Dataset/train/y_train.txt")
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")

xTest <- read.table("UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("UCI HAR Dataset/test/y_test.txt")
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt")

# create merged data set
x <- rbind(xTrain, xTest)
y <- rbind(yTrain, yTest)
data <- rbind(subjectTrain, subjectTest)

#Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table("UCI HAR Dataset/features.txt")
iMeansStds <- grep("-(mean|std)\\(\\)", features[, 2])

x <- x[,iMeansStds]
names(x) <- features[iMeansStds, 2]


#Uses descriptive activity names to name the activities in the data set
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
y[, 1] <- activityLabels[y[, 1], 2]
names(y) <- "activity"

#Appropriately labels the data set with descriptive variable names. 
names(data) <- "subject"
fullData <- cbind(x, y, data)

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
averagesData <- aggregate(x = x,  by=fullData[c("subject","activity")], FUN=mean)

write.table(averagesData, "averages_data.txt", row.name = FALSE)