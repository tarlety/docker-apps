SHELL=/bin/bash

build:
	docker build \
		${DOCKER_CUSTOM_NETWORK} \
		-t mermade/openapi-gui \
		.

up:
	docker run \
		--name openapi-gui \
		-p 127.0.0.1:80:3000 \
		-d \
		$(DOCKER_CUSTOM_NETWORK) \
		mermade/openapi-gui

down:
	docker stop openapi-gui
	docker rm openapi-gui

.PHONY: build up down
