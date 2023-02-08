filepath <- "Documents/School/Teaching/PS 270 Fall 22/Section tutorials/Week 3/employee_data.csv"    #The location of the data on the computer.  You will need to edit this line to load the data.
employee_data <- read.csv(filepath)
tail(employee_data, n = 9)
mean(employee_data$salary)
plot(density(employee_data$salary))
sort(table(employee_data$groups), decreasing = T)
employee_data$overall_health <- (employee_data$healthy_eating + employee_data$active_lifestyle) / 2
a_b_data <- subset(employee_data, groups == "A" | groups == "B")
ab_data <- subset(employee_data, groups == "AB")
mean(a_b_data$salary) > mean(ab_data$salary)
barplot(table(employee_data$active_lifestyle))

