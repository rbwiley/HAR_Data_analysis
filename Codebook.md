---
title: "HAR_Data_Analysis_CodeBook"
author: "rb wiley"
date: "Friday, February 13, 2015"
output: html_document
content: description of variables, data, transformation\steps to clean the data
---
  
  
  **  Information about the experimental study design 
      Data are included from both training experiments and formal tests. 
      Both are included in the analysis, however, only the test dataset are 
      used in the final tidy statistics processing.  

  **  Information about the grouping choices made
  *** by Subject (integer id from 1 to 30)
  *** by Activity (activity code integer 1 to 6; assigned 6 physical activities)  

  **  Information about the variables in the data set not contained in the tidy data
  *** 1st: variables used in processing (not in tidy sets) are described 
  *** 2nd: variables of stats tidy file
  *** 3rd: variables of bulk tidy datasets  
  

# Codebook.md
## Working with data
###Description of the run_analytics.R process
NOTE: the data are previously downloaded and unzipped into .\data

1. Processing variables
** bulk data prep
* `features.txt`: feature data set; used for columns
* `X_train.txt` :train dataset using measurements; read to X_train table
* 'y_train.txt` :train dataset Activity codes; read to y_train table
* `subject_train.txt` train dataset subject codes;  
* `subject_train`: 
* Xtraining :merged training set; tables contain the ids  

	* Loads and appends test dataset using 
* `X_test.txt`  :test dataset using measurements; read to X_test table
* `y_test.txt`  :test dataset Activity codes; read to y_test table
* `subject_test.txt`: test dataset subject codes;
* `subject_test`  : subject table for test set; 
* Xtest : merged test set; tables contain the ids  
 
*  `activity_labels.txt`: Loading activity labels to table for merge on data sets  

** reduce data to Extract the `mean`,`std` variables into table
* ms_list: list variable #s of variables with mean, std
* train_test1 : merged table from training and test sets
* train_test  : table with only the mean, std and attribute columns


** tidy stats data variables: except attribute vars; stats are in pairs: 
    Mean, N for all Mean & std variables
    +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Subject
