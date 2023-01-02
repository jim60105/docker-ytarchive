FROM golang:alpine as builder

RUN go install github.com/Kethsar/ytarchive@master

FROM alpine
RUN apk add --no-cache dumb-init ffmpeg
COPY --chown=65534:65534 --from=builder /go/bin/ytarchive /ytarchive
USER 65534

WORKDIR /download

VOLUME ["/download"]

ENTRYPOINT [ "/usr/bin/dumb-init", "--", "/ytarchive"]
