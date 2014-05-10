## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'id' is an integer vector indicating the monitor ID numbers
## to be used

## Return a data frame of the form:
## id nobs
## 1  117
## 2  1041
## ...
## where 'id' is the monitor ID number and 'nobs' is the
## number of complete cases
complete <- function( directory, id = 1:332 ) {
  #directory="specdata"
  #id=1:332
  DF <- data.frame(id =id, nobs = rep(0,length(id)) )
  md <-matrix(nrow=length(id),ncol=2)
  colnames(md)<-c("id","nobs")
  md[,"id"]<-id
  flist <- list.files( directory )
  
  flist <- file.path( directory, flist )
  for(i in 1:length(id)){
    selected <- read.csv(flist[id[i]]) 
    okSelected <-nrow(selected[complete.cases(selected),])
    md[i,"nobs"]<-okSelected
  }
  return(as.data.frame(md))
  
  
  	                         
}                 
