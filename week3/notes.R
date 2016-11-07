## Notes for Week 3 of Getting and Cleaning Data

Week3.Setup <- function() {
    
    # Set up the course
    working_dir<-"~/Coursera/getting-and-cleaning-data/week3"
    setwd(working_dir)
}

## Subsetting and Sorting

Week3.Notes1 <- function() {
    
}

## Summarizing Data

Week3.Notes2 <- function() {
    
    # Let's download some example files from Baltime. A collection
    # of the city's restaurant data
    
    if(!file.exists("./data")) {
        dir.create("./data")
    }
    fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
    download.file(fileUrl, destfile="./data/restaurants.csv", method="curl")
    restData <- read.csv("./data/restaurants.csv")
    
    # We can take a look at the head and/or the tail of the data
    print(head(restData, n=3))
    print(tail(restData, n=3))
    
    # We can use also the following commands to get an idea of the data
    summary(restData)
    str(restData)
    
    # We can also get specific quantiles
    quantile(restData$councilDistrict, na.rm=TRUE)
    quantile(restData$councilDistrict, na.rm=TRUE, probs = c(0.5, 0.75, 0.9))
    
    # We can also use the command table to get info
    table(restData$zipCode, useNA="ifany")
    # The table command supports two dimensions
    table(restData$councilDistrict, restData$zipCode)
    
    # We can also check and quantify the ammount of missin values
    sum(is.na(restData$councilDistrict))
    any(is.na(restData$councilDistrict))
    
    # We can also evaulate if all data satisfies a condition
    all(restData$zipCode > 0)
    
    # It's also possible to do the same operations by columns
    colSums(is.na(restData))
    all(colSums(is.na(restData))==0)
    
    # I can also look for specific values
    table(restData$zipCode %in% c("21212"))
    table(restData$zipCode %in% c("21212", "21213"))
    
    # I can even filter the data for specific values
    restData[restData$zipCode %in% c("21212", "21213"), ]
    
}

