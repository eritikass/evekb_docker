#!/usr/bin/env sh

touch /tmp/cronlogs
crond -s /etc/cron.d -b -L /tmp/cronlogs
tail -f /tmp/cronlogs
