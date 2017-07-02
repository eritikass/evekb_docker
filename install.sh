#!/bin/bash

set -ex

# TODO: get latest version from http://evekb.org/downloads/update2.xml
EVEKB_VERSION=4.2.32.0

if [[ ! -d "web" ]]; then
  # download edk if no web directory exists
  wget http://evekb.org/downloads/EDK${EVEKB_VERSION}.zip

  unzip EDK${EVEKB_VERSION}.zip -d tmp
  mv tmp/evedev-kb-* web
  rm -fr tmp EDK*.zip

  touch web/kbconfig.php
fi

function downloadMod() {
  modname=$1
  modurl=$2
  dirname=$3
  if [ -z "$dirname" ]; then
      dirname=$1
  fi

  rm -fr tmp
  mkdir -p tmp
  wget "$modurl" -O tmp/mod_$modname.zip
  unzip tmp/mod_$modname.zip -d tmp/mod_$modname

  rm -fr web/mods/$modname
  cp -r tmp/mod_$modname/$dirname web/mods/$modname
  rm -fr tmp
}

# download mods
downloadMod "mostexp" "http://www.evekb.org/forum/download/file.php?id=1155&sid=9ad499b4c23708f66aef699b848c727d"
downloadMod "info_links" "https://github.com/Salvoxia/info_links/archive/master.zip" "info_links-master/info_links"
downloadMod "dotlan_mod" "http://www.evekb.org/forum/download/file.php?id=1113"
downloadMod "serverstatus" "http://www.evekb.org/forum/download/file.php?id=1144"
downloadMod "realmoney_mod" "https://github.com/6RUN0/realmoney_mod/archive/master.zip" "realmoney_mod-master"
downloadMod "pilot_stats" "http://www.evekb.org/forum/download/file.php?id=1417"
downloadMod "advanced_search" "https://github.com/Salvoxia/advanced_search/archive/v2.7.3.zip" "advanced_search-2.7.3/advanced_search"

docker-compose build
docker-compose up -d

if [[ "$OSTYPE" == "darwin"* ]]; then
  # open kb in browser, works only for mac os x
  open "http://localhost:8736/"
fi

# show logs
docker-compose logs -t -f
