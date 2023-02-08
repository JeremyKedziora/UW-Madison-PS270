#@@@@@@@@@@@@@@@@@@@@@@@@@@@
#Making fake regression data
#Jeremy Kedziora
#2 Nov 2022
#@@@@@@@@@@@@@@@@@@@@@@@@@@@
rm(list = ls())

n = 100    #the number of observations in our fake data
x1 = rnorm(n=n,mean=0,sd=1)    #fake independent variable
b0 = 2    #the value for the intercept
b1 = -1    #the effect of independent variable x1 on y
e = rnorm(n=n,mean=0,sd=1)    #the noise term -- sampled from the normal distribution
y = b0 + b1*x1 + e    #create the dependent variable
summary(lm(y ~ x1))   #run the linear regression -- should recover something close to b0 and b1 on lines 10 and 11


