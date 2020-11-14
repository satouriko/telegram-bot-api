FROM alpine
RUN apk update \
    && apk upgrade \
    && apk add --update alpine-sdk linux-headers git zlib-dev openssl-dev gperf cmake
RUN git clone --recursive https://github.com/tdlib/telegram-bot-api.git \
    && cd telegram-bot-api \
    && rm -rf build \
    && mkdir build \
    && cd build \
    && cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=.. .. \
    && cmake --build . --target install
ENTRYPOINT ["/telegram-bot-api/bin/telegram-bot-api"]
CMD ["--local"]
