#Lab04 For Loops Feb 7 2020
#Jacob Di Biase
#Part 1: Practice writing "For Loops"

#1:Write a “for loop” that prints the word “hi” to the console 10 times
for (i in seq(1,10)){
  print("hi")
}
#2: 
#there are ten dollars in the bank
#tim gets 5 dollars a week
#time buys gum twice a week for 1.34
bankaccount <- 10
weeklyallowance <- 5
gum <- 1.34
timestimbuysgum <- 2
#8 weeks 
##sequence is 1-8

for (i in seq(1,8)){
  bankaccount  <- (bankaccount + weeklyallowance) - timestimbuysgum*gum
  print(bankaccount)  
}

#3: A population (2000 indivs) shrinks by 5% each year
#what is the expected population in the next 7 years (seq 1:7)

currentpopulation <- 2000
popshrink <- 0.05
for (i in seq(1,7)){
   currentpopulation <- (currentpopulation - (currentpopulation * popshrink))
  print(currentpopulation)
}


#4: discrete time logistic growth equation 
n <- 2500
K <- 10000
r <- 0.8
#n is population size
#K is carrying capacity 
#r is intrinsic growth rate
# t is time, which is 1-12
###print(paste(t , n[t]))

for (t in seq(2,13)) {
  
  n[t] = n[t-1] + ( r * n[t-1] * (K - n[t-1])/K )
  print(paste(t , n[t]))
}

#PART II
#Practice writing “for loops” AND practice storing the data produced by your loops in arrays.

##5: Practice some basics of array indexing using for loops
#5a
fiveA <- rep(0, 18)
fiveA

#5b
# Suppose you write a for loop that looks something like this:
#for ( i in seq(1,18) ) { ... }
#This is a loop that is iterated 18 times. Replace the "..." with code that will make the loop store 3 times the ith value of the iterator variable (i)
#in the ith spot of the vector you created in part a. If you do this correctly, your vector should now look like this in the console:
#[1] 3 6 9 12 15 18 21 24 27 30 33 36 39 42 45 48 51 54
#
x<- seq(1,18)
for (i in seq(1,18)) {
  
 print( x[i] <- (i *3 ) )
}
print(x)


#5C:  Repeat part a to make a new vector of zeros. Then, make the first entry of that vector have a value of 1. 
FiveC <- rep(1:0, c(1,17))  
print(FiveC)

#5D:Write a for loop so that starting with the second entry of the vector created in part c, 
#the value stored in that position in the vector is equal to one plus twice the value of the previous entry 
#(i.e., 1 + (2 * previous entry) )
n <- 18
for (i in 2:n){
  FiveC[i] <- 1 + ( 2 * (FiveC[i-1]) )
}
print(FiveC)
##########################################################################
#6:
#every number after the first two is the sum of the two preceding ones:
#1 , 1 , 2 , 3 , 5 , 8 , 13 , 21 , 34 , 55 , 89 , 144 
#6:
#i[3]  <- print ((i[3] - i[2]) + (i[3] - i[1]))
#third position is equal to (third - second) plus (third - first)
Z <- 20 
fib <- rep( 0, Z )
#fib is a vector with 20 spaces
fib[2] <- 1
#postion 2 is 1
print(fib)
#print (thirdint <-  (thirdint + firstint)  + (thirdint + secondint))

for ( i in 3:20) {
 (fib[i] <- fib[i-2] + fib[i-1])
}
print(fib)
##########################################################################
#7: Redo question 4 from part I above, but now store all the data. 
#(If you did that already as part of your work above, just note that in a comment.) 
#Make two vectors, one called "time" that stores the time steps (1 to 12), 
#and one called "abundance" that stores the data on population abundances predicted from the discrete-time logistic equation. 
#Then, make a plot of the results (i.e., plot(time, abundance)).
###############################################################################################################################################################################################
###############################################################################################################################################################################################
#make time into a vector of 1-12
n <- 2500
K <- 10000
r <- 0.8
TIME <- seq(2,13)
print(TIME)
for (t in seq(2,13)) {
  
  n[t] = n[t-1] + ( r * n[t-1] * (K - n[t-1])/K )
  print(TIME[t])
}
print(TIME)
#####################################################################################################################
#make abundance into a vector with 12 values
n <- 2500
K <- 10000
r <- 0.8
totalTimeSteps <- 12
initAbundance <- n #first abun is 2500
n <- rep( initAbundance, totalTimeSteps ) #rep(2500,12)
#vector for n using initial abundance
TIME <- 1:totalTimeSteps #preallocating a place for the time vector
for (t in 2:totalTimeSteps) {
  n[t] <- n[t-1] + ( r * n[t-1] * (K - n[t-1])/K )
  print(TIME[t])
  print(n[t])
}
print(n)
ABUN <- n
#####################################################################################################################
plot(TIME, ABUN,  xlab = "Time", ylab = "Abundance")