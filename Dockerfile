FROM golang:alpine AS builder
RUN apk add --no-cache git

RUN git clone https://github.com/ayanrajpoot10/tunn.git && \
    cd tunn && \
    go build -o /tunn

FROM alpine:latest
COPY --from=builder /tunn /usr/local/bin/
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]