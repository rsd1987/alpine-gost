FROM alpine
MAINTAINER mixool0204@gmail.com

RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

WORKDIR /root

RUN apk upgrade --no-cache \
    && apk add --no-cache \
        bash \
        tzdata \
        curl \
    && mkdir -p \ 
        /usr/bin/gost \
        /tmp/gost \
        /etc/gost/ \
    && curl -L -H "Cache-Control: no-cache" -o /tmp/gost/gost.tar.gz https://github.com/ginuerzh/gost/releases/download/v2.4-dev/gost_2.4-dev20170303_linux_amd64.tar.gz \
    && tar -xzf /tmp/gost/gost.tar.gz \
    && cp /tmp/gost/gost /root/gost \
    && chmod +x /root/gost \
    && rm -rf /tmp/gost \
    && rm -rf /var/cache/apk/*

ENTRYPOINT ["/root/gost"]
