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
f_subject_train  <- fread(file.path(path, "UCI HAR Dataset", "train", "subject_train.txt"))

f_activity_train <- fread(file.path(path, "UCI HAR Dataset", "train", "Y_train.txt"))

f_subject_test   <- fread(file.path(path, "UCI HAR Dataset", "test",  "subject_test.txt"))

f_activity_test  <- fread(file.path(path, "UCI HAR Dataset", "test",  "Y_test.txt"))

data_train <- read.table (file.path(path, "UCI HAR Dataset", "train", "X_train.txt"))

data_test  <- read.table (file.path(path, "UCI HAR Dataset", "test",  "X_test.txt"))

data_train_tb <- data.table(data_train)             

data_test_tb  <- data.table(data_test) 

#--------------------------------------------------------------------------------------
# joins the subject_train.txt and subject_test.txt files and renames
# the "V1" variable to "Subject"
#--------------------------------------------------------------------------------------
f_subject <- rbind(f_subject_train, f_subject_test)
setnames(f_subject, "V1", "Subject")

#--------------------------------------------------------------------------------------
# joins the y_train.txt and y_test.txt files and renames
# the "V1" variable to "ActivityNumber" 
#--------------------------------------------------------------------------------------
f_activity <- rbind(f_activity_train, f_activity_test)
setnames(f_activity, "V1", "ActivityNumber")

#--------------------------------------------------------------------------------------
# joins the X_train and X_test data files
#--------------------------------------------------------------------------------------
data_train_test <- rbind(data_train_tb, data_test_tb) 

#--------------------------------------------------------------------------------------
# Adds the column "Subject" and "Activity" to the data file
#--------------------------------------------------------------------------------------
f_subj_acti <- cbind(f_subject, f_activity)

f_data_subj_acti  <- cbind(f_subj_acti, data_train_test)

setkey (f_data_subj_acti, Subject, ActivityNumber)

#--------------------------------------------------------------------------------------
# Read file with code and name of activity
#--------------------------------------------------------------------------------------
f_activity_label  <- fread(file.path(path, "UCI HAR Dataset", "activity_labels.txt"))
setnames(f_activity_label, names(f_activity_label), c("ActivityNumber", "ActivityName"))

# merge between data files and file activity 
f_data_subj_acti <- merge(f_data_subj_acti, f_activity_label, by = "ActivityNumber", all.x = TRUE)

f_features <- fread(file.path(path, "UCI HAR Dataset", "features.txt"))

f_features <- f_features[grepl("mean\\(\\)|std\\(\\)", V2)]

f_features 

#sub select para extrair somente as colunas media  e  desvio padrao
subset_train_test <- subset (f_data_subj_acti,
                            select=c("Subject", "ActivityNumber", "ActivityName",    "V1",   "V2",   "V3",   "V4",   "V5",   "V6",   
                                     "V41",  "V42",  "V43",  "V44",  "V45",  "V46",  "V81",  "V82",  "V83",  "V84",  "V85",  "V86",  
                                     "V121", "V122", "V123", "V124", "V125", "V126", "V161", "V162", "V163", "V164", "V165", "V166", 
                                     "V201", "V202", "V214", "V215", "V227", "V228", "V240", "V241", "V253", "V254", "V266", "V267", 
                                     "V268", "V269", "V270", "V271", "V345", "V346", "V347", "V348", "V349", "V350", "V424", "V425", 
                                     "V426", "V427", "V428", "V429", "V503", "V504", "V516", "V517", "V529", "V530", "V542", "V543"))

setnames (subset_train_test, names(subset_train_test), 
        c("Subject",                    "ActivityNumber",            "ActivityName",
          "tBodyAcc-mean()-X",          "tBodyAcc-mean()-Y",         "tBodyAcc-mean()-Z",       "tBodyAcc-std()-X",        "tBodyAcc-std()-Y",
          "tBodyAcc-std()-Z" ,          "tGravityAcc-mean()-X",      "tGravityAcc-mean()-Y",    "tGravityAcc-mean()-Z",    "tGravityAcc-std()-X",
          "tGravityAcc-std()-Y",        "tGravityAcc-std()-Z" ,      "tBodyAccJerk-mean()-X",   "tBodyAccJerk-mean()-Y",   "tBodyAccJerk-mean()-Z",
          "tBodyAccJerk-std()-X",       "tBodyAccJerk-std()-Y",      "tBodyAccJerk-std()-Z",    "tBodyGyro-mean()-X",      "tBodyGyro-mean()-Y",
          "tBodyGyro-mean()-Z",         "tBodyGyro-std()-X",         "tBodyGyro-std()-Y",       "tBodyGyro-std()-Z",       "tBodyGyroJerk-mean()-X",
          "tBodyGyroJerk-mean()-Y",     "tBodyGyroJerk-mean()-Z",    "tBodyGyroJerk-std()-X",   "tBodyGyroJerk-std()-Y",   "tBodyGyroJerk-std()-Z",
          "tBodyAccMag-mean()",         "tBodyAccMag-std()",         "tGravityAccMag-mean()",   "tGravityAccMag-std()",    "tBodyAccJerkMag-mean()",
          "tBodyAccJerkMag-std()",      "tBodyGyroMag-mean()",       "tBodyGyroMag-std()",      "tBodyGyroJerkMag-mean()", "tBodyGyroJerkMag-std()",
          "fBodyAcc-mean()-X",          "fBodyAcc-mean()-Y",         "fBodyAcc-mean()-Z",       "fBodyAcc-std()-X",        "fBodyAcc-std()-Y",    
          "fBodyAcc-std()-Z",           "fBodyAccJerk-mean()-X",     "fBodyAccJerk-mean()-Y",   "fBodyAccJerk-mean()-Z",   "fBodyAccJerk-std()-X",
          "fBodyAccJerk-std()-Y",       "fBodyAccJerk-std()-Z",      "fBodyGyro-mean()-X",      "fBodyGyro-mean()-Y",      "fBodyGyro-mean()-Z",
          "fBodyGyro-std()-X",          "fBodyGyro-std()-Y",         "fBodyGyro-std()-Z",       "fBodyAccMag-mean()",      "fBodyAccMag-std()",
          "fBodyBodyAccJerkMag-mean()", "fBodyBodyAccJerkMag-std()", "fBodyBodyGyroMag-mean()", "fBodyBodyGyroMag-std()",  "fBodyBodyGyroJerkMag-mean()",
          "fBodyBodyGyroJerkMag-std()" ))

names(subset_train_test)

setkey (subset_train_test, Subject)

tidy_data <-subset_train_test

folder <- file.path(path, "tidy_data.txt")

write.table(tidy_data, folder, quote=FALSE, sep="\t", row.names=FALSE)
