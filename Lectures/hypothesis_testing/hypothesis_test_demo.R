#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#An example of a hypothesis test
#Jeremy Kedziora
#18 Oct 2022
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
rm(list = ls())

n = 50
state_id = paste('state_',seq(1,n),sep='')
governors = c(rep('republican',28),rep('democratic',22))
governors = sample(governors,length(governors))
economic_growth = runif(n,-2,10)
data = data.frame(cbind(state_id,governors,economic_growth))
data$economic_growth = as.numeric(data$economic_growth)

#Let's do a difference of means test -- this test takes a variable from two samples (x and y) and does a hypothesis test
#to see if the mean of that variable is different across the samples!
R_gov = subset(data,data$governors == 'republican')
D_gov = subset(data,data$governors == 'democratic')

t.test(x = R_gov$economic_growth, y = D_gov$economic_growth, alternative = 'two.sided')


