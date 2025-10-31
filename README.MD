# Docker Multi-Stage App

Este projeto é um exemplo de aplicação **Node.js** com **TypeScript**, usando **Docker multi-stage build** para criar uma imagem leve e eficiente.

![Dockerfile Multi-Stage](https://github.com/RyanViniciusS/Docker-Multi-Stage/blob/main/images/docker.png)

---

## 🚀 Funcionalidades

- Código em **TypeScript**
- Aplicação **Node.js** rodando com **Express**
- **Docker multi-stage build** para minimizar a imagem final
- Imagem final reduzida de **1.65GB → 235MB**

---

## 📦 Como funciona o Dockerfile

O Dockerfile possui **duas etapas principais**:

### 1️⃣ Build

- Usa a imagem `node:18` completa
- Copia apenas `package*.json` para instalar dependências (`npm ci`)
- Copia o restante do código
- Compila o TypeScript (`npx tsc`)

### 2️⃣ Runtime leve

- Usa `node:18-alpine3.19` para runtime mais leve
- Copia apenas os arquivos necessários do build (`dist`, `node_modules`, `package*.json`)
- Define `NODE_ENV=production`
- Expõe a porta `3000` e roda a aplicação (`node dist/index.js`)

---

## ⚡ Comando para buildar e rodar

```bash
# Build da imagem
docker build -t docker-clean:v5 .

# Rodar a aplicação
docker run --rm -p 3000:3000 docker-clean:v5
