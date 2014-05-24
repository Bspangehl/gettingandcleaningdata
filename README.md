##Coursera Getting and Cleaning Data Course Project

The dataset represents a subset of data from the Human Activity Recognition Using Smartphones Dataset Version 1.0 by:

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

A full description is available at the site where the original data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

For more information about the original dataset contact: activityrecognition@smartlab.ws


###The dataset includes the following files:
- README.md

- CodeBook.md

- run_analysis.R: Script that produces tidyDataSet of the mean of each variable per subject-activity combination.

- tidyDataSet.txt: Each row identifies the subject who performed the activity, the activity performed and the average of each variable for each activity and each subject (i.e. the mean of each variable per subject-activity combination). 


###Running the script in R:
If not already done, set the working directory.

To execute:
source('run_analysis.R')
 
The script assumes either the data is in a directory called 'UCI HAR Dataset'
in the current working directory
OR 
a zip file called 'getdata_projectfiles_UCI HAR Dataset.zip' is in the current
working directory.
If the 'UCI HAR Dataset' directory cannot be found then it will attempt unzip command.

The script reads in all relevant data and selects features that relate to the mean and std measurements. These are denoted by features with -mean() and -std() in their names.

After manipulating the data into a single dataframe the script uses melt and dcast to transform the data in order to produce a dataset showing the average of each variable for each activity and each subject (i.e. the mean of each variable per subject-activity combination)

The final dataset is called tidyDataset


###License:
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.