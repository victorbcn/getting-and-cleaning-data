## 
## Coursera: Getting and Cleaning Data Course Project
##



## This function sets the working environment up by downloading the required
## files installing the the necessary libraries and getting in the correct
## working directory.

dataLocation <- "./UCI HAR Dataset"
#XData <- NULL

setup_project<-function() {
    
   dataurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
   destination <- "data.zip"
   
   if (!file.exists(destination)) {
        download.file(dataurl, destination, method = "curl")
   }
 
   if(!dir.exists(dataLocation)) {
       unzip(destination, overwrite = TRUE)
   }    
   
}


## 1. Merges the training and the test sets to create one data set.

merge_data <- function() {
    
    if(!dir.exists(dataLocation)) {
        print ("Error: Data Directory not found")
        stop()
    }
    
    ## Process Measurement Observations
    XTrainData <- read.table(paste(dataLocation, "train", "X_train.txt", sep="/"))
    XTestData  <- read.table(paste(dataLocation, "test", "X_test.txt", sep="/")) 
    XData      <- rbind(XTrainData, XTestData)
    featNames  <- read.table(paste(dataLocation, "features.txt", sep="/"))
    names(XData) <- featNames[,2]
    
    ## Select only mean and std deviation measurements
    columns   <- grep("mean()|std()", features[,2])
    XData     <- XData[,columns]
    
    ## Process Activities
    YTrainData <- read.table(paste(dataLocation, "train", "y_train.txt", sep="/"))
    YTestData  <- read.table(paste(dataLocation, "test", "y_test.txt", sep="/"))
    YData      <- rbind(YTrainData, YTestData)[,1]
    
    ## Rename Activities
    activities <-
        c("walking", "walking upstairs", "walking downstairs", "sitting", "standing", "laying")
    YData     <- activities[YData]
    names(YData) <- "activities"
    
    ## Process Subjects
    SubTrainData <- read.table(paste(dataLocation, "train", "subject_train.txt", sep="/"))
    SubTestData  <- read.table(paste(dataLocation, "test", "subject_test.txt", sep="/"))
    SubData      <- rbind(SubTrainData, SubTestData)
    names(SubData) <- "subject"
    
    ## Merge all data together
    XData <- cbind(YData, XData)
    XData <- cbind(SubData, XData)
    
    ## Rename the variable names
    
    #names(XData) <- gsub("^t", "Time", names(XData))
    #names(XData) <- gsub("^f", "Frequency", names(XData))
    
    
    
}

## 2. Extracts only the measurements on the mean and standard deviation for each
## measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 

rename <- function(Data) {
    
    newNames <- gsub("^t", "time", names(Data))
    newNames <- gsub("^f", "frequency", newNames)
    newNames
}








## 5. From the data set in step 4, creates a second, independent tidy data set
##    with the average of each variable for each activity and each subject.