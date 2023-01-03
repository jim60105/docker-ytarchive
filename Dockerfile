FROM golang:1.19-alpine as builder

ARG VERSION=master

RUN go install github.com/Kethsar/ytarchive@$VERSION

FROM alpine:3.17
RUN apk add --no-cache dumb-init ffmpeg
COPY --chown=65534:65534 --from=builder /go/bin/ytarchive /ytarchive
USER 65534

WORKDIR /download

VOLUME ["/download"]

ENTRYPOINT [ "/usr/bin/dumb-init", "--", "/ytarchive"]
