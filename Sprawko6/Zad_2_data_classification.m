clear all;close all;clc

load fisheriris

in_design_data = meas;
out_design_data = species;
tree = fitctree(in_design_data,out_design_data);

%view(tree,'Mode','graph');

in_test = [5 3.3 1.4 0.2;
    7 3.2 4.7 1.4;
    5.7 2.8 4.1 1.3;
    6.3 3.3 6 2.5];

%out_test = ['set';'ver';'ver';'vir'];
out_test = cell(4,1);
out_test{1,1} = 'setosa';
out_test{2,1} = 'versicolor';
out_test{3,1} = 'versicolor';
out_test{4,1} = 'virginica';

clc
test_results = predict(tree,in_test)

test_results = string(test_results);
out_test = string(out_test);
clc
precision = sum(test_results==out_test)/length(out_test);
disp(['Accuracy: ' num2str(precision)]);