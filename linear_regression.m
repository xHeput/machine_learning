clear all
close all
clc
% variables 
num_elements = 50; % Number of data points
a = 3; % Slope of the line
b = 1; % Intercept of the line
c = 1; % Constant added to the y values
x = 1:1:num_elements; % x values
y = a * x + randn(1, num_elements); % y values with added noise
y = y + c; % Add constant to y values

Y = y'; % Transpose y values for matrix operations
X = x'; % Transpose x values for matrix operations

X=[ones(size(X)) X]; % Add a column of ones to X for the intercept term

% simple linear regression
B1 = y / x; % Simple linear regression using the formula y = mx + c
ye1 = B1 * x; % Predicted y values for simple linear regression

figure(1) % Create a new figure for the plot

plot(x, y, 'o');grid on;hold on; % Plot the actual data points
plot(x, ye1); % Plot the predicted y values from simple linear regression
xlabel('x'); % Label the x-axis
ylabel('y'); % Label the y-axis
title('Original data and the linear regression line');
% simple linear regression
B2 = X \ Y; % Solve for B2 using the formula Y = XB2
ye2= X * B2; % Predicted y values for simple linear regression

figure(2) % Create a new figure for the plot

plot(x, y, 'o', LineWidth=3);grid on;hold on; % Plot the actual data points
plot(x, ye2, 'k', LineWidth=1); % Plot the predicted y values from simple linear regression
xlabel('x'); % Label the x-axis
ylabel('y'); % Label the y-axis
