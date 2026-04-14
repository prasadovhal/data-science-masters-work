library(e1071)
library(Metrics)

data = read.csv("Bodyfat.csv")[,-(1:2)]
y = read.csv("Bodyfat.csv")[,2]

#data = scale(data)

X_bar = colMeans(data)
scale_data = data

for (i in 1:nrow(data))
{
	scale_data[i,] = (data[i,] - X_bar)
}

A = t(as.matrix(scale_data)) %*% (as.matrix(scale_data))
eigen = eigen(A)
eigen_vals = eigen$values
P = (eigen$vectors)

cumu = 0
for(i in 1:dim(P)[1])
{
	cumu[i] = sum(eigen_vals[1:i]) / sum(eigen_vals)
}

max_96 = length(which(cumu < 0.96))
dim_red = P[,1:max_96]

new = as.data.frame((as.matrix(scale_data)) %*% (dim_red))

#using linear regression

#reg_model = lm(y~.,data = new)
#reg_pred = predict(reg_model,data = data)

#MSE ->
#reg_mse = (rmse(y,reg_pred))^2

#R-squared ->
#r_square = summary(reg_model)$r.squared

#using SVM

svm_model = svm(y~.,data = new,type="nu-regression",kernel="radial")
svm_pred = predict(svm_model,data = new)

#MSE ->
svm_mse = (rmse(y,svm_pred))^2
print(svm_mse)

#R-squared ->
y_bar = mean(y)
SSe_tot = sum((y-y_bar)^2)
SSe_res = sum((y-svm_pred)^2)
r_squared = 1-(SSe_res/SSe_tot)
print(r_squared)

#CV for RMSE and r_squared

fold = 5
for(i in 1:25)			
{
	shuf = sample(1:fold,nrow(new),replace = T)
}
mse = r_square = 0
for(j in 1:fold)
{
	test = new[which(shuf == j),]
	y_test = y[which(shuf == j)]
	train = new[-which(shuf == j),]
	y_train = y[-which(shuf == j)]
	
	model = svm(y_train~.,data = train,type="nu-regression",kernel="radial")
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
