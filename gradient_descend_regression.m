% Clear all variables and close all figures
clear all
close all
clc

% Define the number of elements and the parameters a, b, c
num_elements = 50;
a = 3; % Slope of the line
b = 1; % Intercept of the line
c = 1; % Constant added to the y values
x=1:1:num_elements;
y=a*x+b*randn(1,num_elements);
y=y+c;

% Transpose the vectors Y and X
Y=y';
X=x';

% Add a column of ones to X
X=[ones(size(X)) X];

% Initialize the parameters A and set the learning rate
A=randn(2,1);
alfa=0.00001;
num_iteration=50;

% Plot the beta values
figure(1);
grid on;
hold on;
xlabel('x');
ylabel('beta values');
title('Beta values graph');
% Plot the error values
figure(2);
grid on;
hold on;
xlabel('x');
ylabel('mean squared error values');
title('Mean squared error graph');

% Gradient descent regression
for i=1:1:num_iteration

   % Update the learning rate
   beta = 0.001 * (length(X)/(1.0+(i*length(X))));
   
   % Plot the beta value
   figure(1)
   plot(i,beta,'or')

   % Update the parameters A
   for n_data = 1:length(X)
       ye = X(n_data,:) * A;
       e = (Y(n_data,:)-ye);
       D_A = beta * e * X(n_data,:)';
       A = A + D_A;
   end

   % Calculate the error
   ye=X*A;
   e_num = mse(Y,ye);

   % Plot the error value
   figure(2);
   plot(i,e_num,'*m')
end

% Plot the original data and the regression line
figure(3)
plot(x, y, 'o');grid on;hold on;
xlabel('x');
ylabel('y');
title('Original data and the regression line');

% Calculate and plot the regression line
y_regression = A(2) * x + A(1);
plot(x, y_regression, 'r', 'LineWidth', 2);
