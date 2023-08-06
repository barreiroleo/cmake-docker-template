.PHONY: build run
all: build run

build:
	cmake . -B build
	cd build && $(MAKE) -s

run:
	./build/bin/clang-ci

.PHONY: docker-build docker-run
docker: docker-build docker-run

docker-run:
	docker run clang-build

docker-build:
	docker buildx build -t clang-build .
