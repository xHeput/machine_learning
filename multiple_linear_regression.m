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
x=1:1:num_elements;

% Generate y values as a linear function of x with some random noise
y=a*x+randn(1,num_elements);

% Add a constant to y
y=y+c;

% Transpose y to make it a column vector
Y=y';

% Transpose x to make it a column vector
X=x';

% Add a column of ones to X to account for the bias term in the linear regression
X=[ones(size(X)) X];

% Perform multiple linear regression using the regress function
B1=regress(Y,X); 

% Calculate the predicted y values
ye1=B1'*X';

% Plot the original data
figure(1)
plot(x, y, 'o'); % Plot the original data
grid on; % Turn on the grid
hold on; % Keep the current plot
title('Original data and the multiple regression line');

% Plot the predicted y values
plot(x, ye1); % Plot the predicted y values

% Label the x and y axes
xlabel('x');
ylabel('y');
