FROM golang:1.21-alpine AS builder


#COPY go.mod go.sum ./
#RUN go mod download
ENV GO111MODULE=off

WORKDIR /app

COPY . .

RUN CGO_ENABLED=0 go build -o app .

FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y curl && apt-get clean

WORKDIR /app


COPY --from=builder /app/app .

EXPOSE 8001

ENTRYPOINT ["/app/app"]