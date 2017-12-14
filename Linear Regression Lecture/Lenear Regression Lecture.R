df <- read.csv('student-mat.csv')
df
df <- read.csv('student-mat.csv',sep=';')
summary(df)
head(df)

install.packages("ggthemes")
install.packages("dplyr")
library(ggplot2)
library(ggthemes)
library(dplyr)

is.data.frame(df)
is.list(df)

num.cols <- sapply(df, is.numeric)
num.cols
cor.data <- cor(df)
cor.data <- cor(df[,num.cols])
cor.data

install.packages("corrgram")
install.packages("corrplot")
library(corrplot)
library(corrgram)

corrplot(cor.data,method='color')
corrgram(df,order=TRUE, lower.panel=panel.shade,
         upper.panel=panel.pie, text.panel=panel.txt)

ggplot(df,aes(x=G3)) + geom_histogram(bins=20,
                      alpha=0.5,fill='blue') + theme_minimal()

library(caTools)
set.seed(101) 

sample <- sample.split(df$age, SplitRatio = 0.70) 

# Training Data
train = subset(df, sample == TRUE)

# Testing Data
test = subset(df, sample == FALSE)
model <- lm(G3 ~ .,train)
summary(model)
res <- as.data.frame(residuals(model))
head(res)

ggplot(res,aes(res)) +  geom_histogram(fill='blue',alpha=0.5)
plot(model)

G3.predictions <- predict(model,test)
G3.predictions
test$G3
results <- cbind(G3.predictions,test$G3) 
results
colnames(results) <- c('pred','real')
head(results)
results <- as.data.frame(results)
results

to_zero <- function(x){
  if  (x < 0){
    return(0)
  }else{
    return(x)
  }
}

results$pred <- sapply(results$pred,to_zero)
mse <- mean((results$real-results$pred)^2)
print(mse)
mse^0.5
SSE = sum((results$pred - results$real)^2)
SST = sum( (mean(df$G3) - results$real)^2)

R2 = 1 - SSE/SST
R2


