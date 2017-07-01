# evekb docker setup

Docker setup for [evekb killboard](https://github.com/evekb/evedev-kb).

First time run, to download edk and some mods.

`./install.sh`

Open edk in http://your-hostname:8736/ and follow instructions for setup, ([mysql settings](https://github.com/eritikass/evekb_docker/blob/0f7317af0d8cc00546e861ea1764b06020e3c3ed/docker-compose.yml#L34-L36)).

Start or stop later using:

`docker-compose up -d` / `docker-compose down -d`

If you need to use custom hostname/https use proxy, 
[apache example config](https://github.com/eritikass/evekb_docker/blob/master/apache-proxy-example.conf) provided or Google one that works for you.
