clear all % Clear all variables from the workspace
close all % Close all figures
clc % Clear the command window

num_elements = 50; % Define the number of elements

% Define the constants a, b, and c
a = 0.3; % Slope of the line
b = 0.1; % Intercept of the line
c = 0.1; % Constant added to the y values

% Create x values using linspace and generate y values
x = linspace(0,1,num_elements); % Generate equally spaced x values between 0 and 1
y = a * x + b * randn(1, num_elements); % Generate y values using defined equation
y = y + c; % Add constant c to all y values

% Convert x and y to column vectors
Y=y';
X=x';

% Add column of ones to X for the intercept term in logistic regression
X=[ones(size(X)) X];

% Plot x and y values
figure(1)
plot(x,y,'*','LineWidth',3);
grid on;
hold on;
xlabel('x');
ylabel('y');
title('Original data and the logistic regression line');

% Set options for lsqnonlin function
options = optimset('Display','iter','MaxIter',200,'TolFun',0,'TolX',0);

% Define cost function for logistic regression
cost_function = @(params)-1/length(X)*sum((Y.*log(logsig(X*params')))+((1-Y).*log(1-logsig(X*params'))));

% Initialize parameters for lsqnonlin function
params_init = randn(1, size(X,2));
params_l_bounds=[];
params_up_bounds=[];

% Use lsqnonlin to find optimal parameters that minimize the cost function
params_optim = lsqnonlin(cost_function, params_init, params_l_bounds, params_up_bounds, options);

% Compute predicted y values using logistic function
ye1 = logsig(params_optim(1)*X(:,1)+params_optim(2)*X(:,2));

% Compute R2 value to assess the goodness of fit
R2_1 = 1 - sum((y - ye1').^2) / sum((y - mean(y)).^2);

% Plot predicted y values
plot(x,ye1,'LineWidth',2);

% Display R2 value
disp('Wartosc parametru R2: ');
disp(R2_1);
