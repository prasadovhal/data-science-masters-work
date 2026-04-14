library(neuralnet)

data = read.csv("cereals.csv",sep="\t")
samplesize = 0.60 * nrow(data)
set.seed(80)
index = sample( seq_len ( nrow ( data ) ), size = samplesize )
datatrain = data[ index, ]
datatest = data[ -index, ]
#scaled = as.data.frame(scale(data, center = min, scale = max - min))
scaled = scale(data[,-(1:3)])
new_d = cbind.data.frame(data[,1:3],scaled)

trainNN = scaled[index , ]
testNN = scaled[-index , ]
NN = neuralnet(rating ~ calories + protein + fat + sodium + fiber, trainNN, hidden = 3 , linear.output = T )
plot(NN)
#predict_testNN = compute(NN, testNN[,c(1:5)])
predict_testNN = (predict_testNN$net.result * (max(data$rating) - min(data$rating))) + min(data$rating)

plot(datatest$rating, predict_testNN, col='blue', pch=16, ylab = "predicted rating NN", xlab = "real rating")
abline(0,1)

RMSE.NN = (sum((datatest$rating - predict_testNN)^2) / nrow(datatest)) ^ 0.5
