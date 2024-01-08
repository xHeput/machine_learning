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
% mu -> średnie odchylenie
Xcentered = score * coeff' + mu;


explained_variance = explained;  % im bliżej do 100% tym lepsze dopasowanie
cumulative_variance = cumsum(explained);  % im bliżej do 100% tym lepsze dopasowanie
r_squared = 1 - sum((data_orig - Xcentered).^2) / sum((data_orig - mean(data_orig)).^2);  % im bliżej do 1 tym lepsze dopasowanie

% Wykres
figure(1)
plot(data_orig(:,1), data_orig(:,2),'x','MarkerSize',7,'LineWidth',3);grid;hold on
plot(Xcentered(:,1), Xcentered(:,2), '*');
xlabel('x'); ylabel('y'); title('Dane początkowe')

% Dodanie tytułu z informacjami o dopasowaniu
main_title = 'Poziom dopasowania danych z wykorzystaniem algorytmu PCA';
subtitle = sprintf('Explained Variance = %f, \n Cumulative Explained Variance = %f, \n R-squared = %f', explained_variance, cumulative_variance(end), r_squared);

title({main_title, subtitle});

a = linspace(-2,4,num_elements);
plot(a,a,'g')










