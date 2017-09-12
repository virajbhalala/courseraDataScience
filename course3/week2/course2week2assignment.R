# ucscDb<-dbConnect(MySQL(),user="genome",host="genome-mysql.cse.ucsc.edu")
# 
# result<-dbGetQuery(ucscDb,"show databases;");dbDisconnect(ucscDb);
# 
# source("http://bioconductor.org/biocLite.R")
# biocLite("rhdf5")

#1
oauth_endpoints("github")
myapp<-oauth_app("github",  key = "56b637a5baffac62cad9",
                 secret = "8e107541ae1791259e9987d544ca568633da2ebf")
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/rate_limit", gtoken)
