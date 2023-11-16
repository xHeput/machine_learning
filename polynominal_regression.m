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


% polynomial regression
w=polyfit(x,y,1);  % attach regression line to our values
ye=polyval(w,x);  % calc values

figure(1)

plot(x, y, 'o');grid on;hold on;
plot(x, ye);
xlabel('x');
ylabel('y');