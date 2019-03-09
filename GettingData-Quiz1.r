###
#Author: Ziyang Wang
#Date: 2019/2/28

#For Coursera: Getting and cleaning data- quiz 1
###

library(dplyr)

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url,destfile = "/Users/ziywangwang/Desktop/american.csv")

america <- read.csv("/Users/ziywangwang/Desktop/american.csv")

#q1
oneMhousing <- filter(america,VAL == 24)
dim(oneMhousing)

#q2
print(select(america,FES))

#q3
library(xlsx)
colIndex <- 7:15 
rowIndex <- 18:23
dat <- read.xlsx("NGAP.xlsx",sheetIndex=1, colIndex = colIndex, rowIndex = rowIndex) #select first sheet, specific col/rows.

sum(dat$Zip*dat$Ext,na.rm=T) 

#q4
xData <- getURL(fileXML) # This allows you to use https
doc <- xmlParse(xData)
rootNode <- xmlRoot(doc)
