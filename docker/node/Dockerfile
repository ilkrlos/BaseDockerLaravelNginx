FROM node:lts-alpine3.22

# Argumentos para personalización
ARG UID=1000
ARG USERNAME=nodeuser

# Instalación de dependencias básicas esenciales
RUN apk add --no-cache \
    git \
    curl \
    && rm -rf /var/lib/apk/* /tmp/* /var/tmp/*

# Crear usuario no root
RUN adduser -u ${UID} -D -h /home/${USERNAME} ${USERNAME} && \
    mkdir -p /home/${USERNAME}/.npm && \
    chown -R ${USERNAME}:${USERNAME} /home/${USERNAME}

# Configuración de npm
ENV NPM_CONFIG_PREFIX=/home/${USERNAME}/.npm
ENV PATH="/home/${USERNAME}/.npm/bin:${PATH}"

# Instalación de herramientas globales esenciales
RUN npm install -g \
    npm@latest \
    vite \
    typescript

# Configuración del directorio de trabajo
WORKDIR /front

# Cambiar al usuario no root
USER ${USERNAME}

# Variables de entorno para desarrollo
ENV NODE_ENV=development
ENV PATH="/home/${USERNAME}/.npm/bin:${PATH}"

# Comando por defecto
CMD ["sh"] 
