FROM golang:1.20-alpine as builder
ARG DEPR_VERSION=v1.54.0
RUN go install tailscale.com/cmd/derper@${DEPR_VERSION}

FROM alpine
COPY --from=builder /go/bin/derper /usr/local/bin
COPY ./entrypoint.sh /usr/local/bin/entrypoint

EXPOSE 443 3478 80

ENTRYPOINT [ "entrypoint" ]