Act_Label
tBodyAcc-meanXMean
tBodyAcc-meanXN
tBodyAcc-meanYMean
tBodyAcc-meanYN
tBodyAcc-meanZMean
tBodyAcc-meanZN
tBodyAcc-stdXMean
tBodyAcc-stdXN
tBodyAcc-stdYMean
tBodyAcc-stdYN
tBodyAcc-stdZMean
tBodyAcc-stdZN
tGravityAcc-meanXMean
tGravityAcc-meanXN
tGravityAcc-meanYMean
tGravityAcc-meanYN
tGravityAcc-meanZMean
tGravityAcc-meanZN
tGravityAcc-stdXMean
tGravityAcc-stdXN
tGravityAcc-stdYMean
tGravityAcc-stdYN
tGravityAcc-stdZMean
tGravityAcc-stdZN
tBodyAccJerk-meanXMean
tBodyAccJerk-meanXN
tBodyAccJerk-meanYMean
tBodyAccJerk-meanYN
tBodyAccJerk-meanZMean
tBodyAccJerk-meanZN
tBodyAccJerk-stdXMean
tBodyAccJerk-stdXN
tBodyAccJerk-stdYMean
tBodyAccJerk-stdYN
tBodyAccJerk-stdZMean
tBodyAccJerk-stdZN
tBodyGyro-meanXMean
tBodyGyro-meanXN
tBodyGyro-meanYMean
tBodyGyro-meanYN
tBodyGyro-meanZMean
tBodyGyro-meanZN
tBodyGyro-stdXMean
tBodyGyro-stdXN
tBodyGyro-stdYMean
tBodyGyro-stdYN
tBodyGyro-stdZMean
tBodyGyro-stdZN
tBodyGyroJerk-meanXMean
tBodyGyroJerk-meanXN
tBodyGyroJerk-meanYMean
tBodyGyroJerk-meanYN
tBodyGyroJerk-meanZMean
tBodyGyroJerk-meanZN
tBodyGyroJerk-stdXMean
tBodyGyroJerk-stdXN
tBodyGyroJerk-stdYMean
tBodyGyroJerk-stdYN
tBodyGyroJerk-stdZMean
tBodyGyroJerk-stdZN
tBodyAccMag-meanMean
tBodyAccMag-meanN
tBodyAccMag-stdMean
tBodyAccMag-stdN
tGravityAccMag-meanMean
tGravityAccMag-meanN
tGravityAccMag-stdMean
tGravityAccMag-stdN
tBodyAccJerkMag-meanMean
tBodyAccJerkMag-meanN
tBodyAccJerkMag-stdMean
tBodyAccJerkMag-stdN
tBodyGyroMag-meanMean
tBodyGyroMag-meanN
tBodyGyroMag-stdMean
tBodyGyroMag-stdN
tBodyGyroJerkMag-meanMean
tBodyGyroJerkMag-meanN
tBodyGyroJerkMag-stdMean
tBodyGyroJerkMag-stdN
fBodyAcc-meanXMean
fBodyAcc-meanXN
fBodyAcc-meanYMean
fBodyAcc-meanYN
fBodyAcc-meanZMean
fBodyAcc-meanZN
fBodyAcc-stdXMean
fBodyAcc-stdXN
fBodyAcc-stdYMean
fBodyAcc-stdYN
fBodyAcc-stdZMean
fBodyAcc-stdZN
fBodyAcc-meanFreqXMean
fBodyAcc-meanFreqXN
fBodyAcc-meanFreqYMean
fBodyAcc-meanFreqYN
fBodyAcc-meanFreqZMean
fBodyAcc-meanFreqZN
fBodyAccJerk-meanXMean
fBodyAccJerk-meanXN
fBodyAccJerk-meanYMean
fBodyAccJerk-meanYN
fBodyAccJerk-meanZMean
fBodyAccJerk-meanZN
fBodyAccJerk-stdXMean
fBodyAccJerk-stdXN
fBodyAccJerk-stdYMean
fBodyAccJerk-stdYN
fBodyAccJerk-stdZMean
fBodyAccJerk-stdZN
fBodyAccJerk-meanFreqXMean
fBodyAccJerk-meanFreqXN
fBodyAccJerk-meanFreqYMean
fBodyAccJerk-meanFreqYN
fBodyAccJerk-meanFreqZMean
fBodyAccJerk-meanFreqZN
fBodyGyro-meanXMean
fBodyGyro-meanXN
fBodyGyro-meanYMean
fBodyGyro-meanYN
fBodyGyro-meanZMean
fBodyGyro-meanZN
fBodyGyro-stdXMean
fBodyGyro-stdXN
fBodyGyro-stdYMean
fBodyGyro-stdYN
fBodyGyro-stdZMean
fBodyGyro-stdZN
fBodyGyro-meanFreqXMean
fBodyGyro-meanFreqXN
fBodyGyro-meanFreqYMean
fBodyGyro-meanFreqYN
fBodyGyro-meanFreqZMean
fBodyGyro-meanFreqZN
fBodyAccMag-meanMean
fBodyAccMag-meanN
fBodyAccMag-stdMean
fBodyAccMag-stdN
fBodyAccMag-meanFreqMean
fBodyAccMag-meanFreqN
fBodyBodyAccJerkMag-meanMean
fBodyBodyAccJerkMag-meanN
fBodyBodyAccJerkMag-stdMean
fBodyBodyAccJerkMag-stdN
fBodyBodyAccJerkMag-meanFreqMean
fBodyBodyAccJerkMag-meanFreqN
fBodyBodyGyroMag-meanMean
fBodyBodyGyroMag-meanN
fBodyBodyGyroMag-stdMean
fBodyBodyGyroMag-stdN
fBodyBodyGyroMag-meanFreqMean
fBodyBodyGyroMag-meanFreqN
fBodyBodyGyroJerkMag-meanMean
fBodyBodyGyroJerkMag-meanN
fBodyBodyGyroJerkMag-stdMean
fBodyBodyGyroJerkMag-stdN
fBodyBodyGyroJerkMag-meanFreqMean
fBodyBodyGyroJerkMag-meanFreqN
angle_tBodyAccMean_gravityMean
angle_tBodyAccMean_gravityN
angle_tBodyAccJerkMean_gravityMeanMean
angle_tBodyAccJerkMean_gravityMeanN
angle_tBodyGyroMean_gravityMeanMean
angle_tBodyGyroMean_gravityMeanN
angle_tBodyGyroJerkMean_gravityMeanMean
angle_tBodyGyroJerkMean_gravityMeanN
angle_X_gravityMeanMean
angle_X_gravityMeanN
angle_Y_gravityMeanMean
angle_Y_gravityMeanN
angle_Z_gravityMeanMean
angle_Z_gravityMeanN


