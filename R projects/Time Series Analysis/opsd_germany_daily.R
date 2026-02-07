setwd("D:\\R projects\\Time Series Analysis")

dataSet <- read.csv("opsd_germany_daily.csv")
dataSet

#Looking at part of the dataSet
head(dataSet)

tail(dataSet)

#Previrew the data in tabular format
View(dataSet)

#to find the dimentions of the dataset
dim(dataSet)

#check datatype of each column
str(dataSet)

head(dataSet$Date)

#look for row names(indexes)
row.names(dataSet)

#summary of the dataSet
summary(dataSet)

#without parsing data column
dataSet2 <- read.csv("opsd_germany_daily.csv", header = TRUE)
dataSet2

#look at data column
str(dataSet2$Date)

#convert into date format
x <- as.Date(dataSet2$Date)
head(x)
class(x)
str(x)

#create year, month, day columns
year <- as.numeric(format(x, '%Y'))
head(year)

month <- as.numeric(format(x, '%m'))
head(month)

day <- as.numeric(format(x, '%d'))
head(day)

head(dataSet2)

#add columns for the dataFrame

dataSet2 <- cbind(dataSet2, year, month, day)
head(dataSet2)

dataSet2[1:3,]

head(sample(dataSet2,8))

#use a plot for the visualization
plot(dataSet2$year, dataSet2$Consumption, xlab = "year", ylab = "Consumption", type = "l", col= "blue")

#visualization option 2
plot(dataSet2$year, dataSet2$Consumption, type="l", xlab = "Year", ylab = "Consumption", lty=1, ylim = c(800,1700), xlim = c(2006, 2018))

#better option (option 3)
par(mfrow = c(1,1))

plot(dataSet2[,2])

#option 4
plot(dataSet2[,2], xlab = "Year", ylab = "Consumption", col= "blue", type = "l", lwd = 2)

#using ggplot
library(ggplot2)

ggplot()