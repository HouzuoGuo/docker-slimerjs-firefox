FROM alpine:latest

MAINTAINER Houzuo Guo <guohouzuo@gmail.com>

WORKDIR /

# As of 2018-05-20, a slimerjs-compatible firefox version along with several useful fonts are only offered in the edge distribution.
RUN \
    sed -i -e 's/v[[:digit:]]\.[[:digit:]]/edge/g' /etc/apk/repositories && \
    echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories

# Upgrade system packages
RUN apk update && apk upgrade --update-cache --available

# Install firefox along with handy extras
RUN apk add bash bzip2 ca-certificates curl dbus expat firefox font-noto fontconfig freetype gnutls icu libfontenc libpng nss openssl ttf-dejavu ttf-freefont ttf-liberation wget wqy-zenhei zlib

# Remove unnecessary files
RUN rm -rf /var/cache/apk/*

# Install slimerjs
RUN \
    wget -O /slimerjs.tbz https://github.com/laurentj/slimerjs/releases/download/1.0.0/slimerjs-1.0.0.tar.bz2 && \
    tar xvf /slimerjs.tbz && \
    ln -s /slimerjs-1.0.0/slimerjs /usr/bin/slimerjs && \
    rm -f /slimerjs.tbz
ENV MOZ_HEADLESS=1

# Entry point is a shell for convenience of image testing, users are advised to run /usr/bin/slimerjs directly from the image.
ENTRYPOINT ["/bin/bash", "-l"]
