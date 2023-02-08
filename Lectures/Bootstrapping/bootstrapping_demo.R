#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#A bunch of bootstrapping examples
#Jeremy Kedziora
#20 Nov 2022
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
rm(list = ls())

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#EXAMPLE 1: median donation from those phoned
data = read.csv('/Users/jeremykedziora/Documents/UW Madison/Political Science/PS_270/Homework/HW2/gerber_and_green_data.csv')
n_bootstrap_sims = 1000    #set the number of bootstrap simulations
median_donation = rep(0,n_bootstrap_sims)    #set up a place to hold the results
for(i in 1:n_bootstrap_sims){    #loop over simulations
  which_rows = sample(x = seq(1,nrow(data)),size = nrow(data),replace = TRUE)    #sample from rows of data with replacement
  data_i = data[which_rows,]    #take those rows and make a new data set
  data_1 = subset(data_i,contacted_by_phone == 1)    #grab all observations who have been contacted by phone
  median_donation[i] = median(data_1$donation)    #compute the ACE
}
median_donation = sort(median_donation)    #sort from smallest to largest
confidence_interval = c(median_donation[25],median_donation[975])

plot(density(median_donation),axes = FALSE,xlab = 'Median Donation if pjhoned',main = '')
axis(1)
axis(2)

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#EXAMPLE 2: average casual effect of phoning on donations (see homework 2)
data = read.csv('/Users/jeremykedziora/Documents/UW Madison/Political Science/PS_270/Homework/HW2/gerber_and_green_data.csv')
n_bootstrap_sims = 1000    #set the number of bootstrap simulations
ACE = rep(0,n_bootstrap_sims)    #set up a place to hold the results
for(i in 1:n_bootstrap_sims){    #loop over simulations
  which_rows = sample(x = seq(1,nrow(data)),size = nrow(data),replace = TRUE)    #sample from rows of data with replacement
  data_i = data[which_rows,]    #take those rows and make a new data set
  data_1 = subset(data_i,contacted_by_phone == 1)    #grab all observations who have been contacted by phone
  data_0 = subset(data_i,contacted_by_phone == 0)    #grab all observations who have not been contacted by phone
  ACE[i] = mean(data_1$donation) - mean(data_0$donation)    #compute the ACE
}
ACE = sort(ACE)    #sort from smallest to largest
confidence_interval = c(ACE[25],ACE[975])

plot(density(ACE),axes = FALSE,xlab = 'Average Casual Effect',main = '')
axis(1)
axis(2)

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#EXAMPLE 3: p-values from the mayoral poll from homework 4 (sampled 30, observed 6 that said they would vote for the campaign)
mayoral_poll = c(1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
n_bootstrap_sims = 1000    #set the number of bootstrap simulations
poll_p_value = rep(0,n_bootstrap_sims)    #set up a place to hold the results
for(i in 1:n_bootstrap_sims){    #loop over simulations
  mayoral_poll_i = sample(x = mayoral_poll,size = 30,replace = TRUE)    #sample poll respondents with replacement
  number_of_supporters = sum(mayoral_poll_i)    #figure out how many campaign supporters we have
  poll_p_value[i] = pbinom(number_of_supporters,30,0.5)    #compute the p-value
}

poll_p_value = sort(poll_p_value)
confidence_interval = c(poll_p_value[25],poll_p_value[975])

plot(density(poll_p_value),axes = FALSE,xlab = 'p_value from poll',main = '')
axis(1)
axis(2)

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#EXAMPLE 4: regression coefficients -- the effect of percent of countries in alliances on number of countries at war
wars_data = read.csv('/Users/jeremykedziora/Documents/UW Madison/Political Science/PS_270/Homework/HW5/wars_data.csv')
n_bootstrap_sims = 1000    #set the number of bootstrap simulations
effect_of_percent = rep(0,n_bootstrap_sims)    #set up a place to hold the results
for(i in 1:n_bootstrap_sims){    #loop over simulations
  which_rows = sample(x = seq(1,nrow(wars_data)),size = nrow(wars_data),replace = TRUE)    #sample from rows of data with replacement
  wars_data_i = wars_data[which_rows,]
  model = lm(n_countries_at_war ~ percent,data = wars_data_i)
  effect_of_percent[i] = model$coefficients[2]
}

effect_of_percent = sort(effect_of_percent)
confidence_interval = c(effect_of_percent[25],effect_of_percent[975])

plot(density(effect_of_percent),axes = FALSE,xlab = 'effect of percent',main = '')
axis(1)
axis(2)

