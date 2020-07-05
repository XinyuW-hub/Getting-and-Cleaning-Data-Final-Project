---
title: "Code Book"
author: "Xinyu W"
date: "7/5/2020"
---
# Code Book
The run_analysis.R script serves to collect, work with and clean a data set downloaded as required. The preparation work includes steps as below.

### 1. Download datasets
Download, unzip and extract the dataset under the folder "UCI HAR Dataset."

### 2. Read the data into R tables
* **features** - read from "features.txt" with 561 rows and 2 columns. The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
* **activities** - read from "activity_labels.txt" with 6 rows and 2 columns. Links the class labels with their activity name. 
* **subject_test** - read from "test/subject_test.txt" with 2947 rows and 2 columns. Contains test data of 9/30 volunteer test subjects being observed.
* **x_test** - read from "test/X_test.txt" with 2947 rows and 561 columns. Contains test sets.
* **y_test** - read from "test/y_test.txt" with 2947 rows and 1 column. Contains test labels.
* **subject_train** - read from "train/subject_train.txt" with 7352 rows and 1 column. Contains train data of 21/30 volunteer subjects being observed.
* **x_train** - read from "train/X_train.txt" with 7352 rows and 561 columns. Contains training sets.
* **y_train** - read from "train/y_train.txt" with 7352 rows and 1 column. Contains training labels.

### 3. Merges the training and the test sets to create one data set
* **Xdata** - merge the x_train and x_test data.
* **Ydata** - merge the y_train and y_test data.
* **subjectData** - merge the subject_train and subject_test data.
* **mergeData** - combine all data (Xdata, Ydata and subjectData) into one dataframe.

### 4. Extracts only the measurements on the mean and standard deviation for each measurement
* **selected** - Contain the labels(or elements) that will be used to extract relevant measurements from mergeData.
* **extractData** - Extract only the measurements on the mean and standard deviation (according to selected) by subsetting mergeData.

### 5. Uses descriptive activity names to name the activities in the data set
* replace the "activity" column of extractData by the corresponding activity labels, which can be found in activities variable.

### 6.Appropriately labels the data set with descriptive variable names
* substitute character **t** at the start of the column's names with "time"
* substitute character **f** at the start of the column's names with "frequency"
* substitute **Acc** in column's names with "Accelerometer"
* substitute **Gyro** in column's name with "Gyroscope"
* substitute **Mag** in column's name with "Magnitude"
* substitute **BodyBody** in column's name with "Body"
* substitute **angle** in column's name with "Angle"
* substitute **gravity** in column's name with "Gravity"
* substitute **-mean()** in column's name with "Mean"
* substitute **-std()** in column's name with "STD"
* substitute **-freq()** in column's name with "Frequency"

### 7. Create a second, independent tidy data set with the average of each variable for each activity and each subject
* **newData** - with 180 rows and 88 columns is created by grouping through subject and activity, and summarising the extractData taking the means of each variable for each activity and each subject.
