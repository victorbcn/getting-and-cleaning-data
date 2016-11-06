## Coursera: Getting and Cleaning Data
## Week 1: Quiz - Question 1

question1 <-function() {
    working_dir<-"~/Coursera/getting-and-cleaning-data/"
    data_dir<-"quiz1-data"
    # Setup
    setwd(working_dir)
    if (!dir.exists(data_dir)) {
        dir.create(data_dir)
    }
    fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
    destFile<-paste(data_dir, "question1.csv", sep="/")
    if(!file.exists(destFile)) {
        ## file.remove(destFile)
        download.file(fileURL, destfile = destFile, method="curl")
        dateDownloaded<-date()
        dateDownloaded
    }
    list.files("./quiz1-data")
    # Check how many properties are worth $1M or more
    # The code book is located at: https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf
    question1Data<-read.table(destFile, sep=",", header = TRUE)
    # Other parameters to read: quote, na.strings, nrows, skip
    head(question1Data)
    # VAL Property Value, count how many = 24
    x<-table(question1Data$VAL)
    x
    # or...
    v<-nrow(subset(question1Data, VAL==24))
    v
}

question2 <-function() {
    working_dir<-"~/Coursera/getting-and-cleaning-data/"
    data_dir<-"quiz1-data"
    # Setup
    setwd(working_dir)
    if (!dir.exists(data_dir)) {
        dir.create(data_dir)
    }
    fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
    destFile<-paste(data_dir, "question1.csv", sep="/")
    if(!file.exists(destFile)) {
        ## file.remove(destFile)
        download.file(fileURL, destfile = destFile, method="curl")
        dateDownloaded<-date()
        dateDownloaded
    }
    list.files("./quiz1-data")
    # Check how many properties are worth $1M or more
    # The code book is located at: https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf
    question1Data<-read.table(destFile, sep=",", header = TRUE)
    # Other parameters to read: quote, na.strings, nrows, skip
    question1Data[["FES"]]
    
    # Answer Numeric Values in tidy data can not represet categories INCORRECT
    # Answer Tidy Data has no missing values INCORRECT == Tidy data has one observation per row.
    # Answer Tidy data has one variable per column. OK!
}

question3 <-function() {
    working_dir<-"~/Coursera/getting-and-cleaning-data/"
    data_dir<-"quiz1-data"
    # Setup
    setwd(working_dir)
    if (!dir.exists(data_dir)) {
        dir.create(data_dir)
    }
    fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
    destFile<-paste(data_dir, "question3.xlsx", sep="/")
    if(!file.exists(destFile)) {
        ## file.remove(destFile)
        download.file(fileURL, destfile = destFile, method="curl")
        dateDownloaded<-date()
        dateDownloaded
    }
    list.files("./quiz1-data")
    # Read rows 18-23 and Colums 7-15, assigning the result to dat
    dat<-question3Data<-read.xlsx(destFile, sheet=1, rows = 18:23, cols = 7:15)
    dat
    result<-sum(dat$Zip*dat$Ext,na.rm=T)
    result
}

question4 <-function() {
    working_dir<-"~/Coursera/getting-and-cleaning-data/"
    data_dir<-"quiz1-data"
    # Setup
    setwd(working_dir)
    if (!dir.exists(data_dir)) {
        dir.create(data_dir)
    }
    fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
    destFile<-paste(data_dir, "question4.xml", sep="/")
    if(!file.exists(destFile)) {
        ## file.remove(destFile)
        download.file(fileURL, destfile = destFile, method="curl")
        dateDownloaded<-date()
        dateDownloaded
    }
    list.files("./quiz1-data")
    # How many restaurants have zipcode 21231
    doc<-xmlTreeParse(destFile,useInternal=TRUE)
    rootNode<-xmlRoot(doc)
    xmlName(rootNode)
    names(rootNode)
    rows<-rootNode[[1]]
    postCodes<-xpathSApply(rows,"//zipcode", xmlValue)
    # v<-nrow(subset(postCodes, VAL==24))
    class(postCodes)
    postCodes[c("21231")]
    a<-table(postCodes)
    a[["21231"]]
    length(postCodes[postCodes=="21231"])
}

question5 <-function() {
    working_dir<-"~/Coursera/getting-and-cleaning-data/"
    data_dir<-"quiz1-data"
    # Setup
    setwd(working_dir)
    if (!dir.exists(data_dir)) {
        dir.create(data_dir)
    }
    fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
    destFile<-paste(data_dir, "question5.csv", sep="/")
    if(!file.exists(destFile)) {
        ## file.remove(destFile)
        download.file(fileURL, destfile = destFile, method="curl")
        dateDownloaded<-date()
        dateDownloaded
    }
    list.files("./quiz1-data")
    DT<-fread(destFile)
   
    # MY ANSWER system.time(for(i in 1:10000) {sapply(split(DT$pwgtp15,DT$SEX),mean)}) INCORRECT
    # tapply(DT$pwgtp15,DT$SEX,mean) incorrect
    # DT[,mean(pwgtp15),by=SEX]
    # mean(DT$pwgtp15,by=DT$SEX) Does not provide right answer
    # mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15) average value of variable not classfied
    # rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2] gives error
    
    n<-1000
    replicate(n, )
    
}

