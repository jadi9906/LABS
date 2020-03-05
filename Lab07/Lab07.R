#Lab 07: "Put the FUN in FUNction! :-)
#Feb 28, 2020 
#Jacob Di Biase
#

#Problem 1
#The area of a triangle can be calculated as 0.5 * base * height
# Write a function named triangleArea that calculates and returns 
#the area of a triangle when given two arguments (base and height).
triangleArea <- function(b,h) {
  area <- (b + h) * 0.5
  return(area)
}
triangleArea(10,9)


#Problem #2
#2A:Write a function named myAbs() that calculates and returns absolute values. 
myAbs <- function(x)  {
  newx <- sqrt(x * x)
  return(newx)
}
myAbs(5)
myAbs(-2.3)
  
#2B:Revise your function to make it work on vectors
#it already worked on vectors
myAbs <- function(x)  {
  newx <- sqrt(x * x)
  return(newx)
}
example <- c(1.1, 2, 0, -4.3, 9, -12)
myAbs(example)  


#Problem #3 Fibonacci sequence
#write a function that returns a vector of the first n Fibonacci numbers, 
#Your function should take two arguments: the user's desired value of n and the user's desired starting number
#
#
myfib <- function(x,y){
  fib <- rep(0,x)
  if(y==1){
    fib[1] <- 1
    fib[2] <- 1}
  if(y==0){
    fib[1] <- 0
    fib[2] <- 1}
  #if functions decide where the sequence begins
  for (i in 3:x) 
    fib[i] <- fib[i-1] + fib[i-2]
  #for loop is the same fib sequence as previously done in an earlier lab
return(fib)
}
myfib(10,1)
myfib(10,0)

#Problem #4
#4A:Write a function that takes two numbers as
#its arguments and returns the square of the difference between them.
fourthfunction <- function(x,y){
  answer <- (x - y) ^ 2
  return(answer)
}
fourthfunction(3,5)
fourthfunction(c(2, 4, 6), 4)

#Part 4b: Write a function of your own that calculates the average of a vector of numbers.
arithmeticmean <- function(x){
 XSum  <- sum(x)
 XLength <- length(x)
 exampleMEAN <- (XSum/XLength)
  return(exampleMEAN)
}
arithmeticmean(c(5, 15, 10))
Lab07NewData <- DataForLab07[[1]]
arithmeticmean(Lab07NewData)


#Part 4c:the sum of squares can be calculated as the sum of the squared deviations from the mean
#sum of squares
SumofSquares <- function(x){
  y  <- arithmeticmean(x)
  newdata <- fourthfunction(x,y)
  results  <- sum(newdata)
  #used the two previously made functions for mean and position - mean
return(results)
}
Lab07NewData <- DataForLab07[[1]]
SumofSquares(Lab07NewData)
