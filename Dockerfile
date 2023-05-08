FROM golang:1.18.0-alpine3.14 as builder

WORKDIR /app
COPY . .
ENV CGO_ENABLED=0
RUN GOOS=linux go build ./app/main.go

FROM scratch

WORKDIR /app
COPY --from=builder /app .

CMD [ "/app/main" ]