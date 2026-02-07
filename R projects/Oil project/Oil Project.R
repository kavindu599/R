 setwd("D:\\R projects\\Oil project")

#cluster Analysis
myData <- read.csv("crude-oil-prices.csv")
myData 

str(myData)
head(myData)
pairs(myData)

#Scatter Plot
plot(myData$Year, myData$Oil.price...Crude.prices.since.1861..current.US.., xlab = "year", ylab = "Prices", main = "Oil prices though the ages", col = "blue")

#Normalization
z <- myData[,-c(1,1)]
m <- apply(z, 2, mean)
s <- apply(z, 2,sd)
z <- scale(z,m,s)

#calculate the Euclidean Distance
distance <- dist(z)
distance

print(distance, digits = 3)

#Clustering Dendogram
hc.l <- hclust(distance)
plot(hc.l, labels = myData$Year, hang = -1)

#clustering Dendrogram(average)
hc.l <- hclust(distance, method = "average")
plot(hc.l, labels = myData$Year, hang= -1)

#clustering Membership

member1 <- cutree(hc.l, 3)
aggregate(z, list(member1), mean)

#actual values
aggregate(myData[, -c(1,1)], list(member1), mean)
