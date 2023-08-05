FROM ubuntu:22.04 AS builder

ENV APPDIR=/app
RUN apt-get update && apt-get --no-install-recommends -y install git cmake make clang
WORKDIR ${APPDIR}/
COPY . .
RUN make build

FROM ubuntu:22.04
ENV APPDIR=/app
WORKDIR ${APPDIR}/
COPY --from=builder ${APPDIR}/build/main .
CMD [ "/app/main" ]
