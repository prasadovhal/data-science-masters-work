library(plyr)
library(tibble)
library(corpcor)

data = read.csv("kc_house_data.csv")[,-3]
price = read.csv("kc_house_data.csv")[,3]
data = cbind(data,price)
del_data = c(1,2,7,8,9,10,14,15,16,17,18)
data = data[,-del_data]

data[,7][data[,7] == 0] <- mean(data[,7])
for(i in 1:ncol(data))
{
data[,i] = as.numeric(data[,i])
data[,i][data[,i] == ""] <- names(which.max(deframe(count(data[,i]))))	 	
data[,i][(which(is.na(data[,i])))] <- max(data[,i] , na.rm=T)
data[,i] = as.numeric(data[,i])							
}

for(i in 1:ncol(data))
{
	data[,i] = abs((data[,i] - mean(data[,i])) / (max(data[,i] - min(data[,i]))))
}

hx <- function(t,x)
{
	h = 0
	for(j in 1:nrow(x))
	{
		hi = 0
		for(i in 1:ncol(x))
		{
			hi[i] = (t[i] * x[j,i])
		}
		h[j] = sum(hi)
	}
	h = h
}

#cost function
j <- function(t,x,y)
{
	J = sum((hx(t,x) - y)^2) / (2 * nrow(x))
}

#a = 0.01
grad <- function(a)											
{
	i = t0 = t1 = t2 = t3 = t4 = t5 = t6 = t7 = t8 = t9 = 0	
	t = c(t0,t1,t2,t3,t4,t5,t6,t7,t8,t9)										 
	x = data[,-ncol(data)]
	x0 = rep(1,nrow(x))
	x = cbind(x0,x)
	y =	data[,ncol(data)]													
	m = nrow(x)
	j0 = j(t,x,y) 
	
	while(T)												
	{
		i = i + 1
		tmp0 = t0 - (a/m) * (sum((hx(t,x) - y) * x[,1]))		
		tmp1 = t1 - (a/m) * (sum((hx(t,x) - y) * x[,2]))	
		tmp2 = t2 - (a/m) * (sum((hx(t,x) - y) * x[,3]))	
		tmp3 = t3 - (a/m) * (sum((hx(t,x) - y) * x[,4]))	
		tmp4 = t4 - (a/m) * (sum((hx(t,x) - y) * x[,5]))	
		tmp5 = t5 - (a/m) * (sum((hx(t,x) - y) * x[,6]))	
		tmp6 = t6 - (a/m) * (sum((hx(t,x) - y) * x[,7]))	
		tmp7 = t7 - (a/m) * (sum((hx(t,x) - y) * x[,8]))	
		tmp8 = t8 - (a/m) * (sum((hx(t,x) - y) * x[,9]))	
		tmp9 = t9 - (a/m) * (sum((hx(t,x) - y) * x[,10]))
		
		t0 = tmp0 ; t1 = tmp1 ; t2 = tmp2 ; t3 = tmp3 ; t4 = tmp4 ; t5 = tmp5 ; t6 = tmp6 ; t7 = tmp7 ; t8 = tmp8 ; t9 = tmp9
		t = c(t0,t1,t2,t3,t4,t5,t6,t7,t8,t9)
		
		j1 = j(t,x,y)
		err = abs(j0 - j1)									
		print(err)
		if(err < 1.0e-4)									
			break	
		else
			j0 = j1
	}
	print(t)
}

normal <- function()											
{
	x = data[,-ncol(data)]
	x0 = rep(1,nrow(x))
	x = as.matrix(cbind(x0,x))
	y =	as.matrix(data[,ncol(data)])													
	t = pseudoinverse(x) %*%  y
	print(t)														
}

