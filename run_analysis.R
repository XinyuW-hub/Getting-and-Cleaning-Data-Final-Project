#download and unzip the data
if(!file.exists("./data")){dir.create("./data")}
dataUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(dataUrl, destfile = "./data/analysisData.zip")
unzip("./data/analysisData.zip")

#load the table into R
features <- read.table("./UCI HAR Dataset/features.txt", header = FALSE)
activities <- read.table("./UCI HAR Dataset/activity_labels.txt",  header = FALSE)
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)

#Step1: Merges the training and the test sets to create one data set
Xdata <- rbind(x_train, x_test)
Ydata <- rbind(y_train, y_test)
subjectData <- rbind(subject_train, subject_test)
names(subjectData) <- c("subject")
names(Ydata) <- c("activity")
names(Xdata) <- features$V2
mergeData <- cbind(subjectData, Ydata, Xdata)

#Step2: Extracts only the measurements on the mean and standard deviation 
#for each measurement
selected <- features$V2[grep("mean\\(\\)|std\\(\\)|[Mm]ean", features$V2)]
selected <- c(as.character(selected), "subject", "activity")
extractData <- subset(mergeData, select = selected)

#Step3: Uses descriptive activity names to name the activities in the data set
extractData$activity <- activities[extractData$activity, 2]

#Step4: Appropriately labels the data set with descriptive variable names
names(extractData) <- gsub("^t", "time", names(extractData))
names(extractData) <- gsub("^f", "frequency", names(extractData))
names(extractData) <- gsub("Acc", "Accelerometer", names(extractData))
names(extractData) <- gsub("Gyro", "Gyroscope", names(extractData))
names(extractData) <- gsub("Mag", "Magnitude", names(extractData))
names(extractData) <- gsub("BodyBody", "Body", names(extractData))
names(extractData) <- gsub("angle", "Angle", names(extractData))
names(extractData) <- gsub("gravity", "Gravity", names(extractData))
names(extractData) <- gsub("-mean()", "Mean", names(extractData))
names(extractData) <- gsub("-std()", "STD", names(extractData))
names(extractData) <- gsub("-freq()", "Frequency", names(extractData))

#Step5: From the data set in step 4, creates a second, independent tidy data set 
##with the average of each variable for each activity and each subject
library(dplyr)
newData <- extractData %>% group_by(subject, activity) %>% summarise_all(list(mean=mean))
write.table(newData, "tidyDataset.txt", row.names = FALSE)
