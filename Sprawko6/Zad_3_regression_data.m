clear all;
close all;
clc

load seamount.mat

X = [x y];
figure(1)
plot(X, '*');grid;hold;plot(z, 'ok')

tree = fitrtree(X, y);

view(tree, 'Mode','graph');

X_test = X;

test_results = predict(tree, X_test);

clc
resuberror = resubLoss(tree)
%cv = crossval(tree)


