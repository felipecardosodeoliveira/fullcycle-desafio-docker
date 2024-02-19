# syntax=docker/dockerfile:1

FROM golang:1.19 AS build-stage

WORKDIR /app

COPY *.go ./

RUN CGO_ENABLED=0 GOOS=linux go build *.go

FROM scratch  AS build-release-stage

WORKDIR /

COPY --from=build-stage /app .

CMD [ "./main" ]

