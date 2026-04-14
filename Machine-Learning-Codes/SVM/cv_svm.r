print("to run program enter cv(number of folds)")
library(e1071)
#input data
data = iris
#data = read.csv("breast_cancer.csv")[,-2]
#col2 = read.csv("breast_cancer.csv")[,2]
#data = cbind(data,col2)[-1]

	
cv <- function(fold)
{
	for(j in 1:25)													#shuffling data
	{
		shuf = sample(fold,nrow(data),replace = T)
	}

	accu = 0														
	for(i in 1:fold)												#fold accuracy
	{
		testset = data[which(shuf == i),-ncol(data)]				#divide data randomly for testset
		trainset = data[-which(shuf == i),-ncol(data)]				#divide data randomly for trainset
	
		y = data[-which(shuf == i),ncol(data)]						#class of data stored in y
		model = svm(y~.,data = trainset , kernel = "linear")		#SVM model
		#print(summary(model))
	
		pred = fitted(model,testset)								#predict examples in testset with created model
		conf_mat = table(pred,y)									#confusion matrix
		#print(conf_mat)
	
		accuracy = sum(diag(conf_mat)) * 100 / nrow(trainset) 		#accuracy of the fold
		#print(accuracy)
		accu[i] = accuracy
	}
	cat("accuracy for",fold,"folds is\n",accu,"\n")					#final accuracy of different folds
}
