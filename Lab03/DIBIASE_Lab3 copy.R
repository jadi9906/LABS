####LAB STEP 3########
# x=Guests y=Bags

x <- 8
y <- 5

#LAB STEP 5 
##Each guest eats an average of 0.4 of a bag of chips

eats <- 0.4


y - (x * eats )


##Rankings of episodes I-IX

Self <- c(7, 9, 8, 1, 2, 3, 4, 6 ,5)
Penny <- c(5 ,9 ,8 ,3 ,1 ,2 ,4 ,7 ,6)
Lenny <- c(6 ,5 ,4 ,9 ,8 ,7 ,3 ,2 ,1)
Stewie <- c(1, 9, 5, 6, 8, 7, 2, 3, 4)

#Ranking for Episode IV for Penny and Lenny
PennyIV <- Penny[4]
LennyIV <- Lenny[4]


##Concatenate all 4 sets of data into one object
allrankings <- cbind(Self, Penny, Lenny, Stewie)


str(PennyIV)
str(Penny)
str(allrankings)

###The structure of the above three data is quite different. PennyIV is just the number three pulled from the single ranking matrix. 
###Penny is the ranking matrix for Penny of all the movies, which is a vector of 9 numbers ranked one through nine. 
###allrankings object is the combination of all the rankings from all of the rankers, each of the four people have a list of 1-9.

dataframerankings <- data.frame(allrankings)
dataframerankings <- as.data.frame(allrankings)
##
##The allrankings object and the dataframerankings object are very similar, they both have 9 rows and 4 columns, but the dataframe object is organized into a real matrix, while the allrankings is just a binding of 4 vectors.
##Also, the dataframerankings is a "list" and the allrankings is "double".
dim(dataframerankings)
dim(allrankings)

str(dataframerankings)
str(allrankings)

typeof(dataframerankings)
typeof(allrankings)


##Vector of the Episode names as Roman Numerals

Roman <- c("I","II","III","IV","V","VI","VII","VIII","IX")

row.names(dataframerankings) <- Roman

dataframerankings

allrankings[3,] 

dataframerankings[,4]

dataframerankings[5,1]  ###"Self ranking of 5" 

dataframerankings[2,2]  ###"Penny ranking of 2 "

dataframerankings[4 : 6,]  ####"rankings of 4-6"

dataframerankings[c(2,5,7),] ###"everyones rankings for 2, 5 and 7"

dataframerankings[c(4,6),c(2,4)]  ###"rankings for Penny and Stewie for 4 and 6" 
 
Lenny
Lenny <- c(6,5,4,9,8,7,3,2,1)   ##original lenny


Lenny2 <- dataframerankings[2,3]
Lenny5 <- dataframerankings[5,3]

dataframerankings[2,3] <- Lenny5
dataframerankings[5,3] <- Lenny2
##Lenny 2 is swapped position with Lenny 5 and reverse 

dataframerankings

dataframerankings["III", "Penny"] ###this works

###same technique
Lenny2 <- dataframerankings["II","Lenny"]
Lenny5 <- dataframerankings["V","Lenny"]

dataframerankings["II","Lenny"] <- Lenny2
dataframerankings["V","Lenny"] <- Lenny5



##Using $ to undo the last change
Lenny2 <- dataframerankings$Lenny[2]
Lenny5 <- dataframerankings$Lenny[5]

dataframerankings$Lenny[2] <- Lenny5
dataframerankings$Lenny[5] <- Lenny2

dataframerankings
