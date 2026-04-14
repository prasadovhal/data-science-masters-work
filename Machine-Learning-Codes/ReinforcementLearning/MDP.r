N = 10
P = 0.8
gamma = 0.9
U = diag(N)

T = list()
T[[1]] = matrix(0,N,N)
T[[2]] = matrix(0,N,N)

r = as.matrix(c(-1,rep(-0.1,N-2),1))
T[[1]][1,1] = T[[1]][N,N] = T[[2]][1,1] = T[[2]][N,N] = 1

for(i in 2:(N-1))
{
	T[[1]][i,i-1] = P
	T[[1]][i,i+1] = 1 - P
	T[[2]][i,i-1] = 1 - P
	T[[2]][i,i+1] = P
}

policy = floor(2*runif(N)) + 1
Vpi = t(as.matrix(rep(0,N)))
iter = 0
converge = TRUE

while(converge)
{
	iter = iter + 1
	old_V = Vpi
	Tpi = matrix(0,N,N)
	Tpi[1,1] = Tpi[N,N] = 1
	for(s in 2:(N-1))
	{
		Tpi[s,s-1] = T[[policy[s]]][s,s-1]
		Tpi[s,s+1] = T[[policy[s]]][s,s+1]
	}
	Vpi = t(solve(U-gamma*Tpi)) %*% (r)
	policy[1] = 0
	policy[N] = 0
	for(s in 2:(N-1))
	{
		tmp = max(c(Vpi[s-1],Vpi[s+1]))
		policy[s] = which.max(c(Vpi[s-1],Vpi[s+1]))
	}
	err = abs(sum(old_V) - sum(Vpi))
	if(err < 0.01)
		converge = FALSE
}
print(iter)
print(policy)
