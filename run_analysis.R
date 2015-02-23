## read  "./data/pums.csv" into pdat
## Get & Clean Data script by RB Wiley for Coursera ; 20150217
##author: "rb wiley"
## date: "Friday, February 13, 2015"

## see README.md for full description of Getting and Cleaning Data process
##    including major steps in this script
## see Codebook.md for description of variables, data, transformation\steps 
##    to clean the data
##
## working directory must contain data subdirectory: .\data\


## load plyr, dplyr libraries; expects as already installed
library(plyr)
library(dplyr)

## read complete training and test (X* & y*) datasets into tables
##    followed by merge (cbind) X* and y* tables
##    create column of data set attribute("training" or "test")
##    followed by merge train and test tables
##    followed by read only mean, std columns


ytraining1 <- read.table( ".\\data\\train\\y_train.txt")
colnames(ytraining1) <- "Activity"
Xtraining1 <- read.table( ".\\data\\train\\X_train.txt")
train_subj <- read.table(".\\data\\train\\subject_train.txt")
colnames(train_subj) <- "Subject"

Xtraining <- cbind(train_subj, ytraining1, Xtraining1)
Xtraining$set <- "training"
#head(Xtraining[,c(1:4, 563)],2)
#any(is.na(Xtraining))   # ck for nulls

ytest1 <- read.table( ".\\data\\test\\y_test.txt")
colnames(ytest1) <- "Activity"
Xtest1 <- read.table( ".\\data\\test\\X_test.txt")
test_subj <- read.table(".\\data\\test\\subject_test.txt")
colnames(test_subj) <- "Subject"

Xtest <- cbind(test_subj, ytest1, Xtest1)
Xtest$set <- "test"
#head(Xtest[,c(1:4, 563)],2)
#any(is.na(Xtest))   # ck for nulls

## merge rows
train_test1 <- rbind(Xtraining, Xtest)
#head(train_test1[,c(1:6, 562:564)],2)

## list variable of activity(v1), mean, std, set label
ms_list <- c(1:8,43:48,83:88,123:128,163:168,203:204,216:217,229:230,242:243,255:256,268:273,296:298,347:352,375:377,426:431,454:456,505:506,515,518:519,528,531:532,541,544:545,554,557:564)

## subset mean and std columns only (plus activity & set)
train_test <- train_test1[, ms_list]
#head(train_test[c(1:2,10000:10001),c(1:13,87:89)],4)

## read activity labels into table
a_label1 <- read.table( ".\\data\\activity_labels.txt")
colnames(a_label1) <- c("Activity", "Act_Label")

##merge activity labels with readings
traintest <- merge(a_label1, train_test, by.x = "Activity", by.y = "Activity")
#head(traintest[c(1:2,10000:10001),c(1:13,87:89)],4)
#table(traintest$Act_Label, traintest$set )


##rename variables with full descriptive names from features.txt file
##    - grep for Mean or std to get var number; strip ()-, etc.
##  read new headers from file as a data row for viewing
##  names() to assign as new headers by column
features <- read.csv( ".\\data\\features.csv", header=FALSE)
names(traintest) [4:11] <- c("tBodyAcc-meanX","tBodyAcc-meanY","tBodyAcc-meanZ","tBodyAcc-stdX","tBodyAcc-stdY","tBodyAcc-stdZ","tGravityAcc-meanX","tGravityAcc-meanY")
names(traintest) [12:21] <- c("tGravityAcc-meanZ","tGravityAcc-stdX","tGravityAcc-stdY","tGravityAcc-stdZ","tBodyAccJerk-meanX","tBodyAccJerk-meanY","tBodyAccJerk-meanZ","tBodyAccJerk-stdX","tBodyAccJerk-stdY","tBodyAccJerk-stdZ")
names(traintest) [22:31] <- c("tBodyGyro-meanX","tBodyGyro-meanY","tBodyGyro-meanZ","tBodyGyro-stdX","tBodyGyro-stdY","tBodyGyro-stdZ","tBodyGyroJerk-meanX","tBodyGyroJerk-meanY","tBodyGyroJerk-meanZ","tBodyGyroJerk-stdX")
names(traintest) [32:41] <- c("tBodyGyroJerk-stdY","tBodyGyroJerk-stdZ","tBodyAccMag-mean","tBodyAccMag-std","tGravityAccMag-mean","tGravityAccMag-std","tBodyAccJerkMag-mean","tBodyAccJerkMag-std","tBodyGyroMag-mean","tBodyGyroMag-std")
names(traintest) [42:51] <- c("tBodyGyroJerkMag-mean","tBodyGyroJerkMag-std","fBodyAcc-meanX","fBodyAcc-meanY","fBodyAcc-meanZ","fBodyAcc-stdX","fBodyAcc-stdY","fBodyAcc-stdZ","fBodyAcc-meanFreqX","fBodyAcc-meanFreqY")
names(traintest) [52:61] <- c("fBodyAcc-meanFreqZ","fBodyAccJerk-meanX","fBodyAccJerk-meanY","fBodyAccJerk-meanZ","fBodyAccJerk-stdX","fBodyAccJerk-stdY","fBodyAccJerk-stdZ","fBodyAccJerk-meanFreqX","fBodyAccJerk-meanFreqY","fBodyAccJerk-meanFreqZ")
names(traintest) [62:71] <- c("fBodyGyro-meanX","fBodyGyro-meanY","fBodyGyro-meanZ","fBodyGyro-stdX","fBodyGyro-stdY","fBodyGyro-stdZ","fBodyGyro-meanFreqX","fBodyGyro-meanFreqY","fBodyGyro-meanFreqZ","fBodyAccMag-mean")
names(traintest) [72:81] <- c("fBodyAccMag-std","fBodyAccMag-meanFreq","fBodyBodyAccJerkMag-mean","fBodyBodyAccJerkMag-std","fBodyBodyAccJerkMag-meanFreq","fBodyBodyGyroMag-mean","fBodyBodyGyroMag-std","fBodyBodyGyroMag-meanFreq","fBodyBodyGyroJerkMag-mean","fBodyBodyGyroJerkMag-std")
names(traintest) [82:90] <- c("fBodyBodyGyroJerkMag-meanFreq","angle_tBodyAccMean_gravity","angle_tBodyAccJerkMean_gravityMean","angle_tBodyGyroMean_gravityMean","angle_tBodyGyroJerkMean_gravityMean","angle_X_gravityMean","angle_Y_gravityMean","angle_Z_gravityMean","set")


## save tidy traintest table to csv for backup
write.csv(traintest, file = ".\\data\\traintest.csv", row.names = FALSE)
tidy_tt <- traintest
tidy_tt <- rename(tidy_tt, Act_code = Activity, Activity = Act_Label)
## write file for commit
write.table(traintest, file = ".\\tidy_tt.txt", row.names = FALSE)
#head(tidy_tt[c(1:2,10000:10001),c(1:13,87:90)],4)

## run mean of all variables (incl std), by Activity and Subject (and train, test)
##variable names ending in "MEAN" for means, "N" for count
#tidy_means <- mean(group_by(tidy_tt, as.factor(Subject), Activity))
#g_tidy <- group_by(colMeans(tidy_tt), Activity)
tidy_means <- colMeans(g_tidy[,4:89])
tidy_means <- data.table(c( colMeans(g_tidy[,4:89]), g_tidy$Subject))
write.table(tidy_means, file= ".\\tidy_means.txt", row.names = FALSE)
#tidy_means$Subject <- Subject
#dim(tidy_means)
#dim(g_tidy)
tidy_means
