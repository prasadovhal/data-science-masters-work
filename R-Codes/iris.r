png(filename="Graph.png")

x <- iris$Sepal.Length
y <- iris$Sepal.Width
u <- iris$Petal.Length
v <- iris$Petal.Width

x11()
plot(x,y,col=c('green','blue','red'),pch=16,)

#par(new=TRUE)
par(mfrow=c(2,2))
boxplot(x,y,xlab='Sepal Length',ylab='Sepal Width')
boxplot(u,v,xlab='Petal Length',ylab='Petal Width')
boxplot(x,v,xlab='Sepal Length',ylab='Petal Width')
boxplot(u,y,xlab='Petal Length',ylab='Sepal  Width')



