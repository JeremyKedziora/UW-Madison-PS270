rm(list = ls())
library(foreign)

filepath = '/Users/jeremykedziora/Documents/UW Madison/Political Science/PS_270/gerber_and_green_data.csv'
data = read.csv(filepath)

data = cbind(data$PERSONS,data$AGE,data$MAJORPTY,data$PHN.C,data$VOTED98)
colnames(data) = c('persons','age','major_party','contacted_by_phone','voted_last_election')
data = data.frame(data)

donation = c()
for(j in 1:nrow(data)){
  if(data$contacted_by_phone[j] == 1){
    donation = c(donation,round(min(max(0,rnorm(n=1,mean=500,sd=2000)),4000)))
  }else{
    donation = c(donation,round(min(max(0,rnorm(n=1,mean=0,sd=2000)),4000)))
  }
}
data$donation = donation

data = subset(data,major_party == 1)
data = data[,-3]

data_T = subset(data,contacted_by_phone == 1)
data_C = subset(data,contacted_by_phone == 0)

mean(data_T$donation) - mean(data_C$donation)
mean(data_T$voted_last_election) - mean(data_C$voted_last_election)

write.csv(data,'/Users/jeremykedziora/Documents/UW Madison/Political Science/PS_270/Homework/gerber_and_green_data.csv',row.names = FALSE)


