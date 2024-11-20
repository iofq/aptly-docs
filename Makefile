all: prepare develop

prepare:
	go install github.com/gohugoio/hugo@latest

develop: prepare
	hugo server -D
