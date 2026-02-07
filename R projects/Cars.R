install.packages("caTools")

carSales <- mtcars
carSales

str(carSales)

summary(carSales)
cor(carSales)

plot(carSales$wt, carSales$mpg, xlab = "Weight of the Car", ylab="Miles per gallon for the Car", col= "blue")

cor(carSales$mpg, carSales$wt)

#splitting the data

library(caTools)
set.seed(100)

split <- sample(1:nrow(carSales),0.8*nrow(carSales))

#split for a train and test dataset
train <- subset(carSales, split= "TRUE")
test <- subset(carSales, split= "FALSE")

train
test

#Create the model
model <- lm(mpg ~ wt, data=train)
summary(model)

#trsting for prdiction
prediction <- predict(model, test)

plot(carSales$mpg, type="l", col="blue")
lines(carSales$wt, type="l", col="green")
plot(pred, type="l", col="red")

#finding the accuracy 
acc <- sqrt(mean(prediction-carSales$mpg)^2)
acc

install.packages("DMwR")


