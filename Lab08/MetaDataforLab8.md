**Meta data for Lab 8**
This file provides the necessary context for Lab08 in EBIO 4420.
Lab 8 code was taken from the previous Lab04, and centered around a Lotka Volterra model of logistic growth. This is used in many models of population abundance over time, and looks something like this: 
`n[t] = n[t-1] + ( r * n[t-1] * (K - n[t-1])/K )`

* `n[t]` is the abundance of the population at time `t`
* `n[t – 1]` is the abundance of the population in the previous time step
* `r` is the intrinsic growth rate of the population
* `K` is the environmental carrying capacity for the population


This equation was then looped to go through however many `t` iterations. Two vectors were made, one called "time" that stores the time steps (1 to 12), and one called "abundance" that stores the data on population abundances predicted from the discrete-time logistic equation.
For Lab08 this model was made into an equation that could receive all of the previous variables and return either a plot or a data frame with generations and abundance. This code looked like this:
```
logisticgrowthmodel <- function(r,K,totalTimeSteps,n, Plot = F){
#added an option for the function to include the plot or the dataframe
initAbundance <- n
n <- rep( initAbundance, totalTimeSteps )
TIME <- 1:totalTimeSteps
#made two storing vectors
#if the user wants a plot this if function takes over
if(Plot = T){
for (t in 2:totalTimeSteps) {
n[t] <- n[t-1] + ( r * n[t-1] * (K - n[t-1])/K )
print(TIME[t])
print(n[t])
}
ABUN <- n
#A plot of time and abundance is then printed out
plot(TIME, ABUN,  xlab = "Time", ylab = "Abundance")
}
#if the user wants a dataframe and not a plot, this if function takes over
if(Plot = F){
for (t in 2:totalTimeSteps) {
n[t] <- n[t-1] + ( r * n[t-1] * (K - n[t-1])/K )
(TIME[t])
(n[t])
}
ABUN <- n
#a dataframe of time and abundance is created
print(data.frame(TIME, ABUN,))
}
}
#calling the function
#this is an example of random variables being entered
logisticgrowthmodel(0.5,1000000,50,2500)
x <- logisticgrowthmodel(0.5,1000000,50,2500)
names(x)[1] <- "Generations"
names(x)[2] <- "Abundance"
#renaming the columns 
#turning the dataframe into a .csv file
write.csv(x, "DatafromGrowthModel.csv")
```
If you would like to see the origin of this code click [here](https://github.com/flaxmans/CompBio_on_git/blob/master/Labs/Lab04/Lab04_ForLoops.md)
