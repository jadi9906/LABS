####################
#Independent Project
#Computational Biology 4420
#Jacob Di Biase
####################
#this data set is from the NYT repository covering COVID-19, 
#and is available publically on their github page here: https://github.com/nytimes/covid-19-data
#the datasets are updated regularly as cases and deaths change 
df <- read.csv("us-states.csv")  #Read in states data
head(df)
library(dplyr)
library(ggplot2)
str(df)  #Get a feel for what the data looks like
dim(df)

colorado <- df %>% filter(state %in% "Colorado") #filter the df dataframe into lines only that have "Colorado" in the state column
colorado

plot_of_colorado_cases_and_deaths <- ggplot(colorado, aes(y=date, group = 2)) +  #plot colorado cases and deaths together 
  geom_line(aes(x = cases), color = "steelblue") + 
  geom_line(aes(x = deaths), color="darkred", linetype="twodash") +
  geom_vline( xintercept = 1086,color = "darkgreen", size=0.5) #intercept line is the date that the  Colorado stay at home order
plot_of_colorado_cases_and_deaths 

wisconsin <- df %>% filter(state %in% "Wisconsin") # same plot as above but for a different state
wisconsin
plot_of_wisconsin_cases_and_deaths <- ggplot(wisconsin, aes(y=date, group = 2)) + 
  geom_line(aes(x = cases), color = "steelblue") + 
  geom_line(aes(x = deaths), color="darkred", linetype="twodash") + 
  geom_vline( xintercept = 418, 
              color = "darkgreen", size=0.5)
plot_of_wisconsin_cases_and_deaths 


minnesota <- df %>% filter(state %in% "Minnesota")
minnesota
plot_of_minnesota_cases_and_deaths <- ggplot(minnesota, aes(y=date, group = 2)) + 
  geom_line(aes(x = cases), color = "steelblue") + 
  geom_line(aes(x = deaths), color="darkred", linetype="twodash") + 
  geom_vline( xintercept = 398 , 
              color = "darkgreen", size=0.5)
plot_of_minnesota_cases_and_deaths 


maryland <- df %>% filter(state %in% "Maryland")
plot_of_maryland_cases_and_deaths <- ggplot(maryland, aes(y=date, group = 2)) + 
  geom_line(aes(x = cases), color = "steelblue") + 
  geom_line(aes(x = deaths), color="darkred", linetype="twodash") + 
  geom_vline( xintercept = 398 , 
              color = "darkgreen", size=0.5)
plot_of_maryland_cases_and_deaths 

kansas <- df %>% filter(state %in% "Kansas")
plot_of_kansas_cases_and_deaths <- ggplot(kansas, aes(y=date, group = 2)) + 
  geom_line(aes(x = cases), color = "steelblue") + 
  geom_line(aes(x = deaths), color="darkred", linetype="twodash") + 
  geom_vline( xintercept = 398 , 
              color = "darkgreen", size=0.5)
plot_of_kansas_cases_and_deaths 

newmexico <-  df %>% filter(state %in% "New Mexico")
plot_of_newmexico_cases_and_deaths <- ggplot(kansas, aes(y=date, group = 2)) + 
  geom_line(aes(x = cases), color = "steelblue") + 
  geom_line(aes(x = deaths), color="darkred", linetype="twodash") + 
  geom_vline( xintercept = 398 , 
              color = "darkgreen", size=0.5)
plot_of_newmexico_cases_and_deaths 

#n is 30, a statistically significant pool, states in the west coast and midwest were prioritized because west coast states are more populated and 
#government stay at home may not have a noticeable effect.
colorado <- df %>% filter(state %in% "Colorado") #1
wisconsin <- df %>% filter(state %in% "Wisconsin") #2
minnesota <- df %>% filter(state %in% "Minnesota") #3
maryland <- df %>% filter(state %in% "Maryland")#4
kansas <- df %>% filter(state %in% "Kansas") #5
newmexico <-  df %>% filter(state %in% "New Mexico") #6
arizona <-  df %>% filter(state %in% "Arizona") #7
nevada <-  df %>% filter(state %in% "Nevada")#8
idaho <-  df %>% filter(state %in% "Idaho")#9
montana <-  df %>% filter(state %in% "Montana")#10
oregon <-  df %>% filter(state %in% "Oregon")#11
washington <-  df %>% filter(state %in% "Washington")#12
florida <-  df %>% filter(state %in% "Florida")#13
hawaii <-  df %>% filter(state %in% "Hawaii")#14
nebraska <-  df %>% filter(state %in% "Nebraska")#15
oklahoma <-  df %>% filter(state %in% "Oklahoma")#16
iowa <-  df %>% filter(state %in% "Iowa")#17
missouri <-  df %>% filter(state %in% "Missouri")#18
maine <-  df %>% filter(state %in% "Maine")#19 
louisiana <-  df %>% filter(state %in% "Louisiana")#20
illinois <-  df %>% filter(state %in% "Illinois")#21
mississippi <-  df %>% filter(state %in% "Mississippi")#22
michigan <-  df %>% filter(state %in% "Michigan")#23
indiana <-  df %>% filter(state %in% "Indiana")#24
kentucky <-  df %>% filter(state %in% "Kentucky")#25
Tennessee <-  df %>% filter(state %in% "Tennessee")#26
texas <-  df %>% filter(state %in% "Texas")#27
ohio <-  df %>% filter(state %in% "Ohio")#28
california <-  df %>% filter(state %in% "California")#29
georgia <-  df %>% filter(state %in% "Georgia")#30

