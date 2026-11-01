#!/bin/bash

set -e

# Directorio donde se encuentra docker-compose.yaml
cd /nginx-container

echo "$(date) - Iniciando verificacion SSL"

# Renovar certificados si corresponde
/usr/bin/docker compose run --rm --no-deps certbot

echo "$(date) - Verificando Nginx"

# Validar configuracion antes de recargar
/usr/bin/docker exec webserver nginx -t

# Recargar certificados sin interrumpir conexiones
/usr/bin/docker exec webserver nginx -s reload

echo "$(date) - Proceso SSL finalizado"
