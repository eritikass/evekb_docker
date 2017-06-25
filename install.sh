#!/bin/bash

set -ex

EVEKB_VERSION=4.2.32.0

wget http://evekb.org/downloads/EDK${EVEKB_VERSION}.zip

unzip EDK${EVEKB_VERSION}.zip -d tmp
mv tmp/evedev-kb-* web
rm -fr tmp EDK*.zip

touch web/kbconfig.php

docker-compose build
docker-compose up
