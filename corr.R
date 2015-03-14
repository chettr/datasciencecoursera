corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  
  ## Return a numeric vector of correlations
  
  ## Save current wd and set to directory
  pwd <- getwd()
  setwd(directory)
  ## get list of files in directory
  file_list <- list.files()
  corvector <- numeric()
  
  ## loop thru files in directory, appending cor to vector if > threshold
  for (file in file_list){
    d <- na.omit(read.csv(file, header=TRUE))
    if (nrow(d) > threshold) {
      corcalc <- cor(d$sulfate, d$nitrate)
      corvector <- append(corvector, corcalc)
    }
    rm(d) 
  } 

  ## reset the wd
  setwd(pwd)

  corvector
}