r <- 10
c <- 10
m0 <- matrix(0, r, c)
A <- apply(m0, c(1,2), function(x) sample(c(0,1),1)) 
diag(A) <- 0

for (i in 1:10)
 {
  for (j in 1:10)
   {
    A[i,j] = A[j,i]
   }
 }
 
for(k in 1:r)  
{
  A1 <- A[k,]
  len <- length(A1[A1 == TRUE])
  A1_log<-A1 == 1 
  working <- which(A1_log,arr.ind=FALSE,useNames = T)
  print(working)
}

unvis <- len
vis <- 0
start <- 1

#working <- which(A1_log,arr.ind=FALSE,useNames = T)
while(unvis != 0)
{ 	i = 1
	for(j in i:len)	
	 {
	  nb = working[i]
 	  print(nb)
	 }
	vis = vis + 1
	 print(vis)
	unvis = unvis - 1
	 print(unvis)		
	i = i + 1
}
