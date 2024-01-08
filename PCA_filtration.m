% Przygotowanie danych (przykładowe dane z szumem)
data = linspace(1, 10, 100)' + randn(100, 1);

% Standaryzacja danych (opcjonalne)
data_standardized = zscore(data);

% Zastosowanie PCA
[coeff, score, latent, ~, explained, mu] = pca(data_standardized, 'NumComponents', 1);

% Odtworzenie danych zredukowanych
data_filtered = score * coeff' + mu;

% Wyświetlenie wyników
figure;
plot(data, 'b', 'LineWidth', 2); hold on;
plot(data_filtered, 'r--', 'LineWidth', 2);
legend('Oryginalne dane', 'Dane po PCA');
xlabel('Indeks danych');
ylabel('Wartość');
title('Filtrowanie danych za pomocą PCA');
