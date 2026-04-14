library(randomForest)	
library(caret)

#input dataset
d = read.csv("leukemia_big.csv")
data = as.data.frame(t(d))
y = as.factor(as.numeric(data[,ncol(data)])-1)
data = data[,-ncol(data)]

data = cbind.data.frame(data,y)

#apply random Forest model
model_rf = randomForest(y~., data = data ,ntree = 10,mtry = 2,proximity = T)

pred = predict(model_rf,data)														#predict class of examples
conf_mat = table(pred,y)															#confusion matrix

#importance of features
Importance = as.data.frame(importance(data.rf))

#Importance is rbinded with dataframe and ordered according to it
data_new = data[,-ncol(data)]
df_binded = rbind(t(Importance),data_new)
ordered_data_binded = df[,order(Importance,decreasing = F)]

#Importance is not rbinded with dataframe but ordered according to it
ordered_data = data_new[,order(Importance,decreasing = T)]
ordered_data = cbind(ordered_data,y)

fold = 10																			#10 fold CV accuracy

#shuffle data
for(i in 1:25)			
{
	shuf = sample(1:fold,nrow(ordered_data),replace = T)
}

work_data = ordered_data

#remove feature one by one and find MCC at each iteration
while(T)
{
	MCC =  accuracy = 0

	for(j in 1:fold)
	{
		test = work_data[which(shuf == j),]											#divide given dataset into test and train
		train = work_data[-which(shuf == j),]
		y = train[,ncol(train)]
		level = levels(test[,ncol(test)])
	
		data.rf = randomForest(y~., data = train ,ntree = 1,mtry = 1,proximity = T)	#apply randomForest model 

		data.Pred = predict(data.rf, newdata = test)								#predict class
		confusion_mat_test = table(data.Pred, test[,ncol(test)])					#confusion matrix

		accuracy[j] = sum(diag(confusion_mat_test)) * 100 / nrow(test)				#calculate accuracy
		TP = confusion_mat_test[1,1]												#from confusion matrix TP,TN,FP,FN count is separted
		TN = confusion_mat_test[2,2]
		FP = confusion_mat_test[2,1]
		FN = confusion_mat_test[1,2]

		MCC[j]= ((TP * TN) - (FP * FN)) / sqrt((TP + FP) * (TP + FN) * (TN + FP) * (TN + FN))	#MCC is calculated 
	}
	print("accuracy")
	print(accuracy)
	print("MCC")
	print(MCC)
	
	work_data = work_data[,-(1:100)]											#less 100 important attributes are removed at each iteration
	if(ncol(work_data == 0))
		break
}
