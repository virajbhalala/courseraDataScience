
best <- function(state, outcome) {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## Return hospital name in that state with lowest 30-day death
  ## rate

  df <- read.csv("./course2/week4/rprog%2Fdata%2FProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")

  states <- unique(df$State)
  print(states)
  outcomes <- c("heart attack", "heart failure", "pneumonia")
  
  if (!(state %in% states)) {
    stop("invalid state")
  }
  
  if (!(outcome %in% outcomes)) {
    stop("invalid outcome")
  }
  
  df2 <- df[df$State == state, ]
  df2[, c(11, 17, 23)] <- sapply(df2[, c(11, 17, 23)], as.numeric)
  df2 <- df2[order(df2[, 2]), ]
  
  if (outcome == "heart attack") {
    best <- df2[which.min(df2[, 11]), "Hospital.Name"]
  }
  else if (outcome == "heart failure") {
    best <- df2[which.min(df2[, 17]), "Hospital.Name"]
  }
  else {
    best <- df2[which.min(df2[, 23]), "Hospital.Name"]
  }
  
  rybest
}

rankhospital <- function(state, outcome, num = "best") {
  library(plyr)
  df <- read.csv("./course2/week4/rprog%2Fdata%2FProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character") 
  df <- df[, !(colnames(df) %in% c("Provider.Number", "Address.1", "Address.2", "Address.3", 
                                   "City", "ZIP.Code", "County.Name", "Phone.Number"))]
  
  df <- df[, c("State", "Hospital.Name", 
               "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", 
               "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia", 
               "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure")]
  df[df == "Not Available"] <- NA
  df <- na.omit(df)
  
  for (i in 3:5) {
    df[,i] <- as.numeric(df[,i])
  }
  
  if( !outcome %in% c("pneumonia", "heart failure", "heart attack") ) {
    stop("invalid outcome")
  }
  
  if( !state %in% unique(df$State) ) {
    stop("invalid state")
  }
  
  #'   The  num  argument can take values \best", \worst",  or an integer indicating the ranking
  #'   (smaller numbers are better).  If the number given by
  #'   num is larger than the number of hospitals in that
  #'   state, then the function should return
  #'   NA. Hospitals that do not have data on a particular outcome should
  #'   be excluded from the set of hospitals when deciding the rankings.
  
  if(outcome == "heart attack") {
    
    df.ha <- df[, c("State", "Hospital.Name", 
                    "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack")]
    df.ha <- df.ha[df.ha$State == state, ]
    df.ha <- plyr::arrange(df.ha, df.ha$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, df.ha$Hospital.Name)
    
    if (num == "worst") {
      df.ha <- df.ha[which.max(df.ha$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack), ][ ,2]
    } else if (num == "best") {
      df.ha <- df.ha[which.min(df.ha$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack), ][ ,2]
    } else {
      df.ha <- df.ha[num, 2]
    }
    
    return(df.ha)
    
  } else if(outcome == "heart failure") {
    
    df.ha <- df[, c("State", "Hospital.Name", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure")]
    df.ha <- df.ha[df.ha$State == state, ]
    df.ha <- plyr::arrange(df.ha, df.ha$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, df.ha$Hospital.Name)
    
    if(num == "worst"){
      df.ha <- df.ha[which.max(df.ha$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure), ][ ,2]
    } else if (num == "best") {
      df.ha <- df.ha[which.min(df.ha$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure), ][ ,2]
    } else {
      df.ha <- df.ha[num, 2]
    }
    
    return(df.ha)
    
  } else { # if(outcome == "pneumonia")
    df.ha <- df[, c("State", "Hospital.Name", 
                    "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")]
    df.ha <- df.ha[df.ha$State == state, ]
    df.ha <- plyr::arrange(df.ha,df.ha$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia, df.ha$Hospital.Name)
    
    if(num == "worst") {
      df.ha <- df.ha[which.max(df.ha$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia), ][ ,2]
    } else if (num == "best") {
      df.ha <- df.ha[which.min(df.ha$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia), ][ ,2]
    } else {
      df.ha <- df.ha[num, 2]
    }
    return(df.ha)
    
  }
}
