clear all; close all; clc
load reaction.mat

tree = fitctree(reactants,rate);

view(tree, 'Mode','graph');

X_test = reactants;

test_results = predict(tree, X_test);

[~,~,~,bestlevel] = cvLoss(tree, 'SubTrees', 'All', 'TreeSize', 'min')

view(tree, 'Mode','graph','Prune',bestlevel);

tree = prune(tree, 'Level',bestlevel);
view(tree, 'Mode','graph');
