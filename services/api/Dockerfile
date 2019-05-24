FROM node:10.14.2-alpine
WORKDIR /app

COPY package.json yarn.lock  ./
COPY services/api/package.json ./services/api/

COPY packages/models/package.json  ./packages/models/package.json

RUN yarn install --production && \
  yarn cache clean && \
  rm -rf /tmp

COPY services/api ./services/api
COPY packages/models ./packages/models

EXPOSE 5000

ENTRYPOINT ["node", "services/api"]