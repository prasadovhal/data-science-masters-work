library(randomForest)	
library(caret)

data = read.csv("breast_cancer.csv")[,-2]
col2 = read.csv("breast_cancer.csv")[,2]
data = cbind(data,col2)[,-1]

for(i in 1:25)
{
	shuf = sample(2,nrow(data),replace=T)
}

data.rf = randomForest(col2~., data = data ,ntree = 200,proximity = T)
table(predict(data.rf), data[,ncol(data)])

Importance = as.data.frame(importance(data.rf))

ordered_data = data_new[,order(Importance,decreasing = T)]
ordered_data = cbind(ordered_data,col2)

fold = 10

for(i in 1:25)			
{
	shuf = sample(fold,nrow(ordered_data),replace = T)
}

work_data = ordered_data

while(T)
{
	MCC =  accuracy = 0

	for(j in 1:fold)
	{
		test = work_data[which(shuf == j),]
		train = work_data[-which(shuf == j),]
		y = train[,ncol(train)]
	
		data.rf = randomForest(y~., data = train ,ntree = 1,mtry = 1,proximity = T)
		data.Pred = predict(data.rf, newdata = test)
		confusion_mat_test = table(data.Pred, test[,ncol(test)])

		accuracy[j] = sum(diag(confusion_mat_test)) * 100 / nrow(test)
	}
	print("accuracy")
	print(accuracy)
	work_data = work_data[,-(1:2)]
	if(ncol(work_data) <= 2)
		break
}
