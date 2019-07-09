FROM abiosoft/caddy
MAINTAINER Hyacinthus <hyacinthus@gmail.com>

ARG hugo_version=0.55.6

RUN apk add --no-cache openssh-client git tar curl libstdc++ libc6-compat

RUN curl --silent --show-error --fail --location \
  --header "Accept: application/tar+gzip, application/x-gzip, application/octet-stream" -o - \
  "https://github.com/spf13/hugo/releases/download/v0.55.6/hugo_extended_0.55.6_Linux-64bit.tar.gz" \
  | tar --no-same-owner -C /tmp -xz \
  && mv /tmp/hugo /usr/bin/hugo \
  && chmod 0755 /usr/bin/hugo \
  && git config --global fetch.recurseSubmodules true \
  && mkdir -p /www/public

WORKDIR /www

COPY Caddyfile /etc/Caddyfile

ENV REPO github.com/hyacinthus/blog

