FROM node:22-alpine3.21

RUN mkdir /app && chown node:node /app

WORKDIR /app

COPY ./server.mjs /app/

USER node

EXPOSE 3000
CMD ["node", "server.mjs"]