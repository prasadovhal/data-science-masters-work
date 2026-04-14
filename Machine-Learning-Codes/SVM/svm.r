library(e1071)

x <- iris[,-5]
y <- iris[,5]															#class of data stored in y
accuracy = 0
kernal = c("linear","polynomial","radial","sigmoid")

for(k in 1:length(kernal))
{	
	model <- svm(y~.,data = x,kernel = kernal[k])					#SVM model
	#print(model)
	#print(summary(model))

	#pred <- predict(model,x)
	#pred <- predict(model,x,decision.values = T)
	#model <-- created model, x <-- test set
	pred <- fitted(model,x)												#predict examples in testset with created model

	attr(pred,"decision.values")

	conf_mat <- table(pred,y)											#confusion matrix

	accuracy[k] <- sum(diag(conf_mat)) * 100 / nrow(x) 					#accuracy
	#print(accuracy)
}
accuracy = data.frame(accuracy)											#printing table of different kernal-functions
rownames(accuracy) = NULL
accuracy = accuracy[1:4,]
df = data.frame(kernal,accuracy)
print(df)

#plotting
#plot(cmdscale(dist(iris[,-5])),col=as.integer(iris[,5]),pch=c("o","+")[1:150 %in% model$index + 1])
#black <-- setosa , red <-- versicolor , virginica <-- green

#one line code
#sum(diag(table(predict(svm(Species~.,data=iris,kernel="linear"),iris[,-5]),iris[,5]))) / nrow(iris)
