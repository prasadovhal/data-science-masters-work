library(data.table)
library(FSelector)

#input
data = read.csv("breast_cancer.csv")[,-2]
col2 = read.csv("breast_cancer.csv")[,2]
data = cbind(data,col2)[-1]
tp_data = data

#query
set = tp_data[542,]

tpp = tp_data[,ncol(tp_data)]
gr = as.vector(gain.ratio(tpp~.,tp_data[,-ncol(tp_data)])[,])

while(T)
{	
	v = which.max(gr)
	if(set[,v] <= median(tp_data[,v]))
	{	
		print("dignosis is M")
		break
	}else
	{	if(length(gr) == 0)
			print("dignosis is B")
		else{
			tp_data = tp_data[,-v]
			}
	}
	gr = gr[-v]
	set = set[,-v]
}
