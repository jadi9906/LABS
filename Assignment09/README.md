#### **Independent Project: Investigating the relationship between date of state stay-at-home orders and rate of COVID-19 cases**
---
##### **Biological question**
Do earlier stay-at-home orders by state governments have statistically relevant effects on the rate (number of cases divided by a set time) of COVID-19 cases? 
##### **Context**
This study will investigate the relationship between transmission "rate" of COVID-19 and the response time of effective lockdowns for states. This study will ideally find if earlier lockdowns had a significant effect on "rate" of transmission. I will track cases over time state by state, and indicate when lockdowns took place, then, comparing rates of states with earlier compared to later stay-at-home orders should reveal how responses by state government affected transmission. The information about early action taken before a pandemic could be useful for state governments attempting to minimize cases and deaths. My driving question for this study is: Does preemptive action like issuing an earlier stay-at-home have an effect on the rates of cases of COVID-19?
##### **Methods**
###### Source: https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-states.csv
This dataset is from the New York Times Github repository, and the actual data is compiled from multiple different sources, including public officials, news conferences, data releases, and the public health system. A case is counted when a patient tests positive for COVID-19, and is confirmed by a federal or state government. Each day is a cumulative count of both cases and deaths.
This New York Times dataset did not have one study or project associated with the data. This dataset is used for the interactive COVID-19 maps available on the site [here](https://www.nytimes.com/interactive/2020/us/coronavirus-us-cases.html), and [here](https://www.nytimes.com/news-event/coronavirus). All of the data, metadata and associated packages can be found in their [Github repository](https://github.com/nytimes/covid-19-data)
Stay at home order dates were found [here.](https://www.littler.com/publication-press/publication/stay-top-stay-home-list-statewide)
###### Type of data
Format of this data is a Comma Separated Spreadsheet (.CSV)
The size of the data is 68,057 bytes, 2274 x 5
The layout of this data set has the following five columns: 
Date, State, Fips, Cases, Deaths
Fips is a widely used code for identifying geographic locations
###### Methods
Because there was no single study associated with this dataset, all of the methods shown will be my own.
1. Read in the dataset and got a feel for the dimensions
2. Filtered examples from the state column into lines with certain state names
3. Plotted example states with both cases and deaths over time, with an intersect line at the stay-at-home order
4. Filtered 30 states (a statistically relevant pool) into state datasets 
5. Trimmed the 30 state datasets into dates after the stay-at-home order
6. Made a function to find the "rate" of cases (Rate is the slope of the line of the trimmed datasets)
7. Function calculates the amount of cases over the alloted time period
8. Run 30  states through the function and make a data frame out of the results
9. Turn numeric date values into characters recognized as time
10. Plot the resuts with ggplot geom_smooth to find evidence of correlation
11. Perform a cor.test to test for correlation and a associated p-value

##### **Results**
When a geom_smooth was plotted, there seemed to be no real correlation between earlier stay-at-home orders and rates of cases, the plot looked like this: [![Finalgeom-smoothplot.png](https://i.postimg.cc/50TvY6xp/Finalgeom-smoothplot.png)](https://postimg.cc/47vnj4Hh)

This plot does not indicate a correlation between early stay-at-home dates and lower rates of cases, even with geom_smooth. Another way to test for a correlation is using cor.test function, which calculates a correlation coefficient and a p-value. Unfortunately, the p-value was 0.25, which iss much to high to be statistically significant, and the correlation coefficient was -0.21, not close to 1, which indicates correlation. These results suggest my hypothesis was either wrong, or there are more variables not being accounted for. One guess for why this did not work was that the announcement of a national emergency and voluntary closing of businesses caused most people to stay at home even before the state order. Also, calculating rate with the slope of cases over time is not exactly the most accurate or peerfect way to calculate rate. 


##### **References cited**
Mendelson, Littler. “Stay on Top of ‘Stay At Home’ – A List of Statewide Orders, as of April 28, 2020.” Littler Mendelson P.C., April 29, 2020. https://www.littler.com/publication-press/publication/stay-top-stay-home-list-statewide.

Nytimes. “Nytimes/Covid-19-Data.” GitHub, April 30, 2020. https://github.com/nytimes/covid-19-data.








