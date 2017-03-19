#######################################################
### Load the necessary Library
#######################################################
library(dplyr)

#######################################################
### Get the train data and test data
#######################################################
X_train = read.table("C:/Users/yihe/Downloads/UCI HAR Dataset/train/X_train.txt")
Y_train = read.table("C:/Users/yihe/Downloads/UCI HAR Dataset/train/y_train.txt")
Subject_train = read.table("C:/Users/yihe/Downloads/UCI HAR Dataset/train/subject_train.txt")

X_test = read.table("C:/Users/yihe/Downloads/UCI HAR Dataset/test/X_test.txt")
Y_test = read.table("C:/Users/yihe/Downloads/UCI HAR Dataset/test/y_test.txt")
Subject_test = read.table("C:/Users/yihe/Downloads/UCI HAR Dataset/test/subject_test.txt")

features = read.table("C:/Users/yihe/Downloads/UCI HAR Dataset/features.txt") 
activity_labels = read.table("C:/Users/yihe/Downloads/UCI HAR Dataset/activity_labels.txt")

#######################################################
### Merge the data
#######################################################
X_all = rbind(X_train, X_test)
Y_all = rbind(Y_train, Y_test)
Sub_all = rbind(Subject_train, Subject_test)

#######################################################
### Extracting the mean and standard deviation for each measurement
#######################################################
selected_var <- features[grep("mean\\(\\)|std\\(\\)",features[,2]),]
X_all <- X_all[,selected_var[,1]]

#######################################################
### Adding descriptive names for activity
#######################################################
colnames(Y_all) <- "activity"
Y_all$activitylabel <- factor(Y_all$activity, labels = as.character(activity_labels[,2]))
activitylabel <- Y_all[,-1]

#######################################################
### Adding descriptive labels for activity
#######################################################
colnames(X_all) <- features[selected_var[,1],2]

#######################################################
### Create tidy dataset
#######################################################
colnames(Sub_all) <- "subject"
total <- cbind(X_all, activitylabel, Sub_all)
total_mean <- total %>% group_by(activitylabel, subject) %>% summarize_each(funs(mean))
write.table(total_mean, file = "C:/Users/yihe/Downloads/UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE)