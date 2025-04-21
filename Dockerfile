FROM node:17

# Куда складываем файлы проекта
WORKDIR /app

# Копирует package.json и package-lock.json
COPY package*.json ./

# Установка зависимостей происходит до копирования файлов проекта
# Так как это позволяет реже сбрасывать этот слой (только при изменении файлов package*)
RUN npm ci

COPY . .

# Старт сервера описывается в scripts внутри package.json
CMD ["npm", "start"]