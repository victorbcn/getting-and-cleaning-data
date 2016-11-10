## 
## Coursera: Getting and Cleaning Data Course Project
##



## This function sets the working environment up by downloading the required files, installing the
## the necessary libraries and getting in the correct working directory.

setup_project<-function() {
   dataurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
   destination <- "data.zip"
   if (!file.exists(destination)) {
        download.file(dataurl, destination, method = "curl")
   }
 
   unzip(destination, overwrite = TRUE)
}


## 1. Training and tests sets merging

merging <- function() {
    
}

## 2. Extraction of measurements on the mean and sd for each measurement

extract <- function() {
    
}


## 3. Activity Naming


## 4. Label data with descriptive variable names


## 5. Create a second independent tidy data set with the average of each variable for each activity and each subject