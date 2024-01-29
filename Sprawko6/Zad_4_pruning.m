clear all; close all; clc
load ionosphere.mat

tree = fitctree(X,Y);

view(tree, 'Mode','graph');

X_test = X;

test_results = predict(tree, X_test);

[~,~,~,bestlevel] = cvLoss(tree, 'SubTrees', 'All', 'TreeSize', 'min')

view(tree, 'Mode','graph','Prune',bestlevel);

tree = prune(tree, 'Level',bestlevel);
view(tree, 'Mode','graph');