#Now I have to find the shutdown date for all 30 states for my plots
#colorado shutdown date: march 25th 
#https://www.denverpost.com/2020/04/08/colorado-coronavirus-covid-timeline/
#wisconsin shutdown date: march 23rd
#minnesota shutdown date: march 27th
#Utah date:march 16th
#kansas date: march 30th
#Newmexico date: march 23

#############################################
#Now split state data into before and after the stay at home order 
#all stay at home orders were found here: https://www.littler.com/publication-press/publication/stay-top-stay-home-list-statewide
#this site was very helpful
colorado
ColoradoBeforeStayatHome <- colorado[ - c(22 :  49) , ]
ColoradoAfterStayatHome <- colorado[  - c( 1 : 22) , ]
ColoradoBeforeStayatHome
ColoradoAfterStayatHome
#Two plots of before and after stay at home, before stay at home seems to be almost exponential, and after the stay
#at home the curve looks more linear
PlotColoradoBeforeStayatHome <- ggplot(ColoradoBeforeStayatHome, aes(x=date, group = 2)) + 
                                         geom_line(aes(y = cases), color = "steelblue") + 
                                         geom_line(aes(y = deaths), color="darkred", linetype="twodash")
PlotColoradoAfterStayatHome <- ggplot(ColoradoAfterStayatHome, aes(x=date, group = 2)) + 
                                        geom_line(aes(y = cases), color = "steelblue") + 
                                        geom_line(aes(y = deaths), color="darkred", linetype="twodash")
PlotColoradoBeforeStayatHome
PlotColoradoAfterStayatHome

wisconsin
wisconsinBeforeStayatHome <- wisconsin[-c(49:78), ]
wisconsinAfterStayatHome <- wisconsin[-c(1:50),]
wisconsinBeforeStayatHome
wisconsinAfterStayatHome

PlotwisconsinBeforeStayatHome <- ggplot(wisconsinBeforeStayatHome , aes(x=date, group = 2)) + 
         geom_line(aes(y = cases), color = "steelblue") + 
         geom_line(aes(y = deaths), color="darkred", linetype="twodash")
PlotwisconsinAfterStayatHome <- ggplot(wisconsinAfterStayatHome, aes(x=date, group = 2)) + 
         geom_line(aes(y = cases), color = "steelblue") + 
         geom_line(aes(y = deaths), color="darkred", linetype="twodash")
PlotwisconsinBeforeStayatHome
PlotwisconsinAfterStayatHome

minnesota
minnesotaBeforeStayatHome <- minnesota[-c(23:48), ]
minnesotaAfterStayatHome <- minnesota[-c(1:22), ]
minnesotaBeforeStayatHome
minnesotaAfterStayatHome

PlotminnesotaBeforeStayatHome <- ggplot(minnesotaBeforeStayatHome, aes(x=date, group = 2)) + 
         geom_line(aes(y = cases), color = "steelblue") + 
         geom_line(aes(y = deaths), color="darkred", linetype="twodash")
PlotminnesotaAfterStayatHome <- ggplot(minnesotaAfterStayatHome, aes(x=date, group = 2)) + 
         geom_line(aes(y = cases), color = "steelblue") + 
         geom_line(aes(y = deaths), color="darkred", linetype="twodash")
PlotminnesotaBeforeStayatHome
PlotminnesotaAfterStayatHome

#cowplot allows observing multiple plots at once, three plots of cases after the stay at home order can be seen here
library(cowplot)
cowplot::plot_grid(PlotwisconsinAfterStayatHome,PlotColoradoAfterStayatHome, PlotminnesotaAfterStayatHome, ncol = 1)

#kansas date: march 30th
#Newmexico date: march 23
maryland
marylandafterstayathome <- maryland[-c(1:26), ]
marylandafterstayathome
kansas
kansasafterstayathome <- kansas[-c(1:24), ]
kansasafterstayathome
newmexico
newmexicoafterstayathome <- newmexico[-c(1:13),]
newmexicoafterstayathome

