FROM docker.io/node:18-alpine

ARG APP_ROOT=/opt/app-root/src
ENV NO_UPDATE_NOTIFIER=true \
  PATH="/usr/lib/libreoffice/program:${PATH}" \
  PYTHONUNBUFFERED=1
WORKDIR ${APP_ROOT}

# replace with edge repository to get the latest libreoffice version
RUN echo -e "https://dl-cdn.alpinelinux.org/alpine/edge/main\nhttps://dl-cdn.alpinelinux.org/alpine/edge/community\n" > /etc/apk/repositories && \
  apk update && apk upgrade --no-cache --available

# Install LibreOffice
RUN apk --no-cache add openjdk8-jre libreoffice && \
  rm -rf /var/cache/apk/*
