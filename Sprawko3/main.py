import numpy as np
import matplotlib.pyplot as plt
from sklearn.mixture import GaussianMixture

# Przekształcenie danych MATLAB na Python
# Zgodnie ze skryptem MATLAB, generujemy losowy zbiór danych
X1 = np.random.rand(300, 2) * 10
X2 = X1 + np.array([100, 100])  # Przesunięcie danych
X = np.vstack((X1, X2))  # Łączenie danych w jeden zbiór

# Wyplotowanie danych przed klasteryzacją
plt.figure(figsize=(10, 5))
plt.subplot(1, 2, 1)
plt.scatter(X[:, 0], X[:, 1], s=3)
plt.title('Dane przed klasteryzacją')
plt.xlabel('Oś X')
plt.ylabel('Oś Y')
plt.grid(True)

# Algorytm EM
gmm = GaussianMixture(n_components=2, random_state=0).fit(X)

# Klasyfikacja danych
labels = gmm.predict(X)

# Wyplotowanie danych po klasteryzacji
plt.subplot(1, 2, 2)
plt.scatter(X[:, 0], X[:, 1], c=labels, s=3, cmap='viridis')
plt.title('Dane po klasteryzacji (EM)')
plt.xlabel('Oś X')
plt.ylabel('Oś Y')
plt.grid(True)

plt.tight_layout()
plt.show()