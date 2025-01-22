FROM golang:1.23.1

WORKDIR /app

RUN go install github.com/cosmtrek/air@v1.40.4

CMD ["air"]
