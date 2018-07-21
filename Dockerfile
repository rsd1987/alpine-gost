FROM alpine:latest

ENV GOST_VERSION="2.4"

ADD https://github.com/ginuerzh/gost/releases/download/v${GOST_VERSION}/gost_${GOST_VERSION}_linux_amd64.tar.gz /root/ 

RUN \
cd /root && \
tar xzvf gost_${GOST_VERSION}_linux_amd64.tar.gz && \
cp /root/gost_${GOST_VERSION}_linux_amd64/gost /bin/

ADD entrypoint.sh /etc/

EXPOSE 443 8080
ENTRYPOINT ["/etc/entrypoint.sh"]
