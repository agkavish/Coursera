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
  
  #print("Agruments are ")
 # print("Directory: "  )
  #print(directory)
  #print("ID:"  )
  #print(id)
  
  #for(i in id){
    ## create file path for each indicator
   # fileName <- formatC(i, width = 3, flag = '0')
    #fileName <- paste(fileName, ".csv", sep='')
    #ftoread <- paste(directory, fileName, sep = "/")
    #print("File:"  )
    #print(ftoread)
    #Read data from csv
    #fdata <- read.csv(ftoread)
   
   #ncs <- sum(complete.cases(fdata))
    #print("No of complete cases")
   #print(ncs)
  
   
   
   #print("NROW")
   #3print(sum(complete.cases(fdata)))
    
  #}
  
  csvfiles <- sprintf("%s/%03d.csv", directory, id)
  #print(csvfiles)
  nrows <- sapply( csvfiles, function(f) sum(complete.cases(read.csv(f))))
  #print("Answer is ")
  #print(nrows)
  #print(class(nrows))
  ans <- data.frame(id = sprintf("%03d", id), nobs = sapply( csvfiles, function(f) sum(complete.cases(read.csv(f)))))
  #print(class(ans))
  #print(ans)
  
  
}

#directory <- "/Users/kagarwal/Documents/Coursera/R_Programing/specdata"
#complete(directory, c(30:25))