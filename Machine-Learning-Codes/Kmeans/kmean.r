#enter number of iterations while running kmean function
#set.seed(123456)
a = sample(3,150,replace = T)

iris = iris[1:4]

#species 1 -> setosa
#species 2 -> versicolor
#species 3 -> virginica

#CG function
cg <- function(cl)
{
	cg = c(mean(cl[,1]),mean(cl[,2]),mean(cl[,3]),mean(cl[,4]))
}

#distance calculation function
distance <- function(cg,cl)
{
	d = cg-t(cl)
	d = t(d)
	dis = sqrt((d[,1])^2 + (d[,3])^2 + (d[,3])^2 + (d[,4])^2)
}

#main function
kmean <- function()   
{
	D_s = 0
	#D_cg = c(0,0,0,0)
	iter = 0
	
		while(T)
		{
#clustering
			cl1 = iris[which(a==1),]
			cl2 = iris[which(a==2),]
			cl3 = iris[which(a==3),]
#CG calculation
			cg1 = cg(cl1)
			cg2 = cg(cl2)
			cg3 = cg(cl3)
#distance calculation
			d11 = distance(cg1,cl1)
			d12 = distance(cg2,cl1)
			d13 = distance(cg3,cl1)
			d1 = cbind(d11,d12,d13)
			D1= sum(d11)		
		
			d21 = distance(cg1,cl2)
			d22 = distance(cg2,cl2)
			d23 = distance(cg3,cl2)
			d2 = cbind(d21,d22,d23)
			D2= sum(d22)		
		
			d31 = distance(cg1,cl3)
			d32 = distance(cg2,cl3)
			d33 = distance(cg3,cl3)
			d3 = cbind(d31,d32,d33)
			D3 = sum(d33)		
			d = rbind(d1,d2,d3)
		
#for stopping criteria
			#cg = cg1 + cg2 + cg3
			D = D1 + D2 + D3
		
			if (abs(D_s-D) < 0.01)
				break
			else
			{
				for(i in seq(1,150))
				{
					a[i] = which(d[i,] == min(d[i,]))
				}
			}
			#D_cg = cg
			D_s = D
			iter = iter + 1
			#print(a)
			#print(iter)
		}
		#n = n + 1000
		print(D)
	species = a
	data = iris[with(iris,order(a)),]
	data= cbind(data,species)
#new iris data 	
	print(data)
#number of elements
	print(nrow(iris[which(a==1),]))
	print(nrow(iris[which(a==2),]))
	print(nrow(iris[which(a==3),]))
#number of iterations
	print(iter)
#computing accuracy
		a = as.numeric(rownames(cl1))
		b = as.numeric(rownames(cl2))
		c = as.numeric(rownames(cl3))

		d = c(mean(a), mean(b), mean(c))
		q1 = which(d<50)
		q2 = which(d>50 & d<100)
		q3 = which(d>100)
#misplace elements in 2nd cluster
		if(q2 == 1)
		X = length(which(a > 100))
		if(q2 == 2)
		X = length(which(b > 100))
		if(q2 == 3)
		X = length(which(c > 100))
#misplace elements in 3rd cluster
		if(q3 == 1)
		Y = length(which(a < 100))
		if(q3 == 2)
		Y = length(which(b < 100))
		if(q3 == 3)
		Y = length(which(c < 100))
		
		acc = (150 - (X+Y))/ 1.50
		print(acc)
#k-means function from R		
	kmeans(iris[1:4],3)
}
