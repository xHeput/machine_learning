clear all
close all
clc

load fisheriris.mat

in_design_data = meas;
out_design_data = species;
tree = fitctree(in_design_data, out_design_data);
view(tree, 'Mode','graph')