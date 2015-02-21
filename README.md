---
title: "Untitled"
author: "fwala"
date: "Saturday, February 21, 2015"
output: html_document
---
##Getting and cleaning data course project:

**Objective:** To combine various data files from into one data set & create a reduced tidy data set. 

As per Coursera Instructions Github repository should contain:

1) `README.md` - describing how the script works and the code book describing the variables.
2) `run_analysis.R` - should generate tidydata.txt
3) `CodeBook.md` - Describing the variables you have created.
4) `tidydata.txt` - The final tidy set contains average values of the sensor outputs.

**Part 1. Download .ZIP file & Unzip data set.**

Here it checks if the `.ZIP` is in the directory. If not, it downloads it.
Also it checks if the directory exists or not.
  
**Part 2. Getting data sets into R.**

Here each file is read into a variable. Also the column names are labeled for easy processing later.

Files read:

`activity_labels.txt` The activity IDs along with activity name.

`features.txt` The corresponding column names for each sensor output & calculation.

`train/y_train.txt` The activity IDs performed by each subject.

`train/X_train.txt` The output & calculated data of the sensors 

`train/subject_train.txt` The subject IDs in the order in which each activity was performed


`test/y_test.txt` The activity IDs performed by each subject.

`test/X_test.txt` The output & calculated data of the sensors

`test/subject_test.txt` The subject IDs in the order in which each activity was performed


**Part 3: Combine Train & Test Data Sets. TRAIN_SET & TEST_SET**
Since they contain the same columns, we combine them by joining  the rows.

1. Using dimension information, we combine the test set & the training set by binding the rows. Also the features names are assigned column names of the combined set. 

2. We combine the subject IDs of each observation in both the sets.

3. We also combine the activity IDs of each observation in both the sets.

**Part 4: Using descriptive activity to name the activities in the data set.**
Here we use the description given by the plyr join() prserves order.

We create a column which describes the activity being performed corresponding to the activity ID. This helps as we know the activity instead of just the activity ID.

**Part 5: Merging all the columns into one single data set.**

Finally, all the information i.e. sensor output, subject IDs & activity ID & activity label is combined into a single set.

**Part 6: Extracts only the measurements on the  mean and standard deviation for each measurement. **

We then keep information only relating to the mean & standard deviation values & discard the rest of the sensor outputs.

**Part 7: Appropriately labels the data set with descriptive variable names. **

Since the column names of the reduced dataset is in the original form, we try to tidy it up by using some standard notation like using underscore(_), all capitals, etc...

**Part 8: Melting the dataset i.e. shaping the data set so that it is sorted by subject_id & activity_label**

We use `melt()` as a way to sort the data set by subject ID & activity label. This is used as we need to create the average of each variable for each activity and each subject.

Then we use `dcast()` to calculate the average of each sensor output for each subject sorted by subject ID.

**Part 9: Rewrite the final reduced data set into a file.**
We use `write.table()` 

