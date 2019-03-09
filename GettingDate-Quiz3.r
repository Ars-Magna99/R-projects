#1. 
download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",destfile = "/Users/Desktop/uscommu.csv")
acs <- read.csv("/Users/Desktop/uscommu.csv")
agricultureLogical <- ACS$ACR == 3 & ACS$AGS == 6
print(which(agricultureLogical),3)
#answer : 125 238 262

#2. 
#read image in
library(jpeg)
download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg', destfile = 'jeff.jpg")
jeff <- readJPEG("jeff.jpg",native = TRUE)

#calculate quantile 
print(quantile(jeff, probs = c(0.3,0.8)))

#answer:       30%       80% 
#          -15259150 -10575416 

#3
FGDP <- data.table::fread('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
                          , skip=4
                          , nrows = 190
                          , select = c(1, 2, 4, 5)
                          , col.names=c("CountryCode", "Rank", "Economy", "Total"))
                          
                          
download(url = "",destfile = "country.csv")
country <- read.csv("country.csv")
mergedDT <- merge(FGDP, FEDSTATS_Country, by = 'CountryCode')
arrange(mergedDT, desc(Rank))[13, Economy]
#answer: 189 matches, 13th country is St. Kitts and Nevis


#4
mean(filter(mergedDT,mergedDT$Income.Group =="High income: OECD")[,2])
#[1] 32.96667
mean(filter(mergedDT,mergedDT$Income.Group =="High income: nonOECD")[,2])
# 91.91304

#5
breaks <- quantile(mergedDT[, Rank], probs = seq(0, 1, 0.2), na.rm = TRUE)
mergedDT$quantileGDP <- cut(mergedDT[, Rank], breaks = breaks)
mergedDT[`Income Group` == "Lower middle income", .N, by = c("Income Group", "quantileGDP")]
#answer: 5
