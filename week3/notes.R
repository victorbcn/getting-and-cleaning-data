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
    
}

