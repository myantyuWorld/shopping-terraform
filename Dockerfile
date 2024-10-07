# FROM --platform=linux/x86_64 golang:latest
FROM golang:1.22 AS local

RUN mkdir /go/src/work

WORKDIR /go/src/work

COPY . /go/src/work

CMD ["go", "run", "main.go"]