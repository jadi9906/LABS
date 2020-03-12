##########################################################################
#Lab 08: Documentation and Metadata
##########################################################################
#Meta Data for this function is in markdown file: MetaDataforLab8.md


logisticgrowthmodel <- function(r,K,totalTimeSteps,n, Plot = F){
  initAbundance <- n
  n <- rep( initAbundance, totalTimeSteps )
  TIME <- 1:totalTimeSteps
  
  if(Plot = T){
    for (t in 2:totalTimeSteps) {
      n[t] <- n[t-1] + ( r * n[t-1] * (K - n[t-1])/K )
      print(TIME[t])
      print(n[t])
    }
    ABUN <- n
    plot(TIME, ABUN,  xlab = "Time", ylab = "Abundance")
  }
  
  if(Plot = F){
  for (t in 2:totalTimeSteps) {
    n[t] <- n[t-1] + ( r * n[t-1] * (K - n[t-1])/K )
    (TIME[t])
    (n[t])
  }
  ABUN <- n
  print(data.frame(TIME, ABUN,))
  }
}

#calling the function 
logisticgrowthmodel(0.5,1000000,50,2500)

x <- logisticgrowthmodel(0.5,1000000,50,2500)
names(x)[1] <- "Generations"
names(x)[2] <- "Abundance"

write.csv(x, "DatafromGrowthModel.csv")

##########################################################################



