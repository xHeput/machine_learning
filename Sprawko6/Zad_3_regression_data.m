clear all;
close all;
clc

load carbig.mat

X = [Acceleration Cylinders];
figure(1)
plot(X, '*');grid;hold;plot(Horsepower, 'ok')

tree = fitrtree(X, Cylinders);

view(tree, 'Mode','graph');

X_test = X;

test_results = predict(tree, X_test);

clc
resuberror = resubLoss(tree)
%cv = crossval(tree)

