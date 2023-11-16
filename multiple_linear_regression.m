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
% multiple linear regression
B1=regress(Y,X);  
ye1=B1'*X';

figure(1)

plot(x, y, 'o');grid on;hold on;
plot(x, ye1);
xlabel('x');
ylabel('y');