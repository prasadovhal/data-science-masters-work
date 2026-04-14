#Scrambled eggs
N <- as.numeric(readline("Enter no. of particles(eg. enter 50) = "))
e = rexp(N,rate=1)
g = rexp(N*2, rate=1)
z = runif(3*N)
rat = c(e,g)
x=z[(1:N)];y=z[(N+1):(3*N)];
plot(z,rat,type='p',xlab="Z Ratio(3N)",ylab="e-g Ratio(N:2N)",bty="n",main="Scrambled Eggs");
points(x,e,col="red",pch='101')
points(y,g,col="orange",pch='103')

library(rgl)
plot3d(z,rat,type='n',xlab="Z Ratio(3N)",ylab="e-g Ratio(N:2N)", zlab="Height",main="Scrambled eggs");
points3d(x,e,col="red",pch='101')
segments3d(interleave(x, 0),interleave(e, 0),interleave(z, 0),alpha = 0.4, col = "red")
points3d(y,g,col="orange",pch='103')
#segments3d(interleave(y, y),interleave(g, g),interleave(z, min(z)),alpha = 0.4, col = "orange")
legend("bottom", legend = levels(z,e,g),pch = c(16, 101, 103), inset = -0.25, xpd = TRUE, horiz = TRUE)
