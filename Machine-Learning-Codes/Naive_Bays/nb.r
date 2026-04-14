#inputs
data = read.csv("breast_cancer.csv")[,-2]
col2 = read.csv("breast_cancer.csv")[,2]
data = cbind(data,col2)[-1]

#split data in 2 classes as per given classes
n_data = data[order(data[,ncol(data)]),]
#sample
set = read.csv("set.csv")

nb <- function()
{
	class_p = split(data,f= data[,ncol(data)])
	cls_len = length(levels(n_data[,ncol(data)]))
	#initialize
	p_c = p = p_D_h = 0

	for(k in 1:cls_len)
	{
		#p(h/D) = p(D/h) * p(h) -> Bayes' Theorem
		
		class = (as.data.frame(class_p[k]))
		
		#probability of of class 1 & 2 -> p(h)
		p_c[k] = nrow(class[k]) / nrow(data)
		
		#p(D/h) 
		p_D_h = 0
		for(i in 1:(ncol(class)-1))
		{
			p_D_h[i] = pnorm(set[,i],mean = mean(class[,i]), sd=sd(class[,i]))
		}
		
		#p(h/D)
		p[k] = p_c[k]
		for(i in 1:length(p_D_h))
			p[k] = p[k] * p_D_h[i]
	}
	
	#normalize probabilities
	n_pc1 = p[1] / sum(p)
	n_pc2 = p[2] / sum(p)
	
	#decision making
	if(n_pc1 > n_pc2)
		print("query belong to class 1 i.e. B")
	if(n_pc1 < n_pc2)
		print("query belong to class 2 i.e. M")
}
