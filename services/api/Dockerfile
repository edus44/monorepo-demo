FROM node:10.14.2-alpine
WORKDIR /app

COPY package.json yarn.lock        ./
COPY services/api/package.json     ./services/api/
COPY packages/models/package.json  ./packages/models/package.json
COPY packages/tools/package.json   ./packages/tools/package.json

RUN apk add -t build-deps python build-base && \
  yarn install --frozen-lockfile --production && \
  rm -rf /tmp ~/.npm ~/.node-gyp /usr/local/share/.cache && \
  apk del --purge build-deps

COPY services/api    ./services/api
COPY packages/models ./packages/models
COPY packages/tools  ./packages/tools

EXPOSE 5000

ENTRYPOINT ["node", "services/api"]