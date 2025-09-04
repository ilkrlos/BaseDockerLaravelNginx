#!/bin/bash

# Definir el nombre de la imagen base
BASE_IMAGE_NAME="local-node-base"
BASE_IMAGE_TAG="latest"

# Construir la imagen base
echo "Construyendo imagen base..."
docker build -t ${BASE_IMAGE_NAME}:${BASE_IMAGE_TAG} -f ../base/node/Dockerfile ../base/node

echo "Imagen base construida: ${BASE_IMAGE_NAME}:${BASE_IMAGE_TAG}"
echo "Puedes usar esta imagen en tus proyectos con: FROM ${BASE_IMAGE_NAME}:${BASE_IMAGE_TAG}" 