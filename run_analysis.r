#---------------------------------------------------------------------------------------
#  Loads libraries, makes Download the files at the location indicated in the project 
#  documentation and extract these files.
#---------------------------------------------------------------------------------------
library (data.table)
library (plyr)

path <- getwd()

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

folder <- "UciHar.zip"

if (!file.exists(path)) {
  dir.create(path)
}
download.file(url, file.path(path, folder))

# OBS : to step down function, your system must have installed
# the program as 7-zip version of windows
# punzip <- file.path("C:", "Program Files (x86)", "7-Zip", "7z.exe")

punzip <- file.path("C:", "Program Files", "7-Zip", "7z.exe")
par <- "x"
exe <- paste(paste0("\"", punzip, "\""), par, paste0("\"", file.path(path,folder), "\""))
system(exe)

#---------------------------------------------------------------------------------------
# As can be seen from the Project Documentation reading the files that refer to INERTIAL
# SIGNAL folder will not be included in this project, but only the files that refer 
# variables "f" and "g".
#---------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------
# loads for R files "Subjects" , "Activitys" and "Datas"
#---------------------------------------------------------------------------------------
subject_train  <- read.table(file.path(path, "UCI HAR Dataset", "train", "subject_train.txt"))

y_train <- read.table(file.path(path, "UCI HAR Dataset", "train", "Y_train.txt"))

x_train <- read.table(file.path(path, "UCI HAR Dataset", "train", "X_train.txt"))


#----------------------------------------------------------------------------------------

subject_test   <- read.table(file.path(path, "UCI HAR Dataset", "test",  "subject_test.txt"))

y_test  <- read.table(file.path(path, "UCI HAR Dataset", "test",  "Y_test.txt"))

x_test  <- read.table (file.path(path, "UCI HAR Dataset", "test",  "X_test.txt"))

#----------------------------------------------------------------------------------------
# create 'x' , "y" and subject data sets

x_dt <- rbind(x_train, x_test)

y_dt <- rbind(y_train, y_test)

subject_dt <- rbind(subject_train, subject_test)

#----------------------------------------------------------------------------------------
## Extracts only the mean and standard deviation measurements for each measurement.

features <- read.table(file.path(path, "UCI HAR Dataset", "features.txt"))

features_mean_std <- grep("-(mean|std)\\(\\)", features[, 2])


x_dt <- x_dt[, features_mean_std] 


names(x_dt) <- features[features_mean_std, 2] 


#--------------------------------------------------------------------------------------
# Adds the column "Subject" and "Activity" to the data file
#--------------------------------------------------------------------------------------
activities <- read.table(file.path(path, "UCI HAR Dataset", "activity_labels.txt"))

y_dt[, 1] <- activities[y_dt[, 1], 2] 

names(y_dt) <- "activity" 

names(subject_dt) <- "subject" 

#Joining the intermediate files
join_dt <-cbind(x_dt, y_dt, subject_dt)


#Creates a second tidy data with the average of each variable for each activity and each subject
average_dt <- ddply(join_dt, .(subject, activity), function(x) colMeans(x[, 1:66])) 

write.table(average_dt, "tidy_dt.txt", row.name=FALSE) 