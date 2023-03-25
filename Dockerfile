FROM grafana/grafana:latest
RUN whoami
RUN groupadd -g 1000 AB_DOCKER_SETUP_GROUP
RUN --mount=type=secret,id=env \
    git clone "https://$(grep TOKEN_GIT /run/secrets/env | cut -d'=' -f 2-)@github.com/ArturoAlcaniz/GrafanaService.git" /app/GrafanaService/