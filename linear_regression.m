clear all
close all
clc
% variables 
num_elements=50;
a=-2;
b=5;
c=7;
x=1:1:num_elements;
y=a*x+randn(1,num_elements);
y=y+c;

Y=y';
X=x';

X=[ones(size(X)) X];

% simple linear regression
B1=y/x;
ye1=B1*x;

figure(1)  % simple linear regression

plot(x, y, 'o');grid on;hold on;
plot(x, ye1);
xlabel('x');
ylabel('y');

% simple linear regression
B2 = X\Y;
ye2=X*B2;

figure(2)  % simple linear regression

plot(x, y, 'o', LineWidth=3);grid on;hold on;
plot(x, ye2, 'k', LineWidth=3);
xlabel('x');
ylabel('y');
