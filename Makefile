.PHONY: build run
all: build run

build:
	cmake -B build .
	cmake --build build
	if [ -h compile_commands.json ]; then rm compile_commands.json; fi
	ln -s ./build/compile_commands.json .

run:
	./build/bin/clang-ci

.PHONY: docker-build docker-export docker-run
docker: docker-build docker-export docker-run

docker-run:
	docker run clang-build

docker-build:
	docker buildx build -t clang-build .

docker-export:
	docker buildx build --output=. --target=json_export .
