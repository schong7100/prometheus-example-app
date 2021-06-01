VERSION:=$(shell cat VERSION)

IMAGE_NAME ?= prometheus-example-app

LDFLAGS="-X main.appVersion=$(VERSION)"

.PHONY : all build image

all: build image

build:
	CGO_ENABLED=0 go build -ldflags=$(LDFLAGS) -o prometheus-example-app --installsuffix cgo main.go

image: build
	docker build -t ghcr.io/rhobs/$(IMAGE_NAME):$(VERSION) .
