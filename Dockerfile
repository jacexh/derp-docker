FROM golang:1.19-alpine as builder
RUN go install tailscale.com/cmd/derper@main

FROM alpine
COPY --from=builder /go/bin/derper /usr/local/bin
COPY ./entrypoint.sh /usr/local/bin/entrypoint

EXPOSE 443 3478 80
ENV DERPER_DOMAIN foobar.com

ENTRYPOINT [ "entrypoint" ]