** bulk data tidy table variables
    final variable is "set"; id for "training" or "test" dataset
Activity
Act_Label
Subject
tBodyAcc-meanX
tBodyAcc-meanY
tBodyAcc-meanZ
tBodyAcc-stdX
tBodyAcc-stdY
tBodyAcc-stdZ
tGravityAcc-meanX
tGravityAcc-meanY
tGravityAcc-meanZ
tGravityAcc-stdX
tGravityAcc-stdY
tGravityAcc-stdZ
tBodyAccJerk-meanX
tBodyAccJerk-meanY
tBodyAccJerk-meanZ
tBodyAccJerk-stdX
tBodyAccJerk-stdY
tBodyAccJerk-stdZ
tBodyGyro-meanX
tBodyGyro-meanY
tBodyGyro-meanZ
tBodyGyro-stdX
tBodyGyro-stdY
tBodyGyro-stdZ
tBodyGyroJerk-meanX
tBodyGyroJerk-meanY
tBodyGyroJerk-meanZ
tBodyGyroJerk-stdX
tBodyGyroJerk-stdY
tBodyGyroJerk-stdZ
tBodyAccMag-mean
tBodyAccMag-std
tGravityAccMag-mean
tGravityAccMag-std
tBodyAccJerkMag-mean
tBodyAccJerkMag-std
tBodyGyroMag-mean
tBodyGyroMag-std
tBodyGyroJerkMag-mean
tBodyGyroJerkMag-std
fBodyAcc-meanX
fBodyAcc-meanY
fBodyAcc-meanZ
fBodyAcc-stdX
fBodyAcc-stdY
fBodyAcc-stdZ
fBodyAcc-meanFreqX
fBodyAcc-meanFreqY
fBodyAcc-meanFreqZ
fBodyAccJerk-meanX
fBodyAccJerk-meanY
fBodyAccJerk-meanZ
fBodyAccJerk-stdX
fBodyAccJerk-stdY
fBodyAccJerk-stdZ
fBodyAccJerk-meanFreqX
fBodyAccJerk-meanFreqY
fBodyAccJerk-meanFreqZ
fBodyGyro-meanX
fBodyGyro-meanY
fBodyGyro-meanZ
fBodyGyro-stdX
fBodyGyro-stdY
fBodyGyro-stdZ
fBodyGyro-meanFreqX
fBodyGyro-meanFreqY
fBodyGyro-meanFreqZ
fBodyAccMag-mean
fBodyAccMag-std
fBodyAccMag-meanFreq
fBodyBodyAccJerkMag-mean
fBodyBodyAccJerkMag-std
fBodyBodyAccJerkMag-meanFreq
fBodyBodyGyroMag-mean
fBodyBodyGyroMag-std
fBodyBodyGyroMag-meanFreq
fBodyBodyGyroJerkMag-mean
fBodyBodyGyroJerkMag-std
fBodyBodyGyroJerkMag-meanFreq
angle_tBodyAccMean_gravity
angle_tBodyAccJerkMean_gravityMean
angle_tBodyGyroMean_gravityMean
angle_tBodyGyroJerkMean_gravityMean
angle_X_gravityMean
angle_Y_gravityMean
angle_Z_gravityMean
set
