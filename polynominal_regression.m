% Clear all variables from the workspace
clear all

% Close all figures
close all

% Clear command window
clc

% Define variables
num_elements = 50; % Number of elements
a = 3; % Slope of the line
b = 1; % Intercept of the line
c = 1; % Constant added to the y values

% Generate x values
x = 1:1:num_elements;

% Generate y values as a linear function of x with some random noise
y = a * x + randn(1, num_elements);

% Add a constant to y
y=y+c;

% polynomial regression
w=polyfit(x,y,1);  % attach regression line to our values
ye=polyval(w,x);  % calc values

% Plot the original data
figure(1)

plot(x, y, 'o');grid on;hold on;  % Plot the original data
plot(x, ye);
% Label the x and y axes
xlabel('x');
ylabel('y');
title('Original data and the polynominal regression line');