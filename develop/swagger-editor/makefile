SHELL=/bin/bash

up:
	docker run \
		--name swagger-editor \
		-p 127.0.0.1:8888:8080 \
		-d \
		$(DOCKER_CUSTOM_NETWORK) \
		swaggerapi/swagger-editor

down:
	docker stop swagger-editor
	docker rm swagger-editor

.PHONY: up down
