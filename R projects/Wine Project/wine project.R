setwd("D:\\R projects\\Wine Project")
getwd()

install.packages("randomForest")
library(randomForest)

data <- read.csv("winequality-red.csv")
data

head(data)

data$quality = as.factor(data$quality)

data_set_size = floor(nrow(data)*0.80)
index <- sample(1:nrow(data), size = data_set_size)
training <- data[index,]
testing <- data[-index,]

rf <- randomForest(quality ~., data = training, mtry = 4, ntree = 2001, importance =TRUE)
rf
plot(rf)

#prediction
result <- data.frame(testing$quality, predict(rf, testing[, 1:11], type = "response"))
result

plot(result)
