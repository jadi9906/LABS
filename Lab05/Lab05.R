#Lab05
#Feb 14, 2020-Feb 26
#Jacob Di Biase
#1:
#write an if-else statement that checks if the value is larger than 5. 
#Your code should print a message about whether the value is larger or smaller than 5.
#
x <- 10
y <- 5
if(x > y){
  print("x is larger than y")
}

#2a:
#Using a for() loop, write code that checks each value in the imported data and changes 
#every negative value to be NA
#
csv <- read_csv("ExampleData.csv")
head(csv)
dim(csv)
myvec <- csv[[1]]
#turn raw data into usable vector
print(myvec)


for (i in 1:length(myvec)) {
  if(myvec[i] < 0 ) {
   myvec[i] <-  NA 
  }
}  
print(myvec)

#2b:Using vectorized code (no loop) that makes use of "logical" indexing, 
#change all those NA values with NaN
myvec[is.na(myvec)]<- NaN
print(myvec)

#2c:Using a which() statement and integer indexing (again, no loop), 
#change all those NaN values with a zero. 
#myvec[is.nan(myvec)]  <-  0
myvec[which(is.nan(myvec))] <- 0
print(myvec)

#2d: Use code to determine how many of the values from the imported data fall 
#in the range between 50 and 100 
count <- 0
#make a counter inside the loop
for (i in 1:length(myvec)) {
  if( 50 <= myvec[i] & myvec[i] <= 100 ) 
    count <- count + 1
}  
count
print(myvec)
#this is an other way to do this
sum(50 <= myvec & myvec <= 100)

#2e:create a new vector of data that has all the values from the imported data that 
#fall in the range between 50 and 100.
#preallocate
FiftyToOneHundred <- rep(NA, length(myvec))
for (i in 1:length(myvec)) {
 if( 50 <= myvec[i] & myvec[i] <= 100 ) {
FiftyToOneHundred[i]  <- myvec[i]
 }
}  
print(FiftyToOneHundred)
keepThese <- !is.na(FiftyToOneHundred)
print(keepThese)
FiftyToOneHundred <- FiftyToOneHundred[keepThese]
print(FiftyToOneHundred)
#2f:save your vector to a file named "FiftyToOneHundred.csv"
write.csv(x = FiftyToOneHundred, file = "FiftyToOneHundred.csv")
read_csv("FiftyToOneHundred.csv")

#3:Import the data on CO2 emissions from last week's lab ("CO2_data_cut_paste.csv" from Lab04)
carbon <- read_csv("CO2_data_cut_paste.csv")
carbon
#3A:What was the first year for which data on "Gas" emissions were non-zero?
x<- c(which(carbon$Gas > 0))
x[1]
carbon$Year[x[1]]

#3B:During which years were "Total" emissions between 200 and 300 million metric tons of carbon?
y <- c(which(carbon$Total> 200 & carbon$Total<300))
y
carbon$Year[y]


#Part II. Loops + conditionals + biology
totalGenerations <- 1000
initPrey <- 100 	# initial prey abundance at time t = 1
initPred <- 10		# initial predator abundance at time t = 1
a <- 0.01 		# attack rate
r <- 0.2 		# growth rate of prey
m <- 0.05 		# mortality rate of predators
k <- 0.1 		# conversion constant of prey into predators
totaltime <- c(2:totalGenerations)
n <- 100
p <- 10
#Second, create a time vector, and make two additional vectors to store results,
#one for the values of n over time, and the other to store values of p. 
#n becomes prey vector
#p becomes pred vector
initPreyAbundance <- n 
n <- rep(initPreyAbundance, totalGenerations) 
initPredAbundance <- p
p <- rep(initPredAbundance, totalGenerations)
#Third, write a loop that implements the calculations.
for (t in totaltime) {
  n[t] <- n[t-1] + (r * n[t-1]) - (a * n[t-1] * p[t-1])
  p[t] <- p[t-1] + (k * a * n[t-1] * p[t-1]) - (m * p[t-1])
  #add some if statements to your code to check for negative numbers each generation.
  #turns positions into zeros
  if(n[t] < 0){
    n[t] <- 0
  }
  if(p[t] < 0){
    p[t] <- 0
  }
}
print(n)
print(p)
#make a plot of the abundances of prey and predators over time
totaltime <- c(1:totalGenerations)
plot(totaltime,n)
lines(totaltime, p)

#create a matrix of your results named "myResults" in which the first column is named "TimeStep", the second column is named "PreyAbundance", and the third column is named "PredatorAbundance".
TimeStep <- totaltime
PreyAbundance <- n
PredatorAbundance <- p
myResults <- data.frame(TimeStep,PreyAbundance,PredatorAbundance)
myResults
write.csv(x = myResults, file = "PredPreyResults.csv")
#