arizona #3/31
arizonaafterstayathome <- arizona[-c(1:66), ]
arizonaafterstayathome
nevada #4/1
nevadaafterstayathome <- nevada[-c(1:28), ]
nevadaafterstayathome
idaho #3/25
idahoafterstayathome <- idaho[-c(1:13), ]
idahoafterstayathome
montana #3/28
montanaafterstayathome <- montana[-c(1:16), ]
montanaafterstayathome
oregon #3/23
oregonafterstayathome <- oregon[-c(1:25), ]
oregonafterstayathome
washington #3/23
washingtonafterstayathome <- washington[-c(1:63), ]
washingtonafterstayathome
 florida #4/3
floridaafterstayathome <- florida[-c(1:34), ]
floridaafterstayathome
hawaii #3/25
hawaiiafterstayathome <- hawaii[-c(1:20), ]
hawaiiafterstayathome
nebraska #4/10
nebraskaafterstayathome <- nebraska[-c(1:54), ]
nebraskaafterstayathome
oklahoma #3/24
oklahomaafterstayathome <- oklahoma[-c(1:19), ]
oklahomaafterstayathome
iowa #4/17
iowaafterstayathome <- iowa[-c(1:41), ]
iowaafterstayathome
missouri #4/6
missouriafterstayathome <- missouri[-c(1:31), ]
missouriafterstayathome
maine #4/2
maineafterstayathome <- maine[-c(1:22), ]
maineafterstayathome
louisiana #3/23
louisianaafterstayathome <- louisiana[-c(1:15), ]
louisianaafterstayathome
illinois #3/21
illinoisafterstayathome <- illinois[-c(1:58), ]
illinoisafterstayathome
mississippi #4/3
mississippiafterstayathome <- mississippi[-c(1:24), ]
mississippiafterstayathome
michigan #3/24
michiganafterstayathome <- michigan[-c(1:15), ]
michiganafterstayathome
indiana #3/24
indianaafterstayathome <- indiana[-c(1:19), ]
indianaafterstayathome
kentucky #3/26
kentuckyafterstayathome <- kentucky[-c(1:21), ]
kentuckyafterstayathome
Tennessee #3/31
tennesseeafterstayathome <- Tennessee[-c(1:27), ]
tennesseeafterstayathome
texas #4/2
texasafterstayathome <- texas[-c(1:51), ]
texasafterstayathome
ohio #3/23
ohioafterstayathome <- ohio[-c(1:15), ]
ohioafterstayathome
california #3/19
californiaafterstayathome <- california[-c(1:55), ]
californiaafterstayathome
georgia #4/3
georgiaafterstayathome <- georgia[-c(1:33), ]
georgiaafterstayathome

library(dataRetrieval)
library(dplyr) 
library(tidyr) 
library(ggplot2)

#Now finding the rate of cases before and after using the slope of the line
#to do this for all 30 data sets I made a function that can take in a dataset from after the stay at home
#and return the "rate" (in this case just the number of cases divided by the number of days after the stay at home order) of cases


RateofCases <- function(V){
  headV <- head(V) #top and bottom of dataset
  tailV <- tail(V)
  
  topofvec <- headV
  bottomofvec <- tailV
  
  y <-  length(bottomofvec$cases)
  topvalue <- topofvec$cases[1] #first value 
  bottomvalue <- bottomofvec$cases[y] #last value 
  
  rise <-  (bottomvalue - topvalue)
  x <- length(V$date)
  
  results  <-   (rise/x) #divides new number of cases and the number of days transpired
  message("Rate of Cases over Time is:")
  return( results )
}
#this function can take in the NYT data as it is updated and still work
#function is now applied to the 30 trimmed datasets
RateofCases(californiaafterstayathome)   #####3/19
RateofCases(illinoisafterstayathome)   ####3/21
RateofCases(louisianaafterstayathome)   #####3/23
RateofCases(newmexicoafterstayathome)  ####3/23
RateofCases(washingtonafterstayathome)   #####3/23
RateofCases(ohioafterstayathome)   ####3/23
RateofCases(oregonafterstayathome)   ####3/23
RateofCases(indianaafterstayathome)   ####3/24
RateofCases(michiganafterstayathome)   #####3/24
RateofCases(oklahomaafterstayathome)   #####3/24
RateofCases(wisconsinAfterStayatHome)  ####3/25
RateofCases(hawaiiafterstayathome)   #####3/25
RateofCases(idahoafterstayathome)   ####3/25
RateofCases(ColoradoAfterStayatHome)  ####3/26
RateofCases(kentuckyafterstayathome)   #####3/26
RateofCases(minnesotaAfterStayatHome)  ####3/27
RateofCases(montanaafterstayathome)   #####3/28
RateofCases(marylandafterstayathome)  ######  3/30
RateofCases(kansasafterstayathome)  ####3/30
RateofCases(arizonaafterstayathome)   ####3/31
RateofCases(tennesseeafterstayathome)  ####3/31
RateofCases(nevadaafterstayathome)   #####4/1
RateofCases(maineafterstayathome)   ####4/2
RateofCases(texasafterstayathome)   #####4/2
RateofCases(floridaafterstayathome)   ####4/3
RateofCases(georgiaafterstayathome)   ####4/3
RateofCases(mississippiafterstayathome)   #####4/3
RateofCases(missouriafterstayathome)   #####4/6
RateofCases(nebraskaafterstayathome)   ####4/10
RateofCases(iowaafterstayathome)   ####4/17

