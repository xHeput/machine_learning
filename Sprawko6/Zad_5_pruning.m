clear all
close all
clc

load carsmall.mat

X=[Weight Horsepower];
y=MPG;
figure(1)
plot(X,'*');
grid;
hold;
plot(y, 'ok')

tree = fitrtree(X,y);
view(tree,'Mode','graph');

X_test = X;
test_results = predict(tree, X_test);

[~,~,~,bestlevel] = cvLoss(tree,'SubTrees','All','TreeSize', 'min')

view(tree,'Mode','graph', 'Prune',bestlevel);

view(tree,'Mode','graph');