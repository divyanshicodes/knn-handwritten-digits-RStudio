# Handwritten Digit Classification with KNN (MNIST subset)
# Author: Divyanshi Mishra

library(ggplot2)
library(FNN)

# 1. Number of training images
num_images <- nrow(Xtrain)
print(paste("Number of training images:", num_images))

# 2. First training label
first_digit <- Ytrain[1]
print(paste("First training image label:", first_digit))

# 3. Visualize first image
firstImg <- Xtrain[1, ]
w <- 28; h <- 28

myImg <- data.frame(
  xVal = rep(1:w, h),
  yVal = rep(h:1, each = w),
  gray = as.numeric(firstImg) / 255
)

ggplot(myImg, aes(x=xVal, y=yVal)) +
  geom_point(colour = rgb(myImg$gray, myImg$gray, myImg$gray)) +
  ggtitle(paste("Digit:", first_digit))

# 4. Why KNN?
# KNN is simple, non-parametric, and works well for image similarity.

# 5. KNN with K = 5
set.seed(123)
knn_pred_5 <- knn(train = Xtrain, test = Xtest, cl = Ytrain, k = 5)

mis_5 <- mean(knn_pred_5 != Ytest)
acc_5 <- mean(knn_pred_5 == Ytest)

print(paste("Misclassification rate:", round(mis_5, 4)))
print(paste("Accuracy:", round(acc_5, 4)))

conf_matrix_5 <- table(Actual = Ytest, Predicted = knn_pred_5)
print(conf_matrix_5)

# per-digit difficulty
digit_error <- 1 - diag(conf_matrix_5) / rowSums(conf_matrix_5)
print(digit_error)

# 6. Compare K = 1 to 20
k_values <- 1:20
mis_rates <- numeric(length(k_values))

for (i in seq_along(k_values)) {
  k <- k_values[i]
  pred_k <- knn(train=Xtrain, test=Xtest, cl=Ytrain, k=k)
  mis_rates[i] <- mean(pred_k != Ytest)
}

plot(k_values, mis_rates, type="b",
     xlab="K (Neighbors)",
     ylab="Misclassification Rate",
     main="KNN Performance vs K")
