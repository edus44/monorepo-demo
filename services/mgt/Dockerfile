FROM node:10.14.2-alpine
WORKDIR /app

COPY package.json yarn.lock        ./
COPY services/mgt/package.json     ./services/mgt/
COPY packages/models/package.json  ./packages/models/package.json

RUN yarn install --frozen-lockfile --production && \
  rm -rf /tmp ~/.npm ~/.node-gyp /usr/local/share/.cache

COPY services/mgt    ./services/mgt
COPY packages/models ./packages/models

EXPOSE 5100

ENTRYPOINT ["node", "services/mgt"]