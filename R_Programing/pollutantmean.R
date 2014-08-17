pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  print("Agruments are ")
  print("Directory: "  )
  print(directory)
  print("Pollutant:"  )
  print(pollutant)
  
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  # open data files for each monitors
  # Holds all the rows for all indicators.
  pdata <- vector('numeric')
  
  
  # create a loop to go over all the indicators to read
  for(i in id){
    ## create file path for each indicator
    fileName <- formatC(i, width = 3, flag = '0')
    fileName <- paste(fileName, ".csv", sep='')
    ftoread <- paste(directory, fileName, sep = "/")
    #print("File:"  )
    #print(ftoread)
    #Read data from csv
    fdata <- read.csv(ftoread)
    #print("Data")
    # print(fdata)
    
    #holds data for a single indicator
    pollutantData <- fdata[[pollutant]]
    #print(pollutantData)
    #print(is.na(pollutantData))
    
    #holds non-na data
    pollutantData <- pollutantData[!is.na(pollutantData)]
    
    #print(pollutantData)
    #Append to a single vector
    pdata <- c(pdata, pollutantData)
    #print(pdata)
  }

  mval <- mean(pdata)
  print("Mean value is ")
  mval <- round(mval, 3)
  print(mval)
}



directory <- "/Users/kagarwal/Documents/Coursera/R_Programing/specdata"
pl <- 'nitrate'
pl1 <- 'sulfate'
pollutantmean(directory, pl1, c(1:10))

