##Coursera Getting and Cleaning Data Course Project

###Feature Selection: 

The dataset represents a subset of data from the Human Activity Recognition Using Smartphones Dataset Version 1.0.

The features selected for this dataset come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

###Naming conventions:

Variables renamed according to the recommended safe naming conventions at:
https://google-styleguide.googlecode.com/svn/trunk/Rguide.xml

The original convention of denoting time domain variables and frequency domain variables to begin with 't' and 'f' respectively was maintained.

The original variables containing the words 'Acc', Gyro' and 'Mag' were expanded to now contain 'Accelerometer, 'Gyroscope', 'Magnitude' respectively.

subjectId: An integer id of the subject performing the activities.
<<<<<<< HEAD
activityDesc:
One of six values 
* LAYING
* SITTING
* STANDING
* WALKING
* WALKING_DOWNSTAIRS
* WALKING_UPSTAIRS

###List of variables:
=======

activityDesc - One of six values:
* LAYING
* SITTING
* STANDING
* WALKING
* WALKING_DOWNSTAIRS
* WALKING_UPSTAIRS

###List of variables in this dataset:
>>>>>>> 0b2e1b16eee19191d0b6356538c35bb84677f63a

| Variable                            |
|-------------------------------------|
| subjectID                           |
| activityDesc                        |
| tBodyAccelerometerMeanX             |
| tBodyAccelerometerMeanY             |
| tBodyAccelerometerMeanZ             |
| tBodyAccelerometerStdX              |
| tBodyAccelerometerStdY              |
| tBodyAccelerometerStdZ              |
| tGravityAccelerometerMeanX          |
| tGravityAccelerometerMeanY          |
| tGravityAccelerometerMeanZ          |
| tGravityAccelerometerStdX           |
| tGravityAccelerometerStdY           |
| tGravityAccelerometerStdZ           |
| tBodyAccelerometerJerkMeanX         |
| tBodyAccelerometerJerkMeanY         |
| tBodyAccelerometerJerkMeanZ         |
| tBodyAccelerometerJerkStdX          |
| tBodyAccelerometerJerkStdY          |
| tBodyAccelerometerJerkStdZ          |
| tBodyGyroscopeMeanX                 |
| tBodyGyroscopeMeanY                 |
| tBodyGyroscopeMeanZ                 |
| tBodyGyroscopeStdX                  |
| tBodyGyroscopeStdY                  |
| tBodyGyroscopeStdZ                  |
| tBodyGyroscopeJerkMeanX             |
| tBodyGyroscopeJerkMeanY             |
| tBodyGyroscopeJerkMeanZ             |
| tBodyGyroscopeJerkStdX              |
| tBodyGyroscopeJerkStdY              |
| tBodyGyroscopeJerkStdZ              |
| tBodyAccelerometerMagnitudeMean     |
| tBodyAccelerometerMagnitudeStd      |
| tGravityAccelerometerMagnitudeMean  |
| tGravityAccelerometerMagnitudeStd   |
| tBodyAccelerometerJerkMagnitudeMean |
| tBodyAccelerometerJerkMagnitudeStd  |
| tBodyGyroscopeMagnitudeMean         |
| tBodyGyroscopeMagnitudeStd          |
| tBodyGyroscopeJerkMagnitudeMean     |
| tBodyGyroscopeJerkMagnitudeStd      |
| fBodyAccelerometerMeanX             |
| fBodyAccelerometerMeanY             |
| fBodyAccelerometerMeanZ             |
| fBodyAccelerometerStdX              |
| fBodyAccelerometerStdY              |
| fBodyAccelerometerStdZ              |
| fBodyAccelerometerJerkMeanX         |
| fBodyAccelerometerJerkMeanY         |
| fBodyAccelerometerJerkMeanZ         |
| fBodyAccelerometerJerkStdX          |
| fBodyAccelerometerJerkStdY          |
| fBodyAccelerometerJerkStdZ          |
| fBodyGyroscopeMeanX                 |
| fBodyGyroscopeMeanY                 |
| fBodyGyroscopeMeanZ                 |
| fBodyGyroscopeStdX                  |
| fBodyGyroscopeStdY                  |
| fBodyGyroscopeStdZ                  |
| fBodyAccelerometerMagnitudeMean     |
| fBodyAccelerometerMagnitudeStd      |
| fBodyAccelerometerJerkMagnitudeMean |
| fBodyAccelerometerJerkMagnitudeStd  |
| fBodyGyroscopeMagnitudeMean         |
| fBodyGyroscopeMagnitudeStd          |
| fBodyGyroscopeJerkMagnitudeMean     |
| fBodyGyroscopeJerkMagnitudeStd      |
