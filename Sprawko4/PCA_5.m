clear all
close all
clc

% Przykładowe dane
data = 3 + 0.7 * randn(50, 5);

% Maksymalna liczba komponentów PCA
max_components = size(data, 2);

% Przeprowadzenie analizy dla różnej liczby komponentów
num_components_values = 1:max_components;

reconstruction_errors = zeros(size(num_components_values));

for i = 1:length(num_components_values)
    % PCA
    [coeff, score, latent, tsquared, explained, mu] = pca(data, 'NumComponents', num_components_values(i));
    
    % Odtworzenie danych zredukowanych
    data_pca = score * coeff' + mu;
    
    % Błąd odtwarzania
    reconstruction_errors(i) = norm(data - data_pca);
end

% Wykres zależności
figure;
plot(num_components_values, reconstruction_errors, 'o-', 'LineWidth', 1.5);
grid on;
xlabel('Liczba komponentów PCA');
ylabel('Błąd odtwarzania');
title('Zależność między redukcją rozmiaru danych a błędem odtwarzania');
