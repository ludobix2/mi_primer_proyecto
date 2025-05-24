#!/bin/bash

set -e

echo "🔧 Instalando Docker en Ubuntu..."

# Paso 1: Actualizar paquetes
sudo apt-get update

# Paso 2: Instalar dependencias necesarias
sudo apt-get install -y ca-certificates curl gnupg lsb-release

# Paso 3: Crear directorio para llaves
sudo install -m 0755 -d /etc/apt/keyrings

# Paso 4: Descargar la llave GPG de Docker
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Paso 5: Agregar el repositorio oficial de Docker a apt
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Paso 6: Actualizar el índice de paquetes
sudo apt-get update

# Paso 7: Instalar Docker y sus componentes
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Paso 8: Verificar instalación
echo "✅ Docker versión instalada:"
docker --version
echo "✅ Docker Compose versión instalada:"
docker compose version

# Paso 9: Habilitar y arrancar el servicio Docker
sudo systemctl enable docker
sudo systemctl start docker

echo "🎉 Docker instalado correctamente. Puedes usar 'docker' y 'docker compose' desde ahora."

