# Utiliser une image Ubuntu comme base
FROM ubuntu:latest

# Installer OpenJDK pour exécuter le serveur Minecraft
RUN apt-get update && \
    apt-get install -y openjdk-17-jre-headless wget && \
    rm -rf /var/lib/apt/lists/*

# Ajouter un utilisateur non-root pour exécuter le serveur Minecraft
RUN useradd -m -d /minecraft minecraft

# Changer au répertoire de l'utilisateur
WORKDIR /minecraft

# Télécharger le serveur Minecraft
RUN wget -O minecraft_server.jar https://launcher.mojang.com/v1/objects/f1a0073671057f01aa843443fef34330281333ce/server.jar

# Accepter l'EULA de Minecraft
RUN echo "eula=true" > eula.txt

# Exposer le port par défaut du serveur Minecraft
EXPOSE 25565

# Utiliser l'utilisateur minecraft
USER minecraft

# Commande pour démarrer le serveur Minecraft
CMD ["java", "-Xmx1024M", "-Xms1024M", "-jar", "minecraft_server.jar", "nogui"]
