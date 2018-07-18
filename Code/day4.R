require(LiblineaR)
require(stats)
library(dplyr)
set.seed(12345)
X1 <- runif(10, 0, 10)
X2 <- runif(10, 0, 10)
Y <- c(rep(0,5),rep(1,5))

dat <- as.data.frame(matrix(c(X1,X2,Y),10,3))
colnames(dat) <- c("X1","X2","Y")

##Train
model <- glm(Y ~., family = binomial(link = 'logit'), data=dat)
summary(model)

##Predict

##TODO: find better example