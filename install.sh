#!/bin/bash

set -ex

EVEKB_VERSION=4.2.32.0

if [[!-d web]]; then
  # download edk if no web directory exists
  wget http://evekb.org/downloads/EDK${EVEKB_VERSION}.zip

  unzip EDK${EVEKB_VERSION}.zip -d tmp
  mv tmp/evedev-kb-* web
  rm -fr tmp EDK*.zip

  touch web/kbconfig.php
fi

docker-compose build
docker-compose up -d

if [[ "$OSTYPE" == "darwin"* ]]; then
  # open kb in browser, works only for mac os x
  open "http://localhost:8736/"
fi

# show logs
docker-compose logs -t -f
