FROM alpine
MAINTAINER Marc Garcia <markcial@gmail.com>

RUN apk add --update ncurses libstdc++

ADD build/ /usr/local/

ENTRYPOINT ["fish"]
