FROM ubuntu:22.04 AS builder

RUN apt-get update && apt-get --no-install-recommends -y install git cmake make clang
WORKDIR /app
COPY . .
RUN make build
CMD ["./build/main"]
