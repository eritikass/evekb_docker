# evekb docker setup

Docker setup for [evekb killboard](https://github.com/evekb/evedev-kb).

First time run, to download edk and some mods.

`./install.sh`

Open edk in http://your-hostname:8736/ and follow instructions for setup.

Start or stop later using:

`docker-compose up -d` / `docker-compose down -d`

If you need to use custom hostname/https use proxy, 
[apache example config](https://github.com/eritikass/evekb_docker/blob/master/apache-proxy-example.conf) provided or Google one that works for you.
