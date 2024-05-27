#!/bin/bash
set -e

# Accepter automatiquement l'EULA de Minecraft
if [ ! -f eula.txt ]; then
    echo "eula=true" > eula.txt
fi

# Démarrer le serveur Minecraft
exec "$@"
