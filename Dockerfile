# syntax=docker/dockerfile:1

FROM golang:alpine AS build-stage

WORKDIR /app

COPY . .

RUN go build main.go 

FROM scratch

WORKDIR /

COPY --from=build-stage /app .

ENTRYPOINT [ "./main" ]
