FROM node:20.17.0-alpine3.20

WORKDIR /usr/src/app

RUN chown -R node:node /usr/src/app

USER node

COPY --chown=node:node package*.json ./

RUN npm ci --omit=dev

COPY --chown=node:node . .

CMD [ "node", "src/server.js" ]
