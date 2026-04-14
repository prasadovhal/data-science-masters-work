data = read.csv("breast_cancer.csv")[,-2]
col2 = read.csv("breast_cancer.csv")[,2]
data = cbind(data,col2)[,-1]

setdiffDF <- function(A, B)
{ 
     f <- function(A, B) 
         A[!duplicated(rbind(B, A))[nrow(B) + 1:nrow(A)], ] 
     df1 <- f(A, B) 
     df2 <- f(B, A) 
     rbind(df1, df2) 
}

nbfold <- function(fold)
{
	shuf = sample(fold,nrow(data),replace = T)
	acc = 0
	for(x in 1:fold)
	{
		tpf = data[which(shuf == x),]
		test_set = tpf[,-1]
		sampl = setdiffDF(data,tpf)
		v = 0
		for(j in 1:nrow(test_set))
		{
			class_p = split(sampl,f= sampl[,ncol(sampl)])
			cls_len = length(levels(sampl[,ncol(sampl)]))
			p_c = p = p_D_h = 0
			for(k in 1:cls_len)
			{	
				class = (as.data.frame(class_p[k]))[,-ncol(sampl)]
	
				p_c[k] = nrow(class[k]) / nrow(sampl)
				p_D_h = 0
				for(i in 1:(ncol(class)-1))
				{
					p_D_h[i] = pnorm(test_set[j,i],mean = mean(class[,i]), sd=sd(class[,i]))
				}
				p[k] = p_c[k]
				for(i in 1:length(p_D_h))
					p[k] = p[k] * p_D_h[i]
			}

			n_pc1 = p[1] / sum(p)
			n_pc2 = p[2] / sum(p)
			if(n_pc1 > n_pc2)
				v[j] = "B"
			if(n_pc1 < n_pc2)
				v[j] = "M"
		}
		cmp = cbind(tpf,v)
		acc[x] = length(which(cmp[,(ncol(cmp)-1)] == cmp[,ncol(cmp)])) / nrow(cmp)
	}
	accuracy = mean(acc)
	print (acc)
	print (accuracy)
}
