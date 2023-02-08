#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#Causal Inference
#Jeremy Kedziora
#28 September 2022
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
rm(list = ls())

#@@@@@@@@@@@@@@@@@@@@
#let's make some data
#@@@@@@@@@@@@@@@@@@@@
voters = paste('voter',seq(1,5000),sep = '_')
treatment = sample(c(0,1),length(voters),replace = TRUE)
donations = rep(0,length(voters))
for(i in 1:length(donations)){
  if(treatment[i] == 1){
    donations[i] = max(rnorm(1, mean = 1000, sd = 1000),0)
  }else{
    donations[i] = max(rnorm(1, mean = 0, sd = 1000),0)
  }
}
data = data.frame(voters,treatment,donations)

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#What is the average causal effect?
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
head(data)
visit_group = subset(x = data,data$treatment == 1)
no_visit_group = subset(x = data,data$treatment == 0)
average_causal_effect = mean(visit_group$donation) - mean(no_visit_group$donation)





