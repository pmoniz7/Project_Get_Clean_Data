#Objective of the project for the student

##The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.


* Loads data.table and plyr libraries, makes Download the files at the location indicated in the project
  documentation and extract these files.


* Draws getwd () function to indicate the directory where the files will be downloaded


* Uses download.file () function to download the files in the folder Dataset.zip using the link below.

  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

  A full description is available at the site where the data was obtained: 

    
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

* Use 7-Zip program to extract the files in the folder UCI HAR Dataset

* Loads for R files "Subjects", "Activitys" and "dates" for the environment R of the following files:
  * subject_train.txt
  * Y_train.txt
  * subject_test.txt
  * Y_test.txt
  * X_train.txt
  * X_test.txt


* Joins the subject_train.txt and subject_test.txt files and renames
  the "V1" variable to "Subject"


* Joins the y_train.txt and y_test.txt files and renames
  the "V1" variable to "ActivityNumber"


* Joins the X_train and X_test data files


* Adds the column "Subject" and "Activity" to the data file


* Read file with code and name of activity


* Performs sub select to only extract the average and standard deviation columns


* Setnames effects in the data file to replace the variable names (VN1, VN2, VN3 ,....)
  for the names of variables relating to average and Standard Deviation mean () and std ().


* Generates tidy file date as date table below uses the write.table function to upload to Github

 