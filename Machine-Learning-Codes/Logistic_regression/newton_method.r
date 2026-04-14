#http://openclassroom.stanford.edu/MainFolder/DocumentPage.php?course=MachineLearning&doc=exercises/ex4/ex4.html
library(numDeriv)

x = read.csv("ex4x.dat",sep= "\t")
y = read.csv("ex4y.dat",sep= "\t")
x0 = rep(1,nrow(x))
x = as.data.frame(cbind(x0,x))

pos = x[(which(y==1)),]
neg = x[(which(y==0)),]

#plot(pos[,2],pos[,3],pch = "+",xlab = "Exam 1 score",ylab = "Exam 2 score")
#par(new = T)
#plot(neg[,2],neg[,3],pch = "o",xlab = "",ylab = "",axes = F)

theta0 = rep(0,ncol(x))
iter = h =  0
err = 1

while(err > 1.0e-2)
{
	for(i in 1:nrow(x))
	{
		h[i] = 1 / (1 + exp(sum(-(theta0) * x[i,])))
	}
	g = (t(as.matrix(x)) %*% (as.matrix(h - y[,1])))/nrow(x)
	#cat("grad",g,"\n")
	hess = (t(as.matrix(x)) %*% diag(h) %*% diag(1 - h)  %*% as.matrix(x)) / nrow(x)
	#print(hess)
	theta1 = theta0 - (solve(hess) %*% g) 
	iter = iter + 1
	print(iter)
	#cat("theta0",theta0,"\n")
	#cat("theta1",theta1,"\n")
	err = abs(sum(theta0) - sum(theta1))
	theta0 = theta1
}
print(theta1)
