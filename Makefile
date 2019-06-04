CONTAINER_REGISTRY = us.icr.io
IMAGE = $(CONTAINER_REGISTRY)/git-defenders/redis_exporter:latest

login-container-registry:
ifdef DEPLOY_API_KEY
	@echo $(DEPLOY_API_KEY) | docker login -u iamapikey --password-stdin $(CONTAINER_REGISTRY)
endif

build-image:
	@docker build -t redis_exporter .

push-image: build-image
	docker tag redis_exporter $(IMAGE)
	docker push $(IMAGE)

