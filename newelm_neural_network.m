clear all
close all
clc

X = round(rand(1,20));
Y = [0 (X(1:end-1)+X(2:end) == 2)];

plot(Y);

Xseq = con2seq(X);
Yseq = con2seq(Y);

net = newelm(X,Y,10);

net = train(net,Xseq,Yseq);
T = net(Xseq);
T = cell2mat(T)


figure(2)
plot(Y, 'o');grid on; hold on;
plot(T, '*')
legend('model treningowy','model sieciowy')
view(net)