DOCKER		= docker
DOCKERFILE	= Dockerfile
PORT       	= 8080
TAG        	= yaml2resume
LINT_IGNORE	= "DL3007"
PACK       	= pack
BUILDER_CNF	= ./builder/builder.toml
BUILDER_IMG	= my-builder:bionic
CONTAINER	= k3d-on-docker_dind_1
INPUT		= /work/input.yaml
OUTPUT		= /work/output.pdf

all: hadolint build

hadolint:
	$(DOCKER) run --rm -i hadolint/hadolint hadolint - --ignore ${LINT_IGNORE} < $(DOCKERFILE)

build:
	$(DOCKER) buildx build -t $(TAG) --load .

run:
	$(DOCKER) run --rm -d --name resume -v ${PWD}:/work $(TAG) ruby make_cv.rb -i $(INPUT) -o $(OUTPUT)

clean:
	$(DOCKER) rm -f $(TAG)
	$(DOCKER) container prune -f

