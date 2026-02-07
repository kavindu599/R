library(rpart)
library(rpart.plot)

data(iris)
str(iris)
head(iris)

set.seed(9850)
g <- runif(nrow(iris))
iris_ran <- iris[order(g),]
head(iris_ran)


#building the model

model <- rpart(Species ~.,data= iris_ran[1:100,], method= 'class')
model

#visualize the model
rpart.plot(model, type = 4, fallen.leaves = T, extra = 104)

#predictions

model_predict <- predict(model, iris_ran[101:150,],type = 'class')
model_predict

#evalute using confusion matrix
install.packages('caret')
install.packages('e1071')


library('caret')
library('e1071')

confusionMatrix(iris_ran[101:150,5], reference = model_predict)
