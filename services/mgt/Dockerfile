FROM node:10.14.2-alpine
WORKDIR /app

COPY package.json yarn.lock  ./
COPY services/mgt/package.json ./services/mgt/

COPY packages/models/package.json  ./packages/models/package.json

RUN yarn install --production && \
  yarn cache clean && \
  rm -rf /tmp

COPY services/mgt ./services/mgt
COPY packages/models ./packages/models

EXPOSE 5100

ENTRYPOINT ["node", "services/mgt"]