FROM arturoalcaniz/node-image:latest
RUN --mount=type=secret,id=env \
    git clone "https://$(grep TOKEN_GIT /run/secrets/env | cut -d'=' -f 2-)@github.com/ArturoAlcaniz/GrafanaService.git" /app/GrafanaService/
RUN apt-get install -y apt-transport-https
RUN apt-get install -y software-properties-common wget
RUN wget -q -O /usr/share/keyrings/grafana.key https://apt.grafana.com/gpg.key
RUN echo "deb [signed-by=/usr/share/keyrings/grafana.key] https://apt.grafana.com stable main" | tee -a /etc/apt/sources.list.d/grafana.list
RUN apt-get update
RUN apt-get install grafana
RUN apt-get install grafana-enterprise