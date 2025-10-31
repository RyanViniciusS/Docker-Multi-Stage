Docker Multi-Stage App

Este projeto é um exemplo de aplicação Node.js com TypeScript, usando Docker multi-stage build para criar uma imagem leve e eficiente.

🚀 Funcionalidades

Código em TypeScript

Aplicação Node.js rodando com Express

Docker multi-stage build para minimizar a imagem final

Imagem final reduzida de 1.65GB → 235MB

📦 Como funciona o Dockerfile

O Dockerfile possui duas etapas principais:

Build

Usa a imagem node:18 completa

Copia apenas package*.json para instalar dependências (npm ci)

Copia o restante do código

Compila o TypeScript (npx tsc)

Runtime leve

Usa node:18-alpine3.19 para runtime leve

Copia apenas os arquivos necessários do build (dist, node_modules, package*.json)

Define NODE_ENV=production

Expõe a porta 3000 e roda a aplicação (node dist/index.js)