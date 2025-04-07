# --- Etapa de Compilación ---
    FROM node:18 AS build

    # Establecer el directorio de trabajo dentro del contenedor
    WORKDIR /app
    
    # Copiar los archivos package.json y package-lock.json
    COPY package*.json ./
    
    # Instalar las dependencias
    RUN npm install
    
    # Copiar el resto de los archivos del proyecto
    COPY . ./
    
    # Construir la aplicación React para producción
    RUN npm run build
    
    # --- Etapa de Producción ---
    FROM nginx:alpine
    
    # Copiar los archivos construidos de la etapa anterior
    COPY --from=build /app/build /usr/share/nginx/html
    
    
    # Exponer el puerto 80
    EXPOSE 80
    
    # Comando para iniciar Nginx
    CMD ["nginx", "-g", "daemon off;"]