library(plyr)
library(tibble)
data = iris

setdiffDF <- function(A, B)
{ 
     f <- function(A, B) 
         A[!duplicated(rbind(B, A))[nrow(B) + 1:nrow(A)], ] 
     df1 <- f(A, B) 
     df2 <- f(B, A) 
     rbind(df1, df2) 
}

#main function
kfold <- function(fold)
{	
	#random assignment of elements into 5 folds
	shuf = sample(fold,nrow(data),replace = T)
	zz = seq(1,round(sqrt(nrow(data))),by=2)
	
	total_acc = 0
	#iterartive loop for considering nearest  neighbours start from 1 to 11 (according to condtion, only odd numbers )
	for(y in seq(1,length(zz)))
	{
		acc = 0
		#interative loop for changing number of testset 
		for(x in 1:fold)
		{
			testset = data[which(shuf == x),-ncol(data)]
			test = data[which(shuf == x),]
			sampl = setdiffDF(data[,-ncol(data)],testset)
			speciesD = setdiffDF(data,test)
			
			
			max_name = 0
			#calculating distances of each point in testset with sample set
			for(i in 1:nrow(testset))
			{ 
				d = 0
				for(j in 1:nrow(sampl))
					{
					 d[j] = (sqrt(sum((testset[i,] - sampl[j,])^2)))
					}
			#sorting distances in ascending order
			sorted_d = sort(d) 
			#extracting minimum values 
			  	min_val = 0
				for(k in 1:zz[y])
				{
				 min_val[k] = sorted_d[k]
				}
			  #finding index of minimum distances
			  min_ind = 0
			  
			  for(k in 1:zz[y])
				{
				 min_ind[k] = which(min_val[k] == d)
				}
				#finding class of minimum distance
				spc = speciesD[,ncol(speciesD)][min_ind]
				tp = deframe(count(spc))
				ktp = which(tp==max(tp))
				lev = levels(iris[,ncol(iris)])
				summ = 0
				if(length(ktp) > 1)
				{
					for(i in 0:length(ktp))
					{
						summ[i] = mean(d[which(names(tp)==lev[i+1])])
					}
					max_name[i] = names(tp)[which.min(summ)]
				}
				else
					{
					max_name[i] = names(tp)[which.max(tp)]
					}
			  }
			#calculation of accuracy
			f = cbind(test,max_name)
			fT= sum(f$Species == f$max_name)
			acc[x] = (fT*100)/nrow(testset)
			mean_acc = mean(acc)
		}
		#mean accuracy for each considering odd numbers of neighbours from 1 to 11 (only odd numbers)
		total_acc[y] = mean_acc
	}
		cat("\naccuracy vector = \n",total_acc,"\n")
		#maximum acuracy
		cat("\nmaximum acuracy = \n",max(total_acc),"\n")
}
