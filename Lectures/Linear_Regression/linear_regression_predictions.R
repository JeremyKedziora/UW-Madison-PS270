#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#Demo r code to rename column names and generate regression predictions
#Jeremy Kedziora
#15 Nov 2022
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
rm(list = ls())

#generate faux data
n = 100    #the number of observations
x1 = rnorm(n)    #create the first independent variable using the normal distribution
x2 = rnorm(n)    #create the second independent variable using the normal distribution
b0 = 1    #set the intercept
b1 = -2    #set the effect of the first independent variable
b2 = 0.75    #set the effect of the second independent variable
e = rnorm(n)    #generate noise
y = b0 + b1*x1 + b2*x2 + e    #use the above to create the dependent variable
data = data.frame(y,x1,x2)    #collect the data together in a dataframe

colnames(data)[2] = 'x_1'    #rename the first independent variable from x1 to x_1

model = lm(y ~ x_1 + x2,data = data)    #run the linear regression
model = lm(y ~ I(x_1^2) + x2,data = data)    #run the linear regression -- use I() to force lm to do math, in this case squaring the variable

#generate predicted values from the regression
model$fitted.values    #way number 1 to generate predictions
predict(model,data)    #way number 2 to generate predictions
#two notes about using predict:
    #1) the column names of data must match the names of the variables in the lm command
    #2) the regression model object (called model above) will contain any transformations you do to the data like I(x_1^2) so you don't need to do them again when you pass data into predict

#what if you want to set data to particular values and then predict?
data$x2 = mean(data$x2)    #set x2 at its mean value
predict(model,data)    #and use the predict function











