#!/usr/bin/env bash

c=$(curl http://localhost:8736)

if [[ $c != *"Connection refused"* ]] || [[ $c != *"Unable to connect to mysql database."* ]]; then
  # all ok
  exit 0
fi

echo $(date +%Y-%m-%d:%H:%M:%S) " - restart docker * start" >> restart.log

service docker restart >> restart.log

echo $(date +%Y-%m-%d:%H:%M:%S) " - restart docker * end" >> restart.log
