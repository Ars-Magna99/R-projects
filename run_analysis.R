#unzip the zip file containing datasets
unzip(zipfile="/Dataset.zip",exdir="data.csv")
#print a list of all the files in the input directory
pathdata <- file.path("/Users/ziyangwang/Desktop", "UCI HAR Dataset")
files <- list.files(pathdata,recursive = TRUE)
#reading training tables
x_train <- read.table(file.path(pathdata, "train", "X_train.txt"),header = FALSE)
y_train <- read.table(file.path(pathdata, "train", "Y_train.txt"),header = FALSE)
subject_train <- read.table(file.path(pathdata, "train", "subject_train.txt"),header = FALSE)
#reading test tables
x_test <- read.table(file.path(pathdata, "test", "X_test.txt"),header = FALSE)
y_test <- read.table(file.path(pathdata, "test", "Y_test.txt"),header = FALSE)
subject_test <- read.table(file.path(pathdata, "test", "subject_test.txt"),header = FALSE)
#read features table
features = read.table(file.path(pathdata, "features.txt"),header = FALSE)
#read activityLables table
activityLabels = read.table(file.path(pathdata, "activity_labels.txt"),header = FALSE)

# set up column names in train tables
colnames(x_train) <- features[,2]
colnames(y_train) <- "activity_ID"
colnames(subject_train) <- "subject_ID"
# set up column names in test tables
colnames(x_test) = features[,2]
colnames(y_test) = "activity_ID"
colnames(subject_test) = "subject_ID"
#set up column names of activityLables table
colnames(activityLabels) <- c('activity_ID','activityType')

#merge the data 
merge_train <- cbind(y_train, subject_train, x_train)
merge_test <- cbind(y_test,subject_test,x_test)
AllInOne <- rbind(merge_train, merge_test) 
#
colNames <- colnames(AllInOne)
#Get a subset of all the mean and standards and the correspondongin activityID and subjectID 
mean_and_std = (grepl("activity_ID" , colNames) | grepl("subjectId" , colNames) | grepl("mean.." , colNames) | grepl("std.." , colNames))
#get required dataset
setForMeanAndStd <- AllInOne[ , mean_and_std == TRUE]
setWithActivityNames <- merge(setForMeanAndStd, activityLabels, by='activity_ID', all.x=TRUE)
#create a second, independent tidy data set with the average of each variable for each activity and each subject
secTidySet <- aggregate(. ~subject_ID + activity_ID, setWithActivityNames, mean)
secTidySet <- secTidySet[order(secTidySet$subjectId, secTidySet$activityId),]
write.table(secTidySet, "secTidySet.txt", row.name=FALSE)