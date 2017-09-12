pollutantmean<-function(directory,pollutant,id=1:332){
  data = numeric()

  for(i in id){
    #paste is for string concatenation in R
    #formatC foramt number to 3 digit
    readFile<-read.csv(paste(directory,"/",formatC(i,width = 3, flag="0"),".csv",sep = ""))
    data<-c(data,readFile[[pollutant]])
  }
  return(mean(data,na.rm = TRUE))
}
print(pollutantmean("specdata", "nitrate", 70:72))



complete <- function(directory, id = 1:332) {
  f <- function(i) {
    data = read.csv(paste(directory, "/", formatC(i, width = 3, flag = "0"), ".csv", sep = ""))
    sum(complete.cases(data))
  }
  #sapply applies function f and returns vector rather than list
  nobs = sapply(id, f)
  return(data.frame(id, nobs))
}
print(complete("specdata", c(2, 4, 8, 10, 12)))



corr <- function(directory, threshold = 0) {

  df = complete(directory)
  ids = df[df["nobs"] > threshold, ]$id
  corrr = numeric()
  for (i in ids) {
    
    newRead = read.csv(paste(directory, "/", formatC(i, width = 3, flag = "0"), 
                             ".csv", sep = ""))
    dff = newRead[complete.cases(newRead), ]
    corrr = c(corrr, cor(dff$sulfate, dff$nitrate))
  }
  return(corrr)
}
print(head(cr))