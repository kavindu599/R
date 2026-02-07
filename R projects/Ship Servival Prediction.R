#Loding Packeges

install.packages("FSelector")
install.packages("rpart")
install.packages("caret")
install.packages("dplyr")
install.packages("rpart.plot")
install.packages("xlsx")
install.packages("data.tree")
install.packages("caTools")

#Get libraries

library(FSelector)
library(rpart)
library(caret)
library(rpart.plot)
library(dplyr)
library(xlsx)
library(data.tree)
library(caTools)
library(ElemStatLearn)

#Loading the Excel file after setting up the working directory
setwd("D:\\R projects")
add <- "Titanic-Dataset.csv"
df <- read.csv("Titanic-Dataset.csv")
df

#Selecting only meaningfull columns for the prediction
df <- select(df, Survived, Pclass, Sex, Age)
df <- mutate(df, Survived = factor(Survived),Pclass = as.numeric(Pclass), Age = as.numeric(Age))

#Splitting into training and testing datasets

set.seed(123)
sample <- sample.split(df$Survived, SplitRatio = 0.70)
train <- subset(df, sample == TRUE)
test <- subset(df, sample == FALSE)

#Training the decision tree classifier
tree <- rpart(Survived ~., data = train)

#Predictions by testing data
tree.Survived.prediction <- predict(tree, test, type='class')

#evaluating the model using a confusion matrix
ConfusionMatrix(tree.Survived.prediction, test$Survived)

#visualizing the decision tree
prp(tree)

#visualizing the 2D decision boundary


