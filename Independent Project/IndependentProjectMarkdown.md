## **Transmission rate of COVID-19 and the timeline of State responses**
---
#### **Introduction**
 The goal of this study is to investigate the relationship between transmission rate of COVID-19 and the response time of effective lockdowns for states. This study will ideally find the effectiveness of each states' response to the virus, and find if lockdowns had a significant effect on rate of transmission and ultimately deaths. I will track cases over time state by state, and indicate when lockdowns took place, then, comparing rates before and after lockdowns should reveal how responses by state government effected transmission. I will also do the same analysis with virus deaths, to see if conclusions are similar or different. States that declared lockdowns before the national emergency status took place will most likely have more useful information. My driving question for this study is: How effective were state lockdowns at reducing the rate of transmission, and did this early action save more lives?
 
 ---
#### **Summary of Data to be Analyzed**

##### Goals of the original study that produced the data
For this New York Times dataset there was not one study or project associated with the data. This dataset is used for the interactive COVID-19 maps available on the [site](https://www.nytimes.com/interactive/2020/us/coronavirus-us-cases.html), and reporting on the outbreak [here](https://www.nytimes.com/coronavirus), and is publically available on their github [COVID-19 repository](https://github.com/nytimes/covid-19-data).

##### Description of methodology
This data was collected through multiple different sources, including public officials, news conferences, data releases, and the public health system. A case is counted when a patient tests positive for COVID-19, and is confirmed by a federal or state government. Each day is a cumulative count of both cases and deaths.
##### Type of data
###### Format of data
Comma Separated Spreadsheet (.CSV)
###### Size of data
68,057 bytes
5 X 2274
###### Inconsistencies
 Deaths and cases are cumulative, so daily cases and deaths will have to be  extracted if needed.
###### What does the data represent about biology
 The data represents multiple ideas in the scope of biology. Mainly about local transmission of a virus, the effectiveness of distancing for preventing transmission and how a virus travels through a population. Understanding how a virus and a host interact is important for understanding how to mitigate and prevent spread.
 
 ---
 
 #### **Description of Analysis to be done and challenges involved**
 
* Split the dataset into state cases and deaths
* Plot the cases and deaths of the virus separately by state
* Overlay the individual states' emergency response lockdowns and optionally the national state of emergency
* Calculate the rate of infection before and after the lockdown
* Rate will be calculated in the form of a function that can analyze any available time period in this dataset
* Overlay hypothetical simulated virus transmission rate if no state response was enacted.
* Compare transmission rates to determine if lockdown procedures saved lives
* Compare deaths in states that announced lockdowns earlier rather than later to measure lockdown effectiveness


**This challenge hopefully will provide reinforcing evidence for the way transmission rates are lowered when social distancing takes place and lockdowns are announced.**

 ---
 #### **References**
 Data from The New York Times, based on reports from state and local health agencies.
 [https://www.nytimes.com/interactive/2020/us/coronavirus-us-cases.html](https://www.nytimes.com/interactive/2020/us/coronavirus-us-cases.html)
 All data used can be found on the New York Times github [COVID-19 repository](https://github.com/nytimes/covid-19-data).
 
 




