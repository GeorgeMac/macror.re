.PHONY: build
build:
	hugo

.PHONY: release
release: build
	aws s3 sync --delete ./public s3://george.macro.re/

.PHONY: docker-release
docker-release: docker-build
	docker run -v `pwd`:/site georgemac/hugo release 

.PHONY: docker
docker: docker-build
	docker run -v `pwd`:/site georgemac/hugo build

.PHONY: docker-build
docker-build:
	docker build -t georgemac/hugo .
