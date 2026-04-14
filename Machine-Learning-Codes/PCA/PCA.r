library(e1071)
library(randomForest)

data = read.csv("UCI.dat",sep = " ")[,-20]
bus = data[which(data[,ncol(data)]== "bus"),]
saab = data[which(data[,ncol(data)]== "saab"),]
data = rbind.data.frame(bus,saab)

y = data[,ncol(data)]
y = droplevels(y)
data = data[,-ncol(data)]

data = scale(data)
X_bar = colMeans(data)
scale_data = data

for (i in 1:nrow(data))
{
	scale_data[i,] = (data[i,] - X_bar)
}

A = t(as.matrix(scale_data)) %*% (as.matrix(scale_data))
eig = eigen(A)
eigen_vals = eig$values
P = (eig$vectors)

#pca = prcomp(scale_data)
#P_prcomp = pca$rotation
Dig = (P %*% A %*% t(P)) / (nrow(data) - 1)

cumu = 0
for(i in 1:dim(P)[1])
{
	cumu[i] = sum(eigen_vals[1:i]) / sum(eigen_vals)
}

max_96 = length(which(cumu < 0.96))
dim_red = P[,1:max_96]

new = as.data.frame((as.matrix(scale_data)) %*% (dim_red))

model = svm(y~.,data = new, kernel = "radial")

pred_pca = predict(model,newset = new)
pred_non_pca = predict(model,newset = scale_data)

accuracy_pca = sum(pred_pca == y) / nrow(new)
accuracy_non_pca = sum(pred_non_pca == y) / nrow(scale_data)
print(accuracy_pca)
print(accuracy_non_pca)
#print(accuracy_rf)
