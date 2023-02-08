#@@@@@@@@@@@@@
#For loop demo
#Jeremy Kedziora
#9 Nov 2022
#@@@@@@@@@@@@@
rm(list = ls())

data = rep(0,10)    #make some data, just a vector of 0s

sides = c(1,2,3,4,5,6)
bag_o_marbles = c(1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
n_sim = 1000
fractions = rep(0,n_sim)
for(j in 1:1000){    #loop over all entries in the data
  #data[row] = row + 5    #change each entry in the data to a number
  #print(sample(x = sides,6,replace = TRUE))
  fractions[j] = (mean(sample(x = bag_o_marbles,30,replace = TRUE)))
}
fractions = sort(fractions)
fractions[25]
fractions[975]


for(i in 4:10){    #loop over entries in the data beginning with 4
  data[i] = i    #change each entry to a number
}

data
