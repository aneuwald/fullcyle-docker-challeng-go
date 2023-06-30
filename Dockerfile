FROM golang:1.16-alpine AS builder

WORKDIR /src

COPY main.go .

RUN go mod init aneuwald/docker-challenge-go
RUN go build -o main main.go 

FROM scratch

COPY --from=builder /src/main .

ENTRYPOINT [ "./main" ]



