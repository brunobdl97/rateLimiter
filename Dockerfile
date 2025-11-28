FROM golang:1.25.4-alpine as builder
WORKDIR /app

COPY go.mod ./
COPY go.sum ./

RUN go mod download

COPY . .

RUN go build -o /app/rateLimiter ./cmd/main.go

EXPOSE 8080

ENTRYPOINT ["/app/rateLimiter"]