all: build run

build:
	mkdir -p build
	clang++ src/main.cpp -o build/main

run:
	./build/main
