library(randomForest)	

data = read.csv("breast_cancer.csv")[,-2]
col2 = read.csv("breast_cancer.csv")[,2]
data = cbind(data,col2)[,-1]

fold = 10

for(i in 1:25)			
{
	shuf = sample(1:fold,nrow(data),replace=T)
}

MCC =  accuracy = 0

for(j in 1:fold)
{
	test = data[which(shuf == j),]
	train = data[-which(shuf == j),]
	level = levels(test[,ncol(test)])
	
	data.rf = randomForest(col2~., data = train ,ntree = 1,mtry = 1,proximity = T)
	confusion_mat_train = table(predict(data.rf), train[,ncol(train)])

	data.Pred = predict(data.rf, newdata = test)
	confusion_mat_test = table(data.Pred, test[,ncol(test)])
	#print(confusion_mat_test)
	TP = confusion_mat_test[1,1]
	TN = confusion_mat_test[2,2]
	FP = confusion_mat_test[2,1]
	FN = confusion_mat_test[1,2]

	MCC[j]= ((TP * TN) - (FP * FN)) / sqrt((TP + FP) * (TP + FN) * (TN + FP) * (TN + FN))
	accuracy[j] = (TP + TN) * 100 / nrow(test)
}
print("MCC")
print(MCC)
print("accuracy")
print(accuracy)
