#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#Some graphics for PS 270 using the base graphics API
#Jeremy Kedziora
#18 September 2022
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
rm(list = ls())    #clear memory

#import useful libraries
library(foreign)

#@@@@@@@@@@@@@@@@@
#specify filepaths
#@@@@@@@@@@@@@@@@@
filepath = '/Users/jeremykedziora/Documents/UW Madison/Political Science/PS_270/Lectures/Data_Viz/employee_data.csv'

#@@@@@@@@@@@@@
#load the data
#@@@@@@@@@@@@@
employee_data = read.csv(filepath)    #read in as a csv -- it will be in R's memory as a dataframe named employee_data

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#let's begin by making a bar chart of blood type:
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
counts = table(employee_data$groups)    #use table to count the number of people of each blood type
counts = sort(counts,decreasing = TRUE)    #sort the counts so that they are descending

barplot(counts
        ,col = 'lightskyblue'
        ,border = NA
        ,main='Blood Type Counts'
        ,cex.main = 2
        ,xlab='Blood Types'
        ,ylab = 'Count'
        ,cex.lab = 1.5)    #make the bar plot

#@@@@@@@@@@@@@@@@@@@@@@@@@@@
#Next a histogram of salary:
#@@@@@@@@@@@@@@@@@@@@@@@@@@@
hist(employee_data$salary
     ,breaks = 10
     ,col = 'lightskyblue'
     ,border = NA
     ,main = 'Histogram of Salary'
     ,cex.main = 2
     ,xlab = 'Salary ($)'
     ,ylab = 'Count'
     ,cex.lab = 1.5)    #make the histogram

#@@@@@@@@@@@@@@@@@@@@@@@@@@@
#Next a density of salary:
#@@@@@@@@@@@@@@@@@@@@@@@@@@@
dens = density(employee_data$salary)    #compute the density smoother -- we'll use this for all the graphs
plot(dens
     ,main = 'Salary Distribution'
     ,cex.main = 2
     ,xlab = 'Salary ($)'
     ,ylab = 'Density'
     ,cex.lab = 1.5
     )    #plot a simple density

plot(''
     ,xlim = c(min(dens$x),max(dens$x))
     ,ylim = c(0,max(dens$y))
     ,axes = FALSE
     ,main = 'Salary Distribution'
     ,cex.main = 2
     ,xlab = 'Salary ($)'
     ,ylab = 'Density'
     ,cex.lab = 1.5
     )    #make an empty plot

polygon(x = c(dens$x,rev(dens$x))
        ,y = c(rep(0,length(dens$x)),rev(dens$y))
        ,border = NA
        ,col = 'lightskyblue')    #use polygon to draw the density shape

lines(dens$x,dens$y,col = 'blue')    #add a line to make the edge pop

axis(1)    #add the x axis
axis(2)    #add the y axis

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#Finally, a scatter plot of age vs salary
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
plot(employee_data$age,employee_data$salary
    ,xlim = c(0,100)
    ,ylim = c(0,6000)
    ,axes = FALSE
    ,main = 'Older Workers\nNeed Not Earn More'
    ,cex.main = 2
    ,xlab = 'Age (years)'
    ,ylab = 'Salary ($)'
    ,cex.lab = 1.5
    ,pch = 18
    ,col = 'lightskyblue')    #make the scatterplot

axis(1)    #add the x axis
axis(2)    #add the y axis


