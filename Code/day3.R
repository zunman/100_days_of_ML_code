##DATA
x <- c(1,2,4,3,5)
y <- c(1,3,3,2,5)
plot(x,y)


##Method1: Linear regression
mean(x) 
mean(y)

B1 <- sum((x-mean(x)) * (y-mean(y)))/sum((x-mean(x))^2)
B0 <- mean(y) - B1 * mean(x)
predicted.Y <- B0 +B1*x

plot(x,predicted.Y)

##Estimating error:
RMSE = sqrt(sum((predicted.Y-y)^2)/length(y))

##Method 2: Linear Regression (shortcut to calculate B1)
B1 = cor(x,y) * (sd(y)/sd(x))


##Experiment: Try linear regression from Caret package
require(stats)
lm(y~x)

