clear all
close all
clc

% Dane oryginalne
data1 = -10:0.1:10;
data2 = sin(data1);
data3 = sin(data1);
data4 = sin(data1);
data5 = sin(data1);

data1 = data1';
data2 = data2';
data3 = data3';
data4 = data4';
data5 = data5';
data = [data2 data3 data4 data5];

figure(1)
plot(data, 'LineWidth', 1.5);
grid on; hold on;
xlabel('Indeks');
ylabel('Wartość');
title('Dane początkowe');
legend('data2', 'data3', 'data4', 'data5');

% Dodanie szumu
data_n = data;
n_coeff = 0.1;
data_n = data + (n_coeff * randn(size(data)));

figure(2)
plot(data_n, 'LineWidth', 1.5);
grid on; hold on;
xlabel('Indeks');
ylabel('Wartość');
title('Dane początkowe (z szumem)');
legend('data2', 'data3', 'data4', 'data5');

% PCA
max_components = size(data_n, 2);
num_components = max_components - 3;

[coeff, score, latent, tsquared, explained, mu] = pca(data_n, 'NumComponents', 1);
data_pca = score * coeff' + mu;

figure(3)
plot(data_pca, 'LineWidth', 1.5);
grid on; hold on;
xlabel('Indeks');
ylabel('Wartość');
title('Filtrowanie PCA');
legend('Filtered Data');

% Explained Variance
figure(4)
bar(explained);
xlabel('Numer składowej PCA');
ylabel('Explained Variance (%)');
title('Explained Variance dla składowych PCA');
