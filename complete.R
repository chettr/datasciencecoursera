complete <- function(directory, id = 1:332) {
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
  
  ## Save current wd and set to directory
  pwd <- getwd()
  setwd(directory)
  
  ## get list of files in directory
  file_list <- list.files()

  ## loop thru files based on id range and count complete cases
  nobs <- vector(mode = "integer", length = length(id))
  x <- 1
  for (i in id){
    file <- file_list[i]
    # count nrows with complete cases
    ccases <- complete.cases(read.csv(file))
    nobs[x] <- length(subset(ccases, ccases==TRUE))
    x <- x + 1
  }
  
  ## print the mean of the pollutant
  dataset <- data.frame(id=id, nobs=nobs)
  
  ## reset the wd
  setwd(pwd)
  
  dataset
}