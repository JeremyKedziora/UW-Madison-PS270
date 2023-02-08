#let's build a six sided dice
outcomes = c(1,2,3,4,5,6)    #set up the outcomes
unfair_dice_probs = c(0.25,0.1,0.5,0.05,0.05,0.05)    #create unfair probabilities
sample(x = outcomes,size = 20,replace = TRUE)    #roll the fair dice 20 times
sample(x = outcomes,size = 20,replace = TRUE,prob = dice_probs)    #roll the unfair dice 20 times

#create groups
data = paste('Voter',seq(1,100),sep='_')    #create some data -- 100 voter names
voters_scrambled = sample(x = data,size = length(data),replace = FALSE)    #permute the list of voters
voters_scrambled[1:50]    #take first 50 voters, e.g. for the treatment group 
voters_scrambled[6:37]    #take another group of voters
voters_scrambled[c(2,5)]    #take the second and fifth voters





