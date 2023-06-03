#!/bin/bash
# Necessari ruby v3.2.2, nodejs v20, docker e docker-compose

# Rimuove tutte le immagini scaricate e create da docker 
docker compose down && \
docker rmi -f $(docker image ls -q -a) || echo "impossibile eliminare immagini di docker" && \
cd nginx && \
mkdir certs && \
cd certs && \
openssl req -new -newkey rsa:2048 -nodes -keyout nginx.key -out nginx.csr && \
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout nginx.key -out nginx.crt && \
openssl dhparam -out dhparam.pem 2048 && \
cd ../.. && \
cd rails && \
bundle install && \
npm install --global yarn && \
yarn install && \
yarn build && \
cd .. && \
docker compose build