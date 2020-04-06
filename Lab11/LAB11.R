##########
#LAB11
#Jacob Di Biase
#Friday April 3rd
##########

install.packages("tidyverse")
install.packages("dplyr")
installed.packages("ggplot2")
library(ggplot2)
library(readr)
library(dplyr)
GlobalWoodDensityDatabase1 <- read_csv("GlobalWoodDensityDatabase1.csv")
View(GlobalWoodDensityDatabase1)
head(GlobalWoodDensityDatabase1)
#4A
vectorofDensity <- GlobalWoodDensityDatabase1$`Wood density (g/cm^3), oven dry mass/fresh volume` 
vectorofDensity
which(is.na(vectorofDensity))
vectorofDensity[12150]
#4B
 
GlobalWoodDensityDatabase1 <- GlobalWoodDensityDatabase1[-12150,]
dim(GlobalWoodDensityDatabase1)

#5
GlobalWoodDensityDatabase1
GlobalWoodDensityDatabase2   <- GlobalWoodDensityDatabase1[,-c(1,5,6)]
GlobalWoodDensityDatabase2
GlobalWoodDensityDatabase2 <- GlobalWoodDensityDatabase2[, c(2,1,3)]
GlobalWoodDensityDatabase2

speciestable  <- summarize(group_by(GlobalWoodDensityDatabase2, Binomial, Family))
speciestable
correctfamilylist <- speciestable[,-c(1)]
correctfamilylist

nameanddensity <- summarize(group_by(GlobalWoodDensityDatabase2, Binomial, `Wood density (g/cm^3), oven dry mass/fresh volume`) , myFreq = n())
nameanddensity

listofdensities <- summarize(group_by(nameanddensity, Binomial) , MeanWoodDensity = mean(`Wood density (g/cm^3), oven dry mass/fresh volume`))
listofdensities

finaltable <- cbind(listofdensities, correctfamilylist) 
finaltable
finaltable <- finaltable[, c( 1,3,2)]
finaltable


#6:Contrasting most and least dense families
#6A
averagefamilydensity <- summarize(group_by(GlobalWoodDensityDatabase2, Family) , MeanFamilyDensity = mean(`Wood density (g/cm^3), oven dry mass/fresh volume`))
averagefamilydensity
#6B
 
averagefamilydensity <- averagefamilydensity %>% arrange(desc(MeanFamilyDensity))
averagefamilydensity

#6C
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

#Part III : Plotting
#7. Plotting densities of most and least dense families with facets

library("ggplot2")


finaltable

plotoffinal <- listofdensities %>% arrange(desc(MeanWoodDensity))
plotoffinal

upperEight <-  head(plotoffinal, n = 8)
lowerEight  <- tail(plotoffinal, n = 8)
ggplot(plotoffinal, aes( x = upperEight, y = MeanWoodDensity )) = geom_boxplot()




