library(Metrics)
library(randomForest)
#input dataset
data = read.csv("Bodyfat.csv")[,-2]
bodyfat = read.csv("Bodyfat.csv")[,2]
data = cbind.data.frame(data,bodyfat)[,-1]

#Random Forest Model
model_rf = randomForest(bodyfat~., data = data[,-ncol(data)] ,ntree = 10,mtry = round(sqrt(ncol(data))),proximity = T)

#predict examples
pred = predict(model_rf,data[,-ncol(data)])

#root mean square error
rmse = rmse(bodyfat,pred)
print(rmse)

#R-squared
y_bar = mean(bodyfat)
SStot = sum((bodyfat - y_bar)^2)
SSres = sum((pred - bodyfat)^2)
r_square = 1 - (SSres / SStot)
print(r_square)
