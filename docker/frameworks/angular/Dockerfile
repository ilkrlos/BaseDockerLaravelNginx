FROM local-node-base:latest

# Instalar Angular CLI
RUN npm install -g @angular/cli

# Configurar el proyecto
WORKDIR /app

# Comando para crear una nueva aplicación Angular
CMD ["ng", "new", ".", "--style=scss", "--routing=true", "--skip-git", "--skip-install"] 