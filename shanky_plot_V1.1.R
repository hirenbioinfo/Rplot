################################################################################
## Project : NDM-ENT: Shanky plot
## Date: 12th July, 2021
## Written by : Dr. Hiren Ghosh, University medical center Freiburg, Germany
## hiren.ghosh@gmail.com
## more information are bellow:
########################### load library #######################################
library(highcharter)
library(htmlwidgets)
library(dplyr)
set.seed(111)
##########################generate a test data set##############################
#to <- sample(x=c)
t0 <- sample(x=c("HospA","HospB","HospC"),size = 100, replace = TRUE)
t1 <- sample(x=c("Ecoli","KPN","Acb","Psa"),size = 100, replace = TRUE)
t2 <- sample(x=c("IncFIA","IncZ","IncA","IncB","Incx","IncFIB"),size = 100, replace = TRUE)
t3 <- sample(x=c("NDM1","NDM2", "NDM3", "NDM4"),size = 10, replace = TRUE)
d<- data.frame(cbind(t0,t1,t2,t3))
names(d) <- c('Hospital','Bug','outcome', 'resitance')
head(d)
#########################plot a shanky plot#####################################
hchart(data_to_sankey(d), "sankey", name = "Patient Outcomes")%>%
  hc_plotOptions(series = list(dataLabels = list( style = list(fontSize = "10px")))) 

################################################################################
