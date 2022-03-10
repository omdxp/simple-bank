# Build stage
FROM golang:1.17.8-alpine3.15 AS build
WORKDIR /app
COPY . .
RUN go build -o main main.go

# Run stage
FROM alpine:latest
WORKDIR /app
COPY --from=build /app/main .

EXPOSE 8080
CMD ["/app/main"]