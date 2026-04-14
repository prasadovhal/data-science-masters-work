#png("BFS")

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
 
unvis <- r
vis <- 0
x <- list()

while(unvis != 0)
{	
	for(k in 1:r)
	{
	   A1 <- A[k,]
	   len <- length(A1[A1 == TRUE])
	   A1_log<-A1 == 1 
	   working <- which(A1_log,arr.ind=FALSE,useNames = T)
	   i = 1
	       for(j in 1:len)	
	        {
	          nb = working[j]
 	          Ps <- j
 	          x[[paste0("elements",j)]] <- Ps
 	          #list(x)
 	          print(list(x))
	        }
	        vis = vis + 1
	   	print(vis)
	   	unvis = unvis - 1
	   	print(unvis)
	  	k = k + 1		
	}
	
	   
}
library(igraph)
plot(graph_from_adjacency_matrix(A))
#dev.off()
