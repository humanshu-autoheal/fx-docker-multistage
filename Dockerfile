ARG NODE_VERSION=16-alpine
FROM node:${NODE_VERSION} AS build
WORKDIR /app
COPY . .

FROM ghcr.io/example/internal-tools:1.0 AS tools

FROM scratch AS assets
COPY --from=build /app/index.js /index.js

FROM build AS final
CMD ["node", "index.js"]
