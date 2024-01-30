clear all
close all
clc

load carbig.mat

in_design_data = Acceleration;
out_design_data = Cylinders;
tree = fitctree(in_design_data, out_design_data);
view(tree, 'Mode','graph')
