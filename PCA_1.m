clear all
close all
clc

%step 1
num_elements = 50;
data1 = linspace(-2,4,num_elements);
data1 = data1';
data1 = data1 + (randn(size(data1))*0.3);
data2 = linspace(-2,4,num_elements);
data2 = data2';
data2 = data2 + (rand(size(data2)).*0.5);
data2 = data2 + 3.79;
data_orig = [data1 data2];

[coeff, score, latent, tsquared, explained, mu] = pca(data_orig, 'NumComponents', 2);
% mu średnie odchylenie
Xcentered = score * coeff' + mu;

figure(1)
plot(data_orig(:,1), data_orig(:,2),'x','MarkerSize',7,'LineWidth',3);grid;hold

plot(Xcentered(:,1), Xcentered(:,2), '*');
xlabel('x');ylabel('y');title('initial data')
a = linspace(-2,4,num_elements);
plot(a,a,'g')



