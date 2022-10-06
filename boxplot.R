################################################################################
## Project : NDM-ECL
## Date: 12th june, 2020
## Written by : Dr. Hiren Ghosh, University medical center Freiburg, Germany
## hiren.ghosh@gmail.com
## more information are bellow:
########################### load library #######################################

# boxplot
#Create data
names <- c(rep("A", 80) , rep("B", 50) , rep("C", 70))
value <- c( rnorm(80 , mean=10 , sd=9) , rnorm(50 , mean=2 , sd=15) , rnorm(70 , mean=30 , sd=10) )
data <- data.frame(names,value)

# Basic boxplot
boxplot(data$value ~ data$names , col=terrain.colors(4) )

# Add data points
mylevels <- levels(data$names)
levelProportions <- summary(data$names)/nrow(data)
for(i in 1:length(mylevels)){
  
  thislevel <- mylevels[i]
  thisvalues <- data[data$names==thislevel, "value"]
  
  # take the x-axis indices and add a jitter, proportional to the N in each level
  myjitter <- jitter(rep(i, length(thisvalues)), amount=levelProportions[i]/2)
  points(myjitter, thisvalues, pch=20, col=rgb(0,0,0,.9)) 
  
}

# Another way to draw similar plot
# install.packages("ggplot2")
library(ggplot2)

# Data
set.seed(8)
y <- rnorm(200)
group <- sample(LETTERS[1:3], size = 200,
                replace = TRUE)
df <- data.frame(y, group)

# Box plot by group with jitter
ggplot(df, aes(x = group, y = y, colour = group)) + 
  geom_boxplot(outlier.shape = NA) +
  geom_jitter()

# jitter with shape
# install.packages("ggplot2")
library(ggplot2)

# Data
set.seed(8)
y <- rnorm(200)
group <- sample(LETTERS[1:3],
                size = 200,
                replace = TRUE)
df <- data.frame(y, group)

# Box plot by group with jitter
ggplot(df, aes(x = group, y = y,
               colour = group,
               shape = group)) + 
  geom_boxplot(outlier.shape = NA) +
  geom_jitter()