library(dplyr)
library(xlsx)
# dat <- read.xlsx("Data/06-LinearDiscriminantAnalysis.xlsx", sheetIndex = 1, colIndex = c(1,2), rowIndex = c(4:46))
# LinearDiscriminantAnalysisExampleData <- dat
# save(LinearDiscriminantAnalysisExampleData, file = "data/LinearDiscriminantAnalysisExampleData.RData")

load("~/Documents/personal/100DaysOfML/Data/LinearDiscriminantAnalysisExampleData.RData")
dat <- LinearDiscriminantAnalysisExampleData
dat0 <- dat %>% filter(Y == 0)
dat1 <- dat %>% filter(Y == 1)

#calculate mean
M0 <- dat0 %>% select(X) %>% unlist() %>% mean()
M1 <- dat1 %>% select(X) %>% unlist() %>% mean()

#calculate probability
P0 <- nrow(dat0)/(nrow(dat0)+nrow(dat1))
P1 <- nrow(dat1)/(nrow(dat0)+nrow(dat1))

#calculate variance
V0 <- (dat0$X - M0)^2 %>% sum
V1 <- (dat1$X - M1)^2 %>% sum
V <- 1/(nrow(dat)-length(unique(dat$Y))) * sum(V0,V1)

#predictions
dat <- dat %>% mutate(D0 = ((X* M0/V) - ((M0^2)/(2*V)) + log2(P0)),
                      D1 = ((dat$X* M1/V) - ((M1^2)/(2*V)) + log2(P1))) %>%
  mutate(prediction = ifelse(D0 > D1, 0, 1))


####Caret package###
library(MASS)
dat <- LinearDiscriminantAnalysisExampleData

lda(Y~X, data=dat)


