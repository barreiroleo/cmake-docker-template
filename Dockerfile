FROM ubuntu:22.04 AS builder
RUN apt-get update && apt-get --no-install-recommends -y install git cmake make clang
WORKDIR /app
COPY . .
RUN make build

FROM scratch AS json_export
COPY --from=builder /app/build/compile_commands.json /

FROM ubuntu:22.04
ENV APPDIR=/app
WORKDIR ${APPDIR}/
COPY --from=builder ${APPDIR}/build/bin bin/
# COPY --from=builder ${APPDIR}/build/lib lib/
CMD [ "/app/bin/clang-ci" ]
