                                       

####Title :    Project  -  Getting  and  Cleaning  Data 

####Author:   Paulo Moniz

####Date  :   2015-07-21    


##Project Description :
  
  * Collect data through the link, extract the files, clean them and organize them.
  
  * Collect data through a link on the internet, extract the files, clean them and organize them.


##Study design and data processing
  
 
  * The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 

  * Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
    wearing a smartphone (Samsung Galaxy S II) on the waist.

  * Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular 
    velocity at a constant rate of 50Hz. 

  * The experiments have been video-recorded to label the data manually. 

  * The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for
    generating the training data and 30% the test data. 

  * The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in 
    fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 

  * The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth
    low-pass filter into body acceleration and gravity.

  * The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency 
    was used. 

  * From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

  
##Collection of the raw data
     
  * Collecting data link below 
 
     * https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

  * Extract the following files:

     * README.txt

     * features_info.txt': Shows information about the variables used on the feature vector.
                       
     * features.txt : List of all features.

     * activity_labels.txt: Links the class labels with their activity name.

     * train/X_train.txt: Training set.

     * train/y_train.txt: Training labels.

     * test/X_test.txt: Test set.

     * test/y_test.txt: Test labels.


##Notes

  * As can be seen from the Project Documentation reading the files that refer to INERTIAL
    SIGNAL  folder  will  not  be  included in this project, but only the files that refer 
    variables  "f"  and  "g".

  * (Note the 'f' to indicate frequency domain signals). 
        
  * time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz.

 