#make a new dataframe of the "rate" of cases and the date of the state wide stay at home order
dfofdatesandcases <- tibble("Dates" =  as.Date (c("3-19-2020", "3-21-2020","3-23-2020","3-23-2020", "3-23-2020","3-23-2020","3-23-2020", "3-24-2020","3-24-2020","3-24-2020", "3-25-2020","3-25-2020","3-25-2020", "3-26-2020","3-26-2020", "3-27-2020","3-28-2020", "3-30-2020","3-30-2020", "3-31-2020","3-31-2020","4-1-2020", "4-2-2020", "4-2-2020", "4-3-2020","4-3-2020","4-3-2020", "4-6-2020", "4-10-2020", "4-17-2020" ), format = "%m-%d-%Y"   ),
                            "Rates_of_cases" = c(1067.353, 1064.406, 795.6667 ,70.33333,335.6667,451.7667,61.66667,412.3793,1090.862,94.13793,146.1071,17.14286,53.53571,338.6296,113.7407,87.69231,11.12,570.1304,80.78261,183.9091,227.9091,124.9048,23.75,805,882.3158,721.8947,181,193.75, 92.33333,250.2    ))
#the as.Date function turns characters or numerics into actual dates
str(dfofdatesandcases$dates)

#plot the newly made dataframe with geom point, which shows the actual points,
#and with geom_smooth, which will smooth the curve and ideally show the correlation 
newplot   <- ggplot(dfofdatesandcases, aes(y=Rates_of_cases, group = 2)) + 
  geom_smooth(aes(x = Dates ), color = "steelblue") +
  geom_point(aes( x = Dates))
newplot

#This plot does not exactly show what I was expecting, I hypothesized that there would be an obvious positive 
#correlation between higher rates of cases and later stay at home orders

summary(dfofdatesandcases)
#to test correlation and the statistical significance, I will do a correlation test, but dates have to be numeric.
dfofdatesandcases <- tibble("dates" = as.numeric(  as.Date (c("3-19-2020", "3-21-2020","3-23-2020","3-23-2020", "3-23-2020","3-23-2020","3-23-2020", "3-24-2020","3-24-2020","3-24-2020", "3-25-2020","3-25-2020","3-25-2020", "3-26-2020","3-26-2020", "3-27-2020","3-28-2020", "3-30-2020","3-30-2020", "3-31-2020","3-31-2020","4-1-2020", "4-2-2020", "4-2-2020", "4-3-2020","4-3-2020","4-3-2020", "4-6-2020", "4-10-2020", "4-17-2020" ), format = "%m-%d-%Y"  ) ),
                            "rates_of_cases" = c(1067.353, 1064.406, 795.6667 ,70.33333,335.6667,451.7667,61.66667,412.3793,1090.862,94.13793,146.1071,17.14286,53.53571,338.6296,113.7407,87.69231,11.12,570.1304,80.78261,183.9091,227.9091,124.9048,23.75,805,882.3158,721.8947,181,193.75, 92.33333,250.2    ))
str(dfofdatesandcases$dates)

#single out dates and rates of cases
Y <- dfofdatesandcases$dates
Z <- dfofdatesandcases$rates_of_cases
#cross them in cor.test, which gives a p-value and correlation rate at a 95% confidence level
?cor.test
cor.test(Y,Z, conf.level = 0.95)
#unfortunately, the p-value is 0.2592, which is much higher than what is statistically significant,
#and cor is -0.212, which is not close to 1, which would imply a correlation.
#A reason for this hypothesis not working out coud be that people tended to stay at home even before the stay at home order,
#the state of national emergency probably convinced many people to stay home. Another reason could be that by the time that 
#the state governments had issued these orders many businesses and public places had been closed for at least a week.
#Much more research could go into this data set, but it was quite interesting to follow what I thought would be worthwhile to investigate.





