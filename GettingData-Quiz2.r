
#author : Ziyang Wang
#Date : 2019-3-4
#From Coursera


#Q1


#Q2
library(sqldf)
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(url,destfile = "/Users/ziyangwang/Desktop/asc.csv")
asc <- read.csv("/Users/ziyangwang/Desktop/asc.csv")
sqldf("SELECT pwgtp1 FROM acs WHERE AGEP < 50")#pass in the SQL query code

#Q3
sqldf("select distinct AGEP from acs")

#Q4
url <- "http://biostat.jhsph.edu/~jleek/contact.html"
htmlcode <- readLines(url)
ncharframe <- nchar(htmlcode)
ncharframe[c(10,20,30,100)] 
#answer：[1] 45 31  7 25

#Q5
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
widths <- c(1, 9, 5, 4, 1, 3, 5, 4, 1, 3, 5, 4, 1, 3, 5, 4, 1, 3)
fixed <- read.fwf(url, widths, header = FALSE, skip = 4)
sum(fixed$V8)
#answer：32426.7
