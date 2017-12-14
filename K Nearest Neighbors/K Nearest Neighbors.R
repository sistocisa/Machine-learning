library(ISLR)
str(Caravan)
Caravan
any(is.na(Caravan))

var(Caravan[,1])

purchase <- Caravan[,86]
standardized.Caravan <- scale(Caravan[,-86])
standardized.Caravan

test.index <- 1:1000
test.data <- standardized.Caravan[test.index,]
test.purchase <- purchase[test.index]

train.data <- standardized.Caravan[-test.index,]
train.purchase <- purchase[-test.index]

library(class)
set.seed(101)
predicted.purchase <- knn(train.data,test.data,train.purchase,k=1)
head(predicted.purchase)

mean(test.purchase != predicted.purchase)

predicted.purchase <- knn(train.data,test.data,train.purchase,k=3)
mean(test.purchase != predicted.purchase)

predicted.purchase <- knn(train.data,test.data,train.purchase,k=5)
mean(test.purchase != predicted.purchase)

predicted.purchase = NULL
error.rate = NULL

for(i in 1:20){
  set.seed(101)
  predicted.purchase = knn(train.data,test.data,train.purchase,
                           k=i)
  error.rate[i] = mean(test.purchase != predicted.purchase)
}

print(error.rate)

library(ggplot2)
  k.values <- 1:20
  error.df <- data.frame(error.rate,k.values)
  error.df

  ggplot(error.df,aes(x=k.values,y=error.rate)) + 
    geom_point()+ geom_line(lty="dotted",color='red')
  
  