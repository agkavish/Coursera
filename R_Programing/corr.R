corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  #fileName <- list.files(path = directory, pattern = "*.csv", full.names = TRUE)
  #print(fileName)
  
  cCounts <- complete(directory)
 # print("In corr.r")
 eligibleDataIndicators <- subset(cCounts,nobs > threshold)
  ids <- rownames(eligibleDataIndicators)
  crd <- numeric(0)
# print(crd)
  crd <- sapply(ids, function(f) {
            d <- read.csv(f)
            # cs <- complete.cases(d) 
            #csd <- d[cs,]
            cr <- cor(d['sulfate'], d['nitrate'], "complete.obs" )
            #licr <- round(cr, 5)
                                      } )
#print("printing CRD")  
#print(crd)
## Below is the hack to get right answer in submission
#if(length(crd) == 0){
  #crd <- cor(c(), c())
  #print(rownames(crd))
  #crd <- crd[complete.cases(crd),]
  #df[setdiff(rownames(df),rownames(a)),]
  
#}
 
}


directory <- "/Users/kagarwal/Documents/Coursera/R_Programing/specdata"
 cr <- corr(directory, 5000)
print(head(cr))
print('Summary')
print(summary(cr))
print('Length')
print(length(cr))