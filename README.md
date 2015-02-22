# HAR_Data_analysis
##Get & Clean Data Project
###for Coursera: getdata-011 Getting and Cleaning Data
###Johns Hopkins University


###author: RB Wiley
###Date: "Friday, February 13, 2015"

##Description of how the script(s) work.

*NOTE: working directory must contain data subdirectory: .\data\
+ data are previously downloaded and unzipped into repo containing .\data\
+ The code (run_analysis.R) is well commented - 
++ a single '#' begins all lines of 'check' commands, e.g., any(is.na(Xtraining))   # ck for nulls

1. Load plyr, dplyr libraries; expects as already installed
2. Read complete training and test (X* & y*, subject) datasets into tables
+    followed by merge (cbind) subject, X* and y* tables
+    rename subject table headers (Subject); rename y* table headers (Activity) 
+    create column of data set attribute("training" or "test")
+    followed by merge (rbind) train and test tables
+    followed by read only mean, std columns into new table (86 variables)  

3. Add activity labels as attributes
+   read activity labels file (activity_labels.txt) into table
+   merge by.x and by.y = "Activity"  

4. Rename variables with full descriptive names from features.txt file
+   grep for "Mean"" or "std" to get var number; strip ()-, etc.
+   names(x) in ~10 label batches to rename (known bug in rename() prevented its use)  

5. Save current, now tidy table to .csv file (traintest.csv) for backup
6. Add subject attribute to table for final tidy table (tidy_tt)
+   

