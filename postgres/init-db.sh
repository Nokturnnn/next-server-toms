#!/bin/bash
service mysql start

# Attendre que le serveur MariaDB soit lancé
sleep 10

# Configurer MariaDB avec les variables d'environnement
mysql -u root <<-EOSQL
    ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';
    CREATE DATABASE IF NOT EXISTS ${MARIADB_DATABASE};
    CREATE USER IF NOT EXISTS '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';
    GRANT ALL PRIVILEGES ON ${MARIADB_DATABASE}.* TO '${MARIADB_USER}'@'%';
    FLUSH PRIVILEGES;
EOSQL

# Arrêter le service MariaDB pour permettre son démarrage avec le CMD
service mysql stop
