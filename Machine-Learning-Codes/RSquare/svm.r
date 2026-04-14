library(e1071)
library(Metrics)

#input dataset
data = read.csv("Bodyfat.csv")[,-2]
bodyfat = read.csv("Bodyfat.csv")[,2]
data = cbind.data.frame(data,bodyfat)[,-1]

#SVM model
model <- svm(bodyfat~.,data = data,kernel = "radial")

#predict examples
pred <- predict(model,data[,-ncol(data)])

#root mean square error
rmse = rmse(bodyfat,pred)
print(rmse)

#R-squared
y_bar = mean(bodyfat)
SStot = sum((bodyfat - y_bar)^2)
SSres = sum((pred - bodyfat)^2)
r_square = 1 - (SSres / SStot)
print(r_square)	
