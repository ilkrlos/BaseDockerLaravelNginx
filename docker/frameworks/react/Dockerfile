FROM local-node-base:latest

# Instalar create-react-app
RUN npm install -g create-react-app

# Configurar el proyecto
WORKDIR /app

# Comando para crear una nueva aplicación React
CMD ["npx", "create-react-app", ".", "--template", "typescript"] 