all: build run

build:
	cmake . -B build
	cd build && $(MAKE)

run:
	./build/bin/clang-ci

docker: docker-build docker-run

docker-run:
	docker run clang-build

docker-build:
	docker buildx build -t clang-build .