##Description of the variables in the tidy_data.txt file
 
  * tidy_data.txt the file have 69 columns and 10299 observations.

  * the file tidy_data.txt have the measured variables - Mean - mean() and Standard Deviation 
       -std() - regarding their respective features, totaling 69 variables.
             
  * Variables Mean and Standard Deviation :  
       
     * Subject                      -  Number that identifies the subjects in the study  
        
     * ActivityNumber               -  Number that identifies the activity that each participant made during the study
  
     * ActivityName                 -  Name of the activity that each participant made during the study

     * tBodyAcc-mean()-X            -  Average body accelerometer time on the X axis

     * tBodyAcc-mean()-Y            -  Average body accelerometer time on the Y axis  

     * tBodyAcc-mean()-Z            -  Average body accelerometer time on the Z axis

     * tBodyAcc-std()-X             -  Body accelerometer of the standard deviation on the X axis 

     * tBodyAcc-std()-Y             -  Body accelerometer of the standard deviation on the Y axis

     * tBodyAcc-std()-Z             -  Body accelerometer standard deviation on the Z axis
               
     * tGravityAcc-mean()-X         -  Gravity accelerometer Average time on the X axis

     * tGravityAcc-mean()-Y         -  Gravity accelerometer Average time on the Y axis    
          
     * tGravityAcc-std()-Y          -  Deviation gravity accelerometer weather pattern on the Y axis       

     * tGravityAcc-std()-Z          -  Deviation gravity accelerometer weather pattern on the Z axis

     * tBodyAccJerk-mean()-X        -  Average time of the linear acceleration of the body jerk signals obtained by the axis X

     * tBodyAccJerk-std()-X         -  Standard deviation of the body of the linear acceleration signals jerk obtained by the axis X 

     * tBodyGyro-std()-X            -  Standard deviation body gyroscope time on the X axis 

     * tBodyGyro-std()-Y            -  Standard deviation body gyroscope time on the X axis 

     * tBodyGyroJerk-mean()-Y       -  Average time of gyroscope of the body jerk signals obtained by the axis Y

     * tBodyGyroJerk-mean()-Z       -  Average time of gyroscope of the body jerk signals obtained by the axis Z
    
     * tBodyGyroJerk-std()-X        -  Standard deviation time of gyroscope of the body jerk signals obtained by the axis X
       
     * tBodyAccMag-mean()           -  Average body while the accelerometer scale

     * tBodyAccMag-std()            -  Standard deviation body while the accelerometer scale

     * tGravityAccMag-mean()        -  Average gravity while the accelerometer scale

     * tBodyAccJerkMag-std()        -  Standard deviation time of the linear acceleration of the body jerk signals

     * tBodyGyroMag-mean()          -  Average body while the gyroscope scale

     * tBodyGyroMag-std()           -  Standard deviation while the gyroscope scale
       
     * fBodyAcc-mean()-X            -  Average body accelerometer frequency on the X axis 

     * fBodyAcc-mean()-Y            -  Average body accelerometer frequency on the Y axis 

     * fBodyAcc-mean()-Z            -  Average body accelerometer frequency on the Z axis      
 
     * fBodyAcc-std()-Z             -  Body accelerometer standard deviation on the Z axis

     * fBodyAccJerk-mean()-X        -  Average frequency of the linear acceleration of the body jerk signals obtained by the axis X

     * fBodyAccJerk-mean()-Y        -  Average frequency of the linear acceleration of the body jerk signals obtained by the axis Y
       
     * fBodyAccJerk-std()-Y         -  Standard deviation frequency of the body of the linear acceleration signals jerk obtained by the axis Y  

     * fBodyAccJerk-std()-Z         -  Standard deviation frequency of the body of the linear acceleration signals jerk obtained by the axis Z

     * fBodyGyro-mean()-X           -  Average body frequency on the X axis  
       
     * BodyGyro-std()-X             -  Standard deviation body frequency on the X axis 

     * fBodyGyro-std()-Y            -  Standard deviation body frequency on the Y axis 
 
     * fBodyGyro-std()-Z            -  Standard deviation body frequency on the Z axis  
      
     * fBodyBodyAccJerkMag-mean()   -  Average frequency of the linear acceleration of the body jerk signals

     * fBodyBodyAccJerkMag-std()    -  Standard deviation frequency of the linear acceleration of the body jerk signals

     * fBodyBodyGyroMag-mean()      -  Average frequency of the linear acceleration of the body jerk signals
        
     * tGravityAcc-std()-X          -  Deviation gravity accelerometer weather pattern on the X axis

     * tBodyAccJerk-mean()-Y        -  Average frequency of the linear acceleration of the body jerk signals obtained by the axis Y

     * tBodyAccJerk-mean()-Z        -  Average frequency of the linear acceleration of the body jerk signals obtained by the axis Z

     * tBodyGyro-std()-Z            -  Standard deviation body frequency on the Z axis 

     * tBodyGyroJerk-mean()-X       -  Average time of gyroscope of the body jerk signals obtained by the axis X

     * tBodyGyroJerk-std()-Y        -  Standard deviation time of gyroscope of the body jerk signals obtained by the axis Y
       
     * tBodyGyroJerk-std()-Z        -  Standard deviation time of gyroscope of the body jerk signals obtained by the axis Z

     * tGravityAccMag-std()         -  Standard deviation gravity while the accelerometer scale

     * tBodyAccJerkMag-mean()       -  Average frequency of the linear acceleration of the body jerk signals
       
     * tBodyGyroJerkMag-mean()      - Average frequency of the linear gyroscope of the body jerk signals
     
     * fBodyAcc-std()-X             -  Body accelerometer of the standard deviation on the X axis       

     * fBodyAcc-std()-Y             -  Body accelerometer of the standard deviation on the Y axis

     * fBodyAccJerk-mean()-Z        -  Body accelerometer of the standard deviation on the Z axis

     * fBodyAccJerk-std()-X         -  Standard deviation of the body of the linear acceleration signals jerk obtained by the axis X  
       
     * fBodyGyro-mean()-Y           -  Average body frequency on the Y axis  
 
     * fBodyGyro-mean()-Z           -  Average body frequency on the Y axis 

     * fBodyAccMag-mean()           -  Average body while the accelerometer scale
   
     * fBodyAccMag-std()            -  Standard deviation body while the accelerometer scale
   
     * tBodyAcc-std()-X             -  Body accelerometer of the standard deviation on the X axis  

     * tBodyAcc-std()-Y             -  Body accelerometer of the standard deviation on the Y axis  

     * tGravityAcc-mean()-Z         -  Gravity accelerometer Average time on the X axis



#### For the input files and intermediaries in the R environment and the tidy_data.txt file on 
     your computer, run script "run_analisys.r". 


          