# Inputs: 
#    Url(s) to monitor
#    Prometheus instance to write to
#    Credentials for writing to it

# TODO:
#  - run prometheus
#  - run blackbox alongside
#  - get some config in
#  - make sure that config is populated with the right stuff

FROM prom/prometheus:latest

COPY build/blackbox_exporter /bin/blackbox_exporter

WORKDIR /agent
COPY ./run.sh run.sh

ENTRYPOINT [ "run.sh" ]
