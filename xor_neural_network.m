clear all
close all
clc

X = [0 0; 1 1; 1 0; 0 1];
Y = [0; 0; 1; 1];

figure(1)
plot(X, 'or'); grid on; hold on;

% neural network variables
range = [-20 20];
liczba_n_h1 = 30;
liczba_n_o = 1;
% training neural network
siec = newff([range;range], [liczba_n_h1 liczba_n_o], {'tansig', 'purelin'}, 'trainlm');
siec.trainParam.epochs = 30;
siec.trainParam.goal = 1e-5;
siec = train(siec, X', Y');
ynn = sim(siec,X');
% view(siec) % diagram
figure(2);
plot(X,'xb'); hold on; grid on
plot(ynn,'or')