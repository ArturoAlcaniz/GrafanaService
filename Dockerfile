FROM grafana/grafana:latest
USER root
RUN apt-get update
RUN apt-get install git -y
RUN --mount=type=secret,id=env \
    git clone "https://$(grep TOKEN_GIT /run/secrets/env | cut -d'=' -f 2-)@github.com/ArturoAlcaniz/GrafanaService.git" /app/GrafanaService/