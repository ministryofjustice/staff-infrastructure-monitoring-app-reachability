FROM prom/prometheus:latest

WORKDIR /agent

COPY config/prometheus.yml.tpl prometheus.yml.tpl
COPY config/blackbox.yml /etc/blackbox_exporter/blackbox.yml
COPY build/blackbox_exporter /bin/blackbox_exporter

COPY ./run.sh run.sh

ENTRYPOINT [ "sh", "./run.sh" ]
