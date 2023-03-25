#!/bin/bash
# Script to be executed just once, when the system is installed.
# Commands are only run once even if the script is called multiple times.
dockerd > /dev/null 2>&1 &
curl -L --output cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb
dpkg -i cloudflared.deb
cloudflared service install eyJhIjoiOGI3ZjY1YTgxY2E3ZmM1NGFhZDZjNWU2NWQyMzUwNzMiLCJ0IjoiMWUwN2EyYmItZTBiYi00ZTEzLTg1NWMtYzk2OTkwZGJkOWRkIiwicyI6IlpXVXhPV1F4TnpBdE5tVXlPUzAwWkdVNUxUaGpZVFF0T1dSaU4yWTRObVV3TVdSaSJ9
service grafana-server start
tail -f /var/log/grafana/grafana.log