r1 <- 2
t <-seq(0,360,by=0.01)
plot(r1*cos(t),r1*sin(t),xlim=c(-2,2),ylim=c(-2,2))

par(new=T)

draw.circle(-0.8,0.5,0.1)
par(new=T)
draw.circle(0.8,0.5,0.1)
par(new=T)
draw.circle(-0.8,0.5,0.5)
par(new=T)
draw.circle(0.8,0.5,0.5)
par(new=T)
x1<-c(0,-0.5,0.5,0)
y1<-c(0,-0.5,-0.5,0)

plot(x1,y1,xlim=c(-2,2),ylim=c(-2,2),"l")
par(new=T)
draw.ellipse(0,-1,1,0.1)
