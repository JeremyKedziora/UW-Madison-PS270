rm(list = ls())

data = read.csv('/Users/jeremykedziora/Documents/UW Madison/Political Science/PS_270/Homework/HW9/marist.csv')
data = data[which(is.na(data$vote_choice) == FALSE),]
data$would_vote_biden = (data$vote_choice == 'Biden')*1
data$would_vote_trump = (data$vote_choice == 'Trump')*1



write.csv(data[,c(1,4,5,6)],'/Users/jeremykedziora/Documents/UW Madison/Political Science/PS_270/Homework/HW9/marist_cleaned.csv',row.names = FALSE)



n_trump = c()
n_biden = c()
n_sim = 1000
for(i in 1:n_sim){
  data_boot = data[sample(seq(1,nrow(data)),nrow(data),replace = TRUE),]
  n_biden = c(n_biden,mean(data_boot$would_vote_biden))
  n_trump = c(n_trump,mean(data_boot$would_vote_trump))
}
sort(n_biden)[c(25,975)]
sort(n_trump)[c(25,975)]





