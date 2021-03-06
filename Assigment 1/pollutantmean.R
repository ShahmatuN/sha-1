setwd("C:/Users/zhiltsov/Desktop/Coursera/sha-1/Assigment 1")
pollutantmean <- function(directory, pollutant = "sulfate", id = 1:332) 
{
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  if(grep("specdata", directory) == 1) 
  {
    directory <- ("./specdata/")
  }
  meanVector <- c()
  allFiles <- as.character( list.files(directory) )
  filePaths <- paste(directory, allFiles, sep="")
  for(i in id) {
    currentFile <- read.csv(filePaths[i], header=T, sep=",")
    
    naRemoved <- currentFile[!is.na(currentFile[, pollutant]), pollutant]
    meanVector <- c(meanVector, naRemoved)
  }
  result <- mean(meanVector)
  return(round(result, 3)) 
}
#tests
pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "nitrate", 23)
pollutantmean("specdata", "nitrate", 3)


