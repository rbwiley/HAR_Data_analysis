---
title: "HAR_Data_Analysis_CodeBook"
author: "rb wiley"
date: "Friday, February 13, 2015"
output: html_document
content: description of variables, data, transformation\steps to clean the data
---


  **  Information about the variables (including units!) in the data set not contained in the tidy data
  
  
  **  Information about the summary choices you made
  
  
  **  Information about the experimental study design you used
# Codebook.md
## Working with data
###Description of the run_analytics.R process
NOTE: the data are previously downloaded and unzipped into .\data

1. Loads library `plyr`
* Creates results folder
* Loads feature data set `features.txt` used for columns
* Loads and appends train dataset using `X_train.txt`, `y_train.txt`, `subject_train.txt`
  * `subject_train` contains the ids
	* `y_train` contains the activity labels
	* `X_train` contains the data using the feature data set as columns
* Loads and appends test dataset using `X_test.txt`, `y_test.txt`, `subject_test.txt`
	* `subject_test` contains the ids
	* `y_test` contains the activity labels
	* `X_test` contains the data using the feature data set as columns
* Appends train and test data
* Rearrange the data using id
* Loading activity labels `activity_labels.txt`
* Changes the data activity row to use the activity labels
* Extracts the `mean`,`std` into dataset1
* Saves dataset1 into `result/dataset1.csv`
* Uses plur to calculate mean on activity for each id
* appends `_mean` to all data columns
* saves the tidy dataset2 into `result/dataset2.csv`
