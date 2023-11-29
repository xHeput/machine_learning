
clear all
close all
warning off
clc

[Q, map] = imread('jakub_maciejak.png');
n_col = 0.05;
figure(1)
imshow(Q);title('input image')

[Q1, map] = rgb2ind(Q, n_col);

x = Q1(:)';
in_data_train = x;
out_data_train = [0];


% neural network variables
liczba_n_h1 = 5;
liczba_n_o = 6;
% training neural network
siec = feedforwardnet([liczba_n_h1 liczba_n_o]);
siec.trainParam.epochs = 500;
siec.trainParam.goal = 1e-7;
siec.trainParam.show = 50;


siec = train(siec, in_data_train', out_data_train');
ynn = sim(siec,in_data_train');
% view(siec) % diagram
figure(2);
plot(out_data_train,'xb'); hold on; grid on
plot(ynn,'or')