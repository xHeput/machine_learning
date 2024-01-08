clear all
close all
clc

data = 3 + 0.7 * randn(50, 5);
[coeff, score, latent, tsquared, explained, mu] = pca(data, 'NumComponents', 4);
data_pca = score * coeff' + mu;

figure(1)
plot(data(:,1), data(:,2),'rx','MarkerSize',7,'LineWidth',3);grid;hold
plot(data_pca(:,1), data_pca(:,2),'xb','MarkerSize',7,'LineWidth',3)
xlabel('x');ylabel('y')
legend('input data', 'pca')

clc
disp('size of the initial data:')
s_init = size(data, 1) * size(data, 2)
disp('size of the PCA data:')
s1 = size(score, 1) * size(score, 2);
s2 = size(coeff, 1) * size(coeff, 2);
s3 = size(mu, 1) * size(mu, 2);
s_PCA = s1 + s2 + s3

annotation('textbox', [0.15, 0.8, 0.1, 0.1], 'String', sprintf('s_{init} = %d', s_init), 'EdgeColor', 'none');
annotation('textbox', [0.15, 0.7, 0.1, 0.1], 'String', sprintf('s_{PCA} = %d', s_PCA), 'EdgeColor', 'none');

title('Dane początkowe i PCA');
