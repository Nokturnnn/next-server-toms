# Utiliser l'image officielle Ubuntu comme image de base
FROM ubuntu:latest

# Mettre à jour les paquets et installer MariaDB
RUN apt-get update && apt-get install -y mariadb-server

# Définir les variables d'environnement pour configurer MariaDB
ENV MARIADB_ROOT_PASSWORD=my-secret-pw \
    MARIADB_DATABASE=my-database \
    MARIADB_USER=my-user \
    MARIADB_PASSWORD=my-user-pw

# Copier le script d'initialisation dans le conteneur
COPY init-db.sh /docker-entrypoint-initdb.d/

# Rendre le script exécutable
RUN chmod +x /docker-entrypoint-initdb.d/init-db.sh

# Exposer le port MariaDB
EXPOSE 3306

# Définir le point d'entrée
ENTRYPOINT ["mysqld_safe"]

# Lancer le serveur MariaDB
CMD ["--datadir=/var/lib/mysql", "--user=mysql"]
