##########
#LAB11
#Jacob Di Biase
#Friday April 3rd
##########
#Part I: Getting set up to work with the data
install.packages("tidyverse")
install.packages("dplyr")
installed.packages("ggplot2")
library(ggplot2)
library(readr)
library(dplyr)
GlobalWoodDensityDatabase1 <- read_csv("GlobalWoodDensityDatabase1.csv")
View(GlobalWoodDensityDatabase1)
head(GlobalWoodDensityDatabase1)
#Part II: Working with density data
#4A: Removing rows with missing data
vectorofDensity <- GlobalWoodDensityDatabase1$`Wood density (g/cm^3), oven dry mass/fresh volume` 
vectorofDensity
which(is.na(vectorofDensity))
vectorofDensity[12150]
#4B
 
GlobalWoodDensityDatabase1 <- GlobalWoodDensityDatabase1[-12150,]
dim(GlobalWoodDensityDatabase1)
#found and removed missing data

#5. Dealing with one kind of pseudo-replication
GlobalWoodDensityDatabase1
GlobalWoodDensityDatabase2   <- GlobalWoodDensityDatabase1[,-c(1,5,6)]
GlobalWoodDensityDatabase2
GlobalWoodDensityDatabase2 <- GlobalWoodDensityDatabase2[, c(2,1,3)]
GlobalWoodDensityDatabase2
#trim data to 3 columns 
library(dplyr)
speciestable  <- summarize(group_by(GlobalWoodDensityDatabase2, Binomial, Family))
speciestable
correctfamilylist <- speciestable[,-c(1)]
correctfamilylist

nameanddensity <- summarize(group_by(GlobalWoodDensityDatabase2, Binomial, `Wood density (g/cm^3), oven dry mass/fresh volume`)) 
nameanddensity

listofdensities <- summarize(group_by(nameanddensity, Binomial) , MeanWoodDensity = mean(`Wood density (g/cm^3), oven dry mass/fresh volume`))
listofdensities

finaltable <- cbind(listofdensities, correctfamilylist) 
finaltable
finaltable <- finaltable[, c( 1,3,2)]
finaltable


#6:Contrasting most and least dense families
#6A Make a new data frame that has the average density for each Family
averagefamilydensity <- summarize(group_by(GlobalWoodDensityDatabase2, Family) , MeanFamilyDensity = mean(`Wood density (g/cm^3), oven dry mass/fresh volume`))
averagefamilydensity
#6B: Sort the result of problem 6a by MeanDensity
 
averagefamilydensity <- averagefamilydensity %>% arrange(desc(MeanFamilyDensity))
averagefamilydensity

#6C: 
#What are the 8 families with the highest average densities?
#1 Hypericaceae               0.985
#2 Zygophyllaceae             0.951
#3 Irvingiaceae               0.873
#4 Sarcolaenaceae             0.867
#5 Surianaceae                0.851
#6 Linaceae                   0.848
#7 Bonnetiaceae               0.84 
#8 Quiinaceae                 0.820

#What are the 8 families with the lowest average densities?
tail(averagefamilydensity, n = 8)
#1 Tetramelaceae             0.307
#2 Datiscaceae               0.301
#3 Muntingiaceae             0.3  
#4 Bixaceae                  0.294
#5 Hernandiaceae             0.284
#6 Moringaceae               0.262
#7 Paulowniaceae             0.247
#8 Caricaceae                0.226

upperEight <-  head(plotoffinal, n = 8)
lowerEight  <- tail(plotoffinal, n = 8)
upperEight
lowerEight


finaltable
library(dplyr)
plotoffinal <- listofdensities %>% arrange(desc(MeanWoodDensity))
plotoffinal

#Part III : Plotting

#7. Plotting densities of most and least dense families with facets
install.packages("ggplot2")
library("ggplot2")
GlobalWoodDensityDatabase2
familyandDensity <- GlobalWoodDensityDatabase2[,-1]
familyandDensity

#obtain most dense families and least dense families (8 each)
topEightdensities <- familyandDensity %>% filter(Family %in% c("Hypericaceae", "Zygophyllaceae","Irvingiaceae","Sarcolaenaceae","Surianaceae","Linaceae","Bonnetiaceae", "Quiinaceae"))
topEightdensities
bottomEightdensities <- familyandDensity %>% filter(Family %in% c("Tetramelaceae", "Datiscaceae", "Muntingiaceae", "Bixaceae", "Hernandiaceae", "Moringaceae", "Paulowniaceae", "Caricaceae") )
bottomEightdensities
#plot faceted 
library(ggplot2)
plot1 <- ggplot(topEightdensities, aes(x = Family, y = `Wood density (g/cm^3), oven dry mass/fresh volume` )) + 
  geom_boxplot()  + facet_wrap(vars(Family))
plot1

plot2 <- ggplot(bottomEightdensities, aes(x = Family, y = `Wood density (g/cm^3), oven dry mass/fresh volume` )) + 
  geom_boxplot()  +  facet_wrap(vars(Family))
plot2


#8. Facilitating comparisons with graphics.
plot3 <- ggplot(topEightdensities, aes(x = Family, y = `Wood density (g/cm^3), oven dry mass/fresh volume` )) + 
  geom_boxplot() + scale_x_discrete(limits=c("Hypericaceae", "Zygophyllaceae","Irvingiaceae","Sarcolaenaceae","Surianaceae","Linaceae","Bonnetiaceae", "Quiinaceae")) + coord_flip() + ylab("Wood Density(g/cm^3)") + ggtitle("Families with highest average densities")
plot3

plot4 <- ggplot(bottomEightdensities, aes(x = Family, y = `Wood density (g/cm^3), oven dry mass/fresh volume` )) + 
  geom_boxplot()+ scale_x_discrete(limits=c("Tetramelaceae", "Datiscaceae", "Muntingiaceae", "Bixaceae", "Hernandiaceae", "Moringaceae", "Paulowniaceae", "Caricaceae")) + coord_flip() + ylab("Wood Density(g/cm^3)") + ggtitle("Families with lowest average densities")
plot4
#plotted with flipped cords and un faceted








