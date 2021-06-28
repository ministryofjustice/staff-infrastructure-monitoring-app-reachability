# Inputs: 
#    Url(s) to monitor
#    Prometheus instance to write to
#    Credentials for writing to it

# TODO:
#  - get some config in
#  - make sure that config is populated with the right stuff

FROM prom/prometheus:latest

COPY config/prometheus.yml /etc/prometheus/prometheus.yml
COPY config/blackbox.yml /etc/blackbox_exporter/blackbox.yml
COPY build/blackbox_exporter /bin/blackbox_exporter

WORKDIR /agent
COPY ./run.sh run.sh

ENTRYPOINT [ "sh", "./run.sh" ]
