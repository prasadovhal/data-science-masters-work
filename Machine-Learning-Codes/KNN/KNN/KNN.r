library(plyr)
library(tibble)
input = read.csv("data.csv")

#main function
knn <- function(zz)
{	
	max_name = 0
	#calculating distances of each point in testset with sample set
	sampl = iris[,-5]
		d = 0
		for(j in 1:nrow(sampl))
			{
			 d[j] = (sqrt(sum((input - sampl[j,])^2)))
			}
	#print(d)
	#sorting distances in ascending order
	sorted_d = sort(d) 
	#extracting minimum values 
	  	min_val = 0
		for(k in 1:zz)
		{
		 min_val[k] = sorted_d[k]
		}
	  #finding index of minimum distances
	  min_ind = 0
	  
	  for(k in 1:zz)
		{
		 min_ind[k] = which(min_val[k] == d)
		}
		#finding class of minimum distance
		
		spc = iris[min_ind,ncol(iris)]
		tp = deframe(count(spc))
		ktp = which(tp==max(tp))									#if any clash happens this will collect clash classes
		lev = levels(iris[,ncol(iris)])
		summ = 0
		if(length(ktp) > 1)
		{
			for(i in 0:length(ktp))
			{
				summ[i] = sum(d[which(names(tp)==lev[i+1])])		#to find the average distance of two clashed classes
			}
			max_name = names(tp)[which.min(summ)]					#minimum distance of clashed classes
		}else
			{
			max_name = names(tp)[which.max(tp)]
			}
	  	cat("Given example belongs to",max_name,"\n")
}
