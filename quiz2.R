## Coursera: Getting and Cleaning Data


## Week 2: Quiz - Question 1
## Register an application with the Github API
## Access github api to get information regarding the instructor repo:
## https://api.github.com/users/jtleek/repos

question1<-function() {
    # 2013-11-07T13:25:07Z
    repo<-"https://api.github.com/users/jtleek/repos"
    
    # load libraries
    library(httr)
    oauth_endpoints("github")
    
    # Configure the app
    myapp <- oauth_app("github",
                       key = "8cca772da6ac0525cff2",
                       secret = "ba014ac0a264ac6163dd9e0cab7afe2c47591253")
    
    # Obtain the token
    github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
    
    # Test API
    gtoken <- config(token = github_token)
    req <- GET(repo, gtoken)
    stop_for_status(req)
    data<-content(req)
    # lapply(data, '[[', 2)
    data[[10]]$created_at
    
    # Or...
    # req <- with_config(gtoken, GET("https://api.github.com/rate_limit"))
    # stop_for_status(req)
    # content(req)
    
}


## Question 2: sqldf package
question2<-function() {
    # sqldf("select pwgtp1 from acs where AGEP < 50")
    working_dir<-"~/Coursera/getting-and-cleaning-data/"
    data_dir<-"quiz2-data"
    setwd(working_dir)
    if (!dir.exists(data_dir)) {
        dir.create(data_dir)
    }
    fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
    destFile <- paste(data_dir, "question2.csv", sep="/")
    if(!file.exists(destFile)) {
        ## file.remove(destFile)
        download.file(fileURL, destfile = destFile, method="curl")
        dateDownloaded<-date()
        dateDownloaded
    }
    list.files(data_dir)
    acs <- read.table(destFile, sep=",", header = TRUE)
    sqldf("select pwgtp1 from acs where AGEP < 50")
}

question3<-function() {
    # sqldf("select AGEP where unique from acs") incorrect
    working_dir<-"~/Coursera/getting-and-cleaning-data/"
    data_dir<-"quiz2-data"
    setwd(working_dir)
    if (!dir.exists(data_dir)) {
        dir.create(data_dir)
    }
    fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
    destFile <- paste(data_dir, "question2.csv", sep="/")
    if(!file.exists(destFile)) {
        ## file.remove(destFile)
        download.file(fileURL, destfile = destFile, method="curl")
        dateDownloaded<-date()
        dateDownloaded
    }
    list.files(data_dir)
    acs <- read.table(destFile, sep=",", header = TRUE)
    
    sqldf("select distinct AGEP from acs")
}

# How many characters are in the 10th, 20th, 30th and 100th lines in:
# http://biostat.jhsph.edu/~jleek/contact.html
# use nchar()

question4<-function() {
    #45 0 2 2 incorrect
    
    address <- "http://biostat.jhsph.edu/~jleek/contact.html"
    con = url(address)
    htmlCode = readLines(con)
    close(con)
    print(nchar(htmlCode[[10]]))
    print(nchar(htmlCode[[20]]))
    print(nchar(htmlCode[[30]]))
    print(nchar(htmlCode[[100]]))
}

# Read this data set into R and report the sum of the numbers in the fourth of the nine columns.
# https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for
question5<-function() {
    working_dir<-"~/Coursera/getting-and-cleaning-data/"
    data_dir<-"quiz2-data"
    setwd(working_dir)
    if (!dir.exists(data_dir)) {
        dir.create(data_dir)
    }
    fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
    destFile <- paste(data_dir, "question5.for", sep="/")
    if(!file.exists(destFile)) {
        ## file.remove(destFile)
        download.file(fileURL, destfile = destFile, method="curl")
        dateDownloaded<-date()
        dateDownloaded
    }
    list.files(data_dir)
    widths <- c(12, 7, 4, 9, 4, 9, 4, 9, 4)
    data<-read.fwf(destFile, widths = widths, header = FALSE, skip = 4)
    sum(data[[4]])
    
    #read.fwf
    #28893.3 incorrect
}