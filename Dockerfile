FROM golang:1.21.4-bookworm as build

WORKDIR /root/golang

COPY src/main.go .

RUN go mod init fullcycle && \
    go build -ldflags "-s -w" main.go


FROM scratch

COPY --from=build /root/golang/main /main
CMD ["/main"]