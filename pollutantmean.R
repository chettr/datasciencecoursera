pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  ## Save current wd and set to directory
  pwd <- getwd()
  setwd(directory)
  ## get list of files in directory
  file_list <- list.files()
  
  ## loop thru files based on id range and append data
  for (i in id){
    file <- file_list[i]
    # if the merged dataset doesn't exist, create it
    if (!exists("dataset")){
      dataset <- read.csv(file, header=TRUE)
    } else {
      temp_dataset <-read.csv(file, header=TRUE)
      dataset<-rbind(dataset, temp_dataset)
      rm(temp_dataset)
    }
  }
  ## print the mean of the pollutant
  print(mean(dataset[[pollutant]],na.rm = TRUE),digits=4)
  ## reset the wd
  setwd(pwd)
}

