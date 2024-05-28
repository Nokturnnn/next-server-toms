# Utiliser une image de base officielle de Python
FROM python:3.12.3

# Définir le répertoire de travail
WORKDIR /app

# Copier le reste de l'application
COPY . .

# Copier le fichier requirements.txt et installer les dépendances
RUN pip install --no-cache-dir -r requirements.txt

# Définir la commande pour démarrer l'application
CMD ["python", "app.py"]
