#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#How to compute some descriptive statistics for PS 270
#Jeremy Kedziora
#26 September 2022
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
rm(list = ls())

#@@@@@@@@@@@@@@@@
#import libraries
#@@@@@@@@@@@@@@@@
library(foreign)

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#Let's make a little bit of data
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
transport = c(rep('train',45),rep('bus',30),rep('car',125))
transport = sample(transport,length(transport),replace = FALSE)
party = c(rep('democrat',45),rep('republican',30),rep('independent',125))
party = sample(party,length(party),replace = FALSE)

filepath = '/Users/jeremykedziora/Documents/UW Madison/Political Science/PS_270/Lectures/Data_Viz/employee_data.csv'
salary = read.csv(filepath)$salary    #read in as a csv -- it will be in R's memory as a dataframe named employee_data

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#measures of central tendency
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#mode
names(sort(table(party),decreasing = TRUE))[1]

#median
party = (party == 'independent')*2 + (party == 'democrat')*1 + (party == 'republican')*3
median(party)
median(salary)

#mean
sum(salary)/length(salary)
mean(salary)

#midrange

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#measures of central tendency
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#range
#variation ratio
#standard deviation



















#@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#measures of central tendency
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#mode
counts = table(transport)
counts = sort(counts,decreasing = TRUE)
names(counts)[1]

#median
median((party == 'democrat')*1 + (party == 'independent')*2 + (party == 'republican')*3)
median(salary)

#mean
sum(salary)/length(salary)
mean(salary)

#midrange
(max(salary) + min(salary))/2

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#measures of central tendency
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#range
max(salary) - min(salary)

#variation ratio
1 - max(table(transport))/length(transport)

#standard deviation
((1/(length(salary)-1))*sum((salary - mean(salary))^2))^0.5
sd(salary)

