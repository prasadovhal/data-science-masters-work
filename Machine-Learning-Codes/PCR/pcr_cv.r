library(randomForest)
library(Metrics)
#install.packages("RecordLinkage")
data = read.csv("Bodyfat.csv")[,-(1:2)]
y = read.csv("Bodyfat.csv")[,2]
#random forest for regression
rf_model = randomForest(y~.,data = data,ntree = 2,mtry = 1,proximity = T)
pred = predict(rf_model,data)

#mse
mse = (rmse(y,pred))^2
print(mse)

#r-square
y_bar = mean(y)
SSe_tot = sum((y - y_bar)^2)
SSe_res = sum((y - pred)^2)
r_squared = 1 - (SSe_res/SSe_tot)
print(r_squared)

#5 fold cv for mse and r-square

fold = 5
for(i in 1:25)			
{
	shuf = sample(1:fold,nrow(data),replace = T)
}

mse = r_square = 0
for(j in 1:fold)
{
	test = data[which(shuf == j),]
	y_test = y[which(shuf == j)]
	train = data[-which(shuf == j),]
	y_train = y[-which(shuf == j)]
	
	model = randomForest(y_train~.,data = train , ntree = 2 ,proximity = T)
	test_pred = predict(model,test)

	#MSE ->
	mse[j] = (rmse(y_test,test_pred))^2

	#R-squared ->
	ybar = mean(y_train)
	SSe_total = sum((y_test - ybar)^2)
	SSe_rest = sum((y_test - test_pred)^2)
	r_square[j] = 1-(SSe_rest/SSe_total)
}

print(mse)
print(r_square)
