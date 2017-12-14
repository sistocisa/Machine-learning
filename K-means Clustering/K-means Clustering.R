library(datasets)
head(iris)
iris

install.packages("ggplot2")
library(ggplot2)
ggplot(iris, aes(Petal.Length, Petal.Width, color = Species)) + geom_point()
ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) + geom_point()
help(kmeans)
?kmeans
irisCluster <- kmeans(iris[, 1:4], 3, nstart = 20)
str(irisCluster)
irisCluster

table(irisCluster$cluster, iris$Species)
table(irisCluster$cluster)

library(cluster)
clusplot(iris, irisCluster$cluster, color=TRUE, shade=TRUE, labels=0,lines=0, )
?clusplot


#ex clusplot
x <- rbind(cbind(rnorm(10,0,0.5), rnorm(10,0,0.5)),
           cbind(rnorm(15,5,0.5), rnorm(15,5,0.5)))
clusplot(pam(x, 2))


      