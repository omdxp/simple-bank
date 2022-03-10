# Build stage
FROM golang:1.17.8-alpine3.15 AS build
WORKDIR /app
COPY . .
RUN go build -o main main.go
RUN apk add curl
RUN curl -L https://github.com/golang-migrate/migrate/releases/download/v4.15.1/migrate.linux-amd64.tar.gz | tar xvz

# Run stage
FROM alpine:latest
WORKDIR /app
COPY --from=build /app/main .
COPY --from=build /app/migrate ./migrate
COPY app.env .
COPY start.sh .
COPY wait-for.sh .
COPY db/migration ./migration


EXPOSE 8080
CMD ["/app/main"]
ENTRYPOINT [ "/app/start.sh" ]