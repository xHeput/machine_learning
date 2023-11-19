% Clear all variables
clear all
% Close all figures
close all
% Clear command window
clc

% Define variables
num_elements = 50;
a = 3; % Slope of the line
b = 1; % Intercept of the line
c = 1; % Constant added to the y values
x=1:1:num_elements;
y=a*x+randn(1,num_elements);
y=y+c;

% Transpose y to column vector
Y=y';
% Transpose x to column vector
X=x';

% Add a column of ones to X for the intercept term
X=[ones(size(X)) X];

% Calculate the mean of x and y
xm=sum(x)/length(y);
ym=sum(y)/length(x);

% Calculate the slope and intercept of the line
a1=(sum((x-xm).*(y-ym)))./(sum((x-xm).^2));
a0=ym-(a1*xm);

% Store the intercept and slope in a vector
B3=[a0;a1];

% Calculate the predicted y values
ye3=X*B3;

% Create a new figure
figure(1)

% Plot the original data
plot(x, y, 'o', LineWidth=3);grid on;hold on;

% Plot the line of best fit
plot(x, ye3, 'k', LineWidth=1);

% Label the x and y axes
xlabel('x');
ylabel('y');
title('Original data and regression line based on min square method');
% Calculate the R-squared value
R23=1-sum((y-ye3').^2)/sum((y-mean(y)).^2);
