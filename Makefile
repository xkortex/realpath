#
# This Makefile is for testing code only
# To compile or install, please use `go get`
# Read README.md for details
#

default:
	go build -i -ldflags="-X 'main.Version=v0.0.1337'" -o build/realpath

darwin_64:
	GOOS=darwin GOARCH=amd64 go build -i -ldflags="-X 'main.Version=v0.0.1337'" -o build/realpath-darwin_amd64

linux_64:
	GOOS=linux GOARCH=amd64 go build -i -ldflags="-X 'main.Version=v0.0.1337'" -o build/realpath-linux_amd64

linux_arm:
	GOOS=linux GOARCH=arm go build -i -ldflags="-X 'main.Version=v0.0.1337'" -o build/realpath-linux_arm

linux_arm64:
	GOOS=linux GOARCH=arm64 go build -i -ldflags="-X 'main.Version=v0.0.1337'" -o build/realpath-linux_arm64



test:
	go test -v ./...

.PHONY: test