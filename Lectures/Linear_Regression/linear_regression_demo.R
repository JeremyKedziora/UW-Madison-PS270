#@@@@@@@@@@@@@@@@@@@@@@
#Linear regression demo
#Jeremy Kedziora
#30 Oct 2022
#@@@@@@@@@@@@@@@@@@@@@@
rm(list = ls())

data = read.csv('/Users/jeremykedziora/Documents/UW Madison/Political Science/PS_270/Lectures/Linear_Regression/acs12.csv')
data = data[which(is.na(data$income) == FALSE),]
data = subset(data,data$employment == 'employed')

model = lm(income ~ age, data = data)    #simple regression
model = lm(income ~ age - 1, data = data)    #no constant
model = lm(income ~ age + hrs_work + gender + edu, data = data)    #multiple regression
summary(model)    #print the results

names(model)    #see all the stuff in the regression object
model$coefficients    #pull out the coefficients






mod = lm(income ~ age,data=data)

mod = lm(income ~ age + hrs_work + gender + time_to_work + edu,data=data)


names(mod)
mod$effects
