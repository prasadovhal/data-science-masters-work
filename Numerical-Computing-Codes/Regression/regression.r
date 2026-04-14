x = seq(0,0.5,by = 0.01)
f = exp(-x)

A = matrix(c(length(x),sum(x),sum(x),sum(x^2)),2,2)
B = matrix(c(sum(f),sum(x*f)),2,1)
C = solve(A,B)

P = C[1] + C[2] * x

plot(x,f,"l",xlim = c(0,0.5),ylim=c(0.5,1),col = "red")
par(new=T)
plot(x,P,"l",xlim = c(0,0.5),ylim=c(0.5,1),col = "blue",axes = F)
