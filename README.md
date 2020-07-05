---
title: "README.md"
author: "Xinyu W"
date: "7/5/2020"
---

# Peer-graded Assignment: Getting and Cleaning Data Final Project

This repository is created by Xinyu W submitted for Coursera Data Science Specialization-Getting and Cleaning Data Course final project. The repo also contains a code book explaining all the variables and any relevant information.

### Dataset
The data used for the project are collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data can also be downloaded through the link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Files
1. CodeBook.md is a code book that describes the variables, the data, and any transformations or work that I performed to clean up the data.
2. run_analysis.R serves to collect, work with and clean the data sets downloaded from the link above. The data are prepared by the 5 steps:
* merges the training and the test sets to create one data set.
* extracts only the measurements on the mean and standard deviation for each measurement.
* uses descriptive activity names to name the activities in the data set.
* appropriately labels the data set with descriptive variable names.
* from the data set in step 4, creates a second, independent tidy data set (refer to "tidyDataset.txt") with the average of each variable for each activity and each subject.
3. tidyDataset.txt is the exported final data after going through all the sequences described above.