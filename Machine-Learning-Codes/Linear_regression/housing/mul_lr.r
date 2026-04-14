library(plyr)
library(tibble)
#input
data = read.csv("kc_house_data.csv")[1:500,-3]
price = read.csv("kc_house_data.csv")[1:500,3]
data = cbind(data,price)
del_data = c(1,2,7,8,9,10,14,15,16,17,18)
data = data[,-del_data]
#data cleaning
data[,7][data[,7] == 0] <- mean(data[,7])
for(i in 1:ncol(data))
{
data[,i] = as.numeric(data[,i])
data[,i][data[,i] == ""] <- names(which.max(deframe(count(data[,i]))))	 	
data[,i][(which(is.na(data[,i])))] <- max(data[,i] , na.rm=T)
data[,i] = as.numeric(data[,i])							
}
#feature scalings
for(i in 1:ncol(data))
{
	data[,i] = abs((data[,i] - mean(data[,i])) / (max(data[,i] - min(data[,i]))))
}
#hypothesis function
hx <- function(t,x)
{
	h = t0 + (t[1] * x[,1]) +( t[2] * x[,2]) + (t[3] * x[,3]) + (t[4] * x[,4]) + (t[5] * x[,5]) + (t[6] * x[,6]) + (t[7] * x[,7]) + (t[8] * x[,8]) + (t[9] * x[,8]) 
}

#cost function
j <- function(t,x,y)
{
	J = sum((hx(t,x) - y)^2) / (2 * nrow(x))
}
#learnng rate  a = 0.001
#main function
main <- function(a)											
{
	#initial guess
	i = t0 = t1 = t2 = t3 = t4 = t5 = t6 = t7 = t8 = t9 = 0											 
	t = c(t0,t1,t2,t3,t4,t5,t6,t7,t8,t9)
	x = data[,1:9]
	y =	data[,10]													
	m = nrow(x)
	j0 = j(t,x,y)
	
	while(T)												
	{
		i = i + 1
		tmp0 = t0 - (a/m) * (sum((hx((t,x) - y))))		
		tmp1 = t1 - (a/m) * (sum((hx((t,x) - y) * x[,1])))	
		tmp2 = t2 - (a/m) * (sum((hx((t,x) - y) * x[,2])))	
		tmp3 = t3 - (a/m) * (sum((hx((t,x) - y) * x[,3])))	
		tmp4 = t4 - (a/m) * (sum((hx((t,x) - y) * x[,4])))	
		tmp5 = t5 - (a/m) * (sum((hx((t,x) - y) * x[,5])))	
		tmp6 = t6 - (a/m) * (sum((hx((t,x) - y) * x[,6])))	
		tmp7 = t7 - (a/m) * (sum((hx((t,x) - y) * x[,7])))	
		tmp8 = t8 - (a/m) * (sum((hx((t,x) - y) * x[,8])))	
		tmp9 = t9 - (a/m) * (sum((hx((t,x) - y) * x[,9])))	
		
		t0 = tmp0 ; t1 = tmp1 ; t2 = tmp2 ; t3 = tmp3 ; t4 = tmp4 ; t5 = tmp5 ; t6 = tmp6 ; t7 = tmp7 ; t8 = tmp8 ; t9 = tmp9
		t = c(t0,t1,t2,t3,t4,t5,t6,t7,t8,t9)
		j1 = j(t,x,y)
		err = abs(j0 - j1)									
		j0 = j1
		print(err,t,i)
		if(err < 1.0e-10)									
			break	
	}
	print(t0,t1,t2,t3,t4,t5,t6,t7,t8,t9)																									
}
