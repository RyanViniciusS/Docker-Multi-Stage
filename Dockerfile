# ===== Etapa de build =====
FROM node:18 AS build

WORKDIR /usr/src/app

# Copia apenas package.json e package-lock.json para instalar dependências
COPY package*.json ./

# Instala apenas dependências necessárias para build
RUN npm ci

# Copia o restante do código
COPY . .

# Compila TypeScript
RUN npx tsc

# ===== Etapa runtime leve =====
FROM node:18-alpine3.19

WORKDIR /usr/src/app

# Copia apenas o necessário do build
COPY --from=build /usr/src/app/node_modules ./node_modules
COPY --from=build /usr/src/app/dist ./dist
COPY --from=build /usr/src/app/package*.json ./

# Variáveis de ambiente
ENV NODE_ENV=production

# Porta exposta
EXPOSE 3000

# Comando de inicialização
CMD ["node", "dist/index.js"]
