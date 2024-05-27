# Utiliser une image Ubuntu comme base
FROM ubuntu:22.04

# Définir les variables d'environnement pour éviter les interactions manuelles lors de l'installation
ENV DEBIAN_FRONTEND=noninteractive

# Installer Nginx et ses dépendances
RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copier le fichier de configuration Nginx personnalisé (facultatif)
# COPY nginx.conf /etc/nginx/nginx.conf

# Exposer le port par défaut de Nginx
EXPOSE 80

# Définir le point d'entrée pour démarrer Nginx
ENTRYPOINT ["/usr/sbin/nginx"]

# Démarrer Nginx en mode daemon off
CMD ["-g", "daemon off;"]
