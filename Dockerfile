FROM node:16-alpine AS builder

WORKDIR /usr/src/app

COPY package.json package-lock.json ./

RUN npm ci

COPY ./prisma ./

RUN npx prisma generate

COPY nest-cli.json tsconfig.json tsconfig.build.json src/ ./

RUN npm run build && \
    npm prune --omit=dev && \
    npx pkg . --targets node16-alpine -o ./executables/nest-prisma-docker-starter && \
    rm -rf ~/.pkg-cache

FROM alpine:3.16 AS runner

RUN apk update && apk add libgcc

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app/executables/nest-prisma-docker-starter /usr/src/app/nest-prisma-docker-starter

CMD [ "./nest-prisma-docker-starter" ]