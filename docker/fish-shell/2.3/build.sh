#!/bin/bash

docker run -d -v $(pwd)/src:/source -v $(pwd)/build:/build -w /source --name builder alpine top
docker exec -i builder apk add --update alpine-sdk autoconf ncurses-terminfo-base ncurses-terminfo \
  ncurses-libs ncurses-dev
docker exec -i builder git clone https://github.com/fish-shell/fish-shell /source
docker exec -i builder autoconf
docker exec -i builder ./configure --prefix=/build
docker exec -i builder make
docker exec -i builder make install
docker rm -f builder
rm src -Rf
docker build -t fisherman/fish-shell:2.3 .
docker tag fisherman/fish-shell:2.3 fisherman/fish-shell:2.3
docker push fisherman/fish-shell:2.3
rm build -Rf
