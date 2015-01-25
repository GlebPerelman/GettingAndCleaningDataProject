#Codebook
##Introduction
The required script is run_analysis.r.

##Main steps
Let's go through 5 steps from project requirements
1. We read data using read.table and merge it using rbind() function.
2. Extracting mean and std. Get required column numbers from features.txt. Data is filtered by name using grep function.
3. Using descriptive activity names to name the activities in the data set. We need to replace numbers by meaningful names. Names are taken from activity_labels.txt.
4. Rename columns
5. Group results from the previous step by subject and activity using R function aggregate with mean as FUN.

##Variables
xTrain, yTrain, subjectTrain, xTest, yTest, subjectTest, features, activityLabels - original data

x, y, data - merged and processed data
fullData - merged x, y and data