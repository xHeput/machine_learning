clear all
close all
clc

t_sim = 10;
st_sim = 0.1;

a = 2;
b = 1;
amp = 0.25;
freq = 0.5;
sim('simulink_model')

figure(1)
subplot(2,1,1)
plot(t,y_1(:,1))
grid on;
title('t-input signal')
xlabel('x');
ylabel('y');

subplot(2,1,2)
plot(t,y_1(:,2))
grid on;
title('y_1')
xlabel('x');
ylabel('y');

figure(2)
plot(t,y_2(:,1))
grid on;
title('y_2')
xlabel('x');
ylabel('y');