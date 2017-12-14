library(rpart)
str(kyphosis)
kyphosis
head(kyphosis)


tree <- rpart(Kyphosis ~ . , method='class', data= kyphosis)
str(tree)
printcp(tree)
tree
plot(tree, uniform=TRUE, main="Main Title")
text(tree, use.n=TRUE, all=TRUE)

install.packages("ISLR")
library(ISLR)


install.packages("rpart.plot")
library(rpart.plot)
prp(tree)

install.packages("randomForest")
library(randomForest)

model <- randomForest(Kyphosis ~ .,   data=kyphosis)
print(model)
importance(model)
varImpPlot(model)
