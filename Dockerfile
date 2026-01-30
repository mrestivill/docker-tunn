FROM golang:alpine AS builder
RUN git clone https://github.com/ayanrajpoot10/tunn.git && cd tunn && go build

FROM alpine:latest
COPY --from=builder /go/tunn/tunn /usr/local/bin/
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]