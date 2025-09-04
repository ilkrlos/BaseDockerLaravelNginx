# Usar imagen oficial de Node.js con herramientas de desarrollo
FROM node:20-alpine AS development

# Establecer variables de entorno
ENV NODE_ENV=development
ENV HOST=0.0.0.0
ENV PORT=3000
ENV CHOKIDAR_USEPOLLING=true

# Instalar herramientas del sistema necesarias
RUN apk add --no-cache \
    git \
    curl \
    bash \
    openssl

# Instalar globalmente las herramientas esenciales
RUN npm install -g \
    typescript \
    vite 
#    @types/node \
#    nx \
#    pnpm \
#    yarn


# Crear directorio de trabajo
WORKDIR /app

# Configurar permisos para node_modules
RUN mkdir -p /app/node_modules && chown -R node:node /app
RUN npm install -g npm@11.5.2

# Cambiar al usuario node (no root por seguridad)
USER node

# Exponer puerto para desarrollo
EXPOSE 3000 4200 5173 3001

# Comando por defecto (se puede sobrescribir)
#CMD ["bash"]
CMD ["sh", "-c", "echo 'Contenedor terminado ejecutar docker-compose up -d' && sleep infinity"]
