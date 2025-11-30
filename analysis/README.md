# Handwritten Digit Classification with KNN

This project uses K-nearest neighbors (KNN) to classify handwritten digit images from a MNIST-style dataset. Each image is a 28×28 grayscale picture stored as a flattened vector, and the task is to predict the digit label (0–9) for each test image.

## Problem Statement

Given training and test sets of handwritten digit images with labels, the goal is to build and evaluate a simple KNN classifier. We visualize an example digit, apply KNN with K=5, study its confusion matrix, and then compare performance for K values from 1 to 20.

## Steps Performed

• Load dataset (Xtrain, Ytrain, Xtest, Ytest)  
• Check dataset size and first label  
• Visualize the first digit in 28×28 format  
• Apply KNN with K = 5  
• Compute misclassification rate and accuracy  
• Generate confusion matrix  
• Identify hardest digits to classify  
• Compare K = 1 to 20 and plot misclassification rate  

## Tools

R, ggplot2, FNN
