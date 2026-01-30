FROM golang:alpine AS builder
RUN go install github.com/ayanrajpoot10/tunn@latest

FROM alpine:latest
COPY --from=builder /go/tunn/tunn /usr/local/bin/
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]