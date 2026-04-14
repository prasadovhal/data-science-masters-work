library(corpcor)

data = read.csv("Bodyfat.csv")[,-2]
bodyfat = read.csv("Bodyfat.csv")[,2]

data = cbind(data,bodyfat)[,-1]

normal <- function()											
{
	x = data[,-ncol(data)]
	x0 = rep(1,nrow(x))
	x = as.matrix(cbind(x0,x))
	y =	as.matrix(data[,ncol(data)])													
	t = pseudoinverse(x) %*%  y
	print(t)														
}

#values of thetas
#6.0974982
#3.6626401
#-21.6379900
#-3.3577382
#-9.4590603
#-1.3578699
#75.1406711
#-13.0128284
#9.4676038
#0.2460276
#2.5751314
#3.6683688
#6.2831463
#-9.0755790

