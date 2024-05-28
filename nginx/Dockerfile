# Utiliser une image Ubuntu comme base
FROM ubuntu:22.04

# Définir les variables d'environnement pour éviter les interactions manuelles lors de l'installation
ENV DEBIAN_FRONTEND=noninteractive
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres
ENV POSTGRES_DB=postgres
ENV PGDATA=/var/lib/postgresql/data

# Installer PostgreSQL et ses dépendances
RUN apt-get update && \
    apt-get install -y postgresql postgresql-contrib && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copier le script d'entrée
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Exposer le port par défaut de PostgreSQL
EXPOSE 5432

# Définir le point d'entrée
ENTRYPOINT ["/entrypoint.sh"]

# Commande par défaut pour démarrer PostgreSQL
CMD ["postgres"]
