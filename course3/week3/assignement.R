file1<-read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv")
which(file1$ACR==3 &file1$AGS==6)

#readjpeg not working
#pic<-readJPEG('https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg', native=TRUE)


gdp<-read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv")
edu<-read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv")