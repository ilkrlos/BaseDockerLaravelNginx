#!/bin/bash

# Verificar argumentos
if [ "$#" -lt 2 ]; then
    echo "Uso: $0 <framework> <nombre-proyecto>"
    echo "Frameworks disponibles: react, angular, svelte"
    exit 1
fi

FRAMEWORK=$1
PROJECT_NAME=$2
BASE_IMAGE_NAME="local-node-base"
BASE_IMAGE_TAG="latest"

# Verificar que la imagen base existe
if ! docker image inspect ${BASE_IMAGE_NAME}:${BASE_IMAGE_TAG} >/dev/null 2>&1; then
    echo "La imagen base no existe. Construyendo..."
    ./build-base.sh
fi

# Construir la imagen del proyecto
echo "Construyendo proyecto ${PROJECT_NAME} con ${FRAMEWORK}..."
docker build -t ${PROJECT_NAME}:latest -f ../frameworks/${FRAMEWORK}/Dockerfile .

# Crear directorio del proyecto si no existe
mkdir -p ../../projects/${PROJECT_NAME}

# Ejecutar el proyecto
echo "Iniciando proyecto ${PROJECT_NAME}..."
docker run -it --rm \
    -v $(pwd)/../../projects/${PROJECT_NAME}:/app \
    -p 3000:3000 \
    ${PROJECT_NAME}:latest 