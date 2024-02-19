# syntax=docker/dockerfile:1

FROM golang:1.19 AS build-stage

WORKDIR /app

COPY main.go ./

RUN CGO_ENABLED=0 GOOS=linux go build main.go

FROM scratch  AS build-release-stage

WORKDIR /

COPY --from=build-stage /app .

CMD [ "./main" ]

