FROM golang:latest

ENV REPO_DIR=github.com/xkortex/realpath

COPY . $GOPATH/src/$REPO_DIR

WORKDIR $GOPATH/src/$REPO_DIR

RUN     make default \
    &&  make test