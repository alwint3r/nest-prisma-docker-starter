FROM node:16-alpine AS builder

WORKDIR /usr/src/app

RUN mkdir src

COPY package.json package-lock.json ./

RUN npm ci

COPY ./prisma ./

RUN npx prisma generate

COPY nest-cli.json tsconfig.json tsconfig.build.json ./

COPY src/ ./src

RUN npm run build && \
    npx pkg . --targets node16-alpine --compress GZip -o ./executables/nest-prisma-docker-starter && \
    rm -rf ~/.pkg-cache

FROM alpine:3.16 AS runner

RUN apk update && apk add libgcc

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app/executables/nest-prisma-docker-starter /usr/src/app/nest-prisma-docker-starter

CMD [ "./nest-prisma-docker-starter" ]