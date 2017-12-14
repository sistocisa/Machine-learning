library(ISLR)
head(iris)

install.packages("e1071")
library(e1071)

help(svm)

model <- svm(Species ~ ., data=iris)
summary(model)
head(model)

predicted.values <- predict(model,iris[1:4])
table(predicted.values,iris[,5])

tune.results <- tune(svm,train.x=iris[1:4],
                     train.y=iris[,5],kernel='radial',
                     ranges=list(cost=10^(-1:2), gamma=c(.5,1,2)))

summary(tune.results)

tuned.svm <- svm(Species ~ ., data=iris,
                 kernel="radial", cost=1, gamma=0.5)

summary(tuned.svm)
tuned.predicted.values <- predict(tuned.svm,iris[1:4])
table(tuned.predicted.values,iris[,5])
