FROM node:22.16.0-alpine3.21 AS node-base

ARG UID=${UID}
ARG GID=${UID}
ARG APP_NAME=${APP_NAME}

ARG USERNAME=nodeuser
# Crear usuario no root
RUN adduser -u ${UID} -D -h /home/${USERNAME} ${USERNAME} && \
    mkdir -p /home/${USERNAME}/.npm && \
    chown -R ${USERNAME}:${USERNAME} /home/${USERNAME}

# Instalación de dependencias básicas
RUN apk add --no-cache \
    git \
    curl \
    wget \
    g++ \
    && rm -rf /var/lib/apk/* /tmp/* /var/tmp/*


# Configuración de npm
ENV NPM_CONFIG_PREFIX=/home/${USERNAME}/.npm
ENV PATH="/home/${USERNAME}/.npm/bin:${PATH}"

# Instalación de herramientas globales útiles
RUN npm install -g \
    npm@latest \
    yarn@latest \
    pnpm@latest \
#    @vue/cli \
    @angular/cli \
#    svelte-cli \
    vite \
    typescript \
    ts-node \
    nodemon

# Configuración del directorio de trabajo
WORKDIR /app

# Cambiar al usuario no root
USER ${USERNAME}

# Variables de entorno para desarrollo
ENV NODE_ENV=development
ENV PATH="/home/${USERNAME}/.npm/bin:${PATH}"

# Comando por defecto (puede ser sobrescrito en los Dockerfiles específicos)
CMD ["sh"] 
# Crear usuario y grupo no-root si no existen (solo si es necesario, alpine ya tiene 1000)
RUN addgroup -g ${GID} appgroup || true && adduser -u ${UID} -G appgroup -s /bin/sh -D appuser || true
RUN mkdir /app
# Configurar WORKDIR
WORKDIR /app
RUN echo "creando el proyecto con vite en /app/"${APP_NAME}
RUN npm install -g vite \
   ;npm create vite@latest ${APP_NAME} -- --template react-ts \
   ;cd ${APP_NAME} \
   ;npm install

# ---
RUN ls /app

EXPOSE 5173

WORKDIR /app/${APP_NAME}

CMD ["npm", "run", "dev",  "--host", "0.0.0.0"]
