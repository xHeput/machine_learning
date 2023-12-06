clear all % Clear all variables from the workspace
close all % Close all figures
clc % Clear the command window

x = linspace(-10,10,200);
x1 = x(2:200);
x2 = x(1:199);

a = 1;

y1 = a * x1;
y2 = a * x2;
y = sin(x1);

X = [y1; y2]

%plot(y1, 'k'); grid on; hold on;
%plot(y2, 'k'); hold on;
plot(y);

zakres = [-20 20];
MN = 50;
DF = 5;
GOAL = 0;
SPREAD = 0.5;

Xt = X + (randn(size(X)) * 0.05);
NN_model_rbf = newrb(X, y, GOAL, SPREAD, MN, DF);
ynn = sim(NN_model_rbf, Xt);

figure(2)
plot(y, 'k');grid on; hold on;
plot(ynn, 'r')
legend('model treningowy','model sieciowy')


