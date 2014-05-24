## This script assumes either the data is in a directory called UCI HAR Dataset
## in the current working directory
## OR 
## a zip file called getdata_projectfiles_UCI HAR Dataset.zip is in the current
## working directory.
## If the directory cannot be found then it will attempt unzip command
if (!file.exists("UCI HAR Dataset")) {
  if (!file.exists("getdata_projectfiles_UCI HAR Dataset.zip")) {
    stop("was expecting HAR Dataset folder or zip file")
  } else {
    unzip("getdata_projectfiles_UCI HAR Dataset.zip")
  }
}


## Set directory from which to read the data
dir <- "UCI HAR Dataset"


## Read in the test data
dfSubjectTest <- read.table(paste(dir,"/test/subject_test.txt",sep="")
                           ,stringsAsFactors=FALSE
                           ,col.names="subjectID")

dfXTest <- read.table(paste(dir,"/test/x_test.txt",sep="")
                     ,stringsAsFactors=FALSE)

dfYTest <- read.table(paste(dir,"/test/y_test.txt",sep="")
                     ,stringsAsFactors=FALSE
                     ,col.names="activityID")


## Read in the train data
dfSubjectTrain <- read.table(paste(dir,"/train/subject_train.txt",sep="")
                            ,stringsAsFactors=FALSE
                            ,col.names="subjectID")

dfXTrain <- read.table(paste(dir,"/train/x_train.txt",sep="")
                      ,stringsAsFactors=FALSE)

dfYTrain <- read.table(paste(dir,"/train/y_train.txt",sep="")
                      ,stringsAsFactors=FALSE
                      ,col.names="activityID")


## Rbind the test and train datasets
dfData <- rbind(dfXTest,dfXTrain)


## Read in and prepare the features which will be used as column names for dfData
dfFeatures <- read.table(paste(dir,"/features.txt",sep="")
                       ,colClasses=c("NULL","character")
                       ,stringsAsFactors=FALSE)


## Transpose features and convert to a vector
## featuresCol will be used as the column names for dfData
featuresCol <- as.vector(t(dfFeatures))


## Select the features that relate to the mean and std values
## These were taking to be denoted by -mean() and -std() in the feature.txt file
columnsWanted <- grepl("^.+(-mean\\(\\)|-std\\(\\))",featuresCol)


## Mainly interested in tidying the column names that pertain to the mean and std above
## Replace '-mean()', '-std()' and '-' with 'Mean', 'Std' and '' respectively
featuresCol <- gsub("-mean\\(\\)","Mean",featuresCol)
featuresCol <- gsub("-std\\(\\)","Std",featuresCol)
featuresCol <- gsub("-","",featuresCol)


## Expand on the abbreviations 'Acc', 'Gyro' and 'Mag'
featuresCol <- gsub("Acc","Accelerometer",featuresCol)
featuresCol <- gsub("Gyro","Gyroscope",featuresCol)
featuresCol <- gsub("Mag","Magnitude",featuresCol)
featuresCol <- gsub("BodyBody","Body",featuresCol)


## Rename columns in dfData to use the tidy labels now in featureCol
colnames(dfData) <- featuresCol


## Subset dfData with the columns we are interested in: (columnsWanted)
dfData <- dfData[columnsWanted]


## Add descriptive label to the activities in dfYTest and dfYTrain
## 1 WALKING
## 2 WALKING_UPSTAIRS
## 3 WALKING_DOWNSTAIRS
## 4 SITTING
## 5 STANDING
## 6 LAYING

dfYTest$activityDesc <- ifelse(dfYTest$activityID==1,"WALKING",
                       ifelse(dfYTest$activityID==2,"WALKING_UPSTAIRS",
                       ifelse(dfYTest$activityID==3,"WALKING_DOWNSTAIRS",
                       ifelse(dfYTest$activityID==4,"SITTING",
                       ifelse(dfYTest$activityID==5,"STANDING",
                       ifelse(dfYTest$activityID==6,"LAYING","NA"))))))

dfYTrain$activityDesc <- ifelse(dfYTrain$activityID==1,"WALKING",
                        ifelse(dfYTrain$activityID==2,"WALKING_UPSTAIRS",
                        ifelse(dfYTrain$activityID==3,"WALKING_DOWNSTAIRS",
                        ifelse(dfYTrain$activityID==4,"SITTING",
                        ifelse(dfYTrain$activityID==5,"STANDING",
                        ifelse(dfYTrain$activityID==6,"LAYING","NA"))))))


## Rbind the activity datasets (dfYTest and dfYTrain)
dfY <- rbind(dfYTest,dfYTrain)


## Add activity description column to dfData
dfData <- cbind(activityDesc = dfY[,"activityDesc"],dfData)


## Rbind the subject datasets (dfSubjectTest and dfSubjectTrain)
dfSubject <- rbind(dfSubjectTest,dfSubjectTrain)


## Add subject id column to dfData
dfData <- cbind(subjectID = dfSubject[, 1],dfData)


## Load the reshape2 package
library(reshape2)


## Subset the columnnames from dfData which will be used as the 
## measurement variable in melt below
vars <- colnames(dfData[3:68])


## melt dfData into tall and skinny dataset
dfMelt <- melt(dfData,id=c("subjectID","activityDesc"),measure.vars=vars,variable.name="variable",value.name="measurement")


## dcast dfData to get the average of each variable for each subjectID/activity combination
dfDCast <- dcast(dfMelt,subjectID + activityDesc ~ variable,mean,value.var="measurement")


tidyDataset <- dfDCast


## Tidy up the workspace
rm(dir, dfSubjectTest, dfXTest, dfYTest, dfSubjectTrain, dfXTrain, dfYTrain
   , dfData, dfFeatures, featuresCol, columnsWanted, dfY, dfSubject, vars
   , dfMelt, dfDCast)