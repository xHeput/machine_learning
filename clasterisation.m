clear all
close all
clc

x1 = rand(300, 2) * 10;
x2 = x1 + 100;
X = [x1; x2]';
y = [ones(1, size(x1, 1)) * 0.2 ones(1, size(x1, 1)) * 0.7];

figure(1)
plot(X(1,:), X(2,:), '*');grid on; hold on;
xlabel('x_1');ylabel('x_2');title('input data');


zakres = [-20 20];
MN = 250;
DF = 5;
GOAL = 0;
SPREAD = 0.7;

Xt = X + (randn(size(X)) * 0.05);
%NN_model_rbf = newrbe(X, y, SPREAD);
NN_model_rbf = newrb(X, y, GOAL, SPREAD, MN, DF);
ynn = sim(NN_model_rbf, Xt);

figure(2)
plot(y, 'o');grid on; hold on;
plot(ynn, '*')
legend('model treningowy','model sieciowy')