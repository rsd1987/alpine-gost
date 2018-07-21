FROM golang:alpine as builder

ADD . /go/src/github.com/ginuerzh/gost/

RUN go install github.com/ginuerzh/gost/cmd/gost

FROM alpine:latest

WORKDIR /bin/

COPY --from=builder /go/bin/gost .

ADD entrypoint.sh /etc/

EXPOSE 443 8080
ENTRYPOINT ["/etc/entrypoint.sh"]
