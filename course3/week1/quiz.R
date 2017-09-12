#1
df = read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv")
length(df$VAL[!is.na(df$VAL) & df$VAL==24])
#3
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx', '/Users/vbhalala/Desktop/courseraDataScience/course3/week1/gov.xlsx', method = 'curl')
dat=read.xlsx(file="/Users/vbhalala/Desktop/courseraDataScience/course3/week1/gov.xlsx",sheetIndex = 1,colIndex = 7:15, rowIndex = 18:23)

#4
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml', '/Users/vbhalala/Desktop/courseraDataScience/course3/week1/restaurant.xml', method = 'curl')
df2<-xmlTreeParse(file = '/Users/vbhalala/Desktop/courseraDataScience/course3/week1/restaurant.xml',useInternal=TRUE )
rootNode<-xmlRoot(df2)
rootNode[[1]][[1]]
zipcode<-xpathSApply(rootNode,"//zipcode",xmlValue)

length(zipcode[zipcode==21231])


#5
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv ', '/Users/vbhalala/Desktop/courseraDataScience/course3/week1/community.csv', method = 'curl')
DT<-fread(input ='/Users/vbhalala/Desktop/courseraDataScience/course3/week1/community.csv', sep=',' )
system.time(DT[,mean(pwgtp15),by=SEX])

 