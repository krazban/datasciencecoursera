# Author: Kourosh Razban
 ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used

        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
pollutantmean <- function(directory, pollutant, id = 1:332) {
       
		
            flist <- list.files(directory)
            flist <-file.path(directory,flist)
            seleclist<-lapply(flist[id],read.csv)
             
            total<-do.call(Map,c(c,seleclist))
            pollutantmean<-mean(unlist(total[pollutant]),na.rm=T)
            round(pollutantmean,3)                  
       
}
