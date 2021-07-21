global:
  scrape_timeout:      60s 
  scrape_interval:     180s 
  evaluation_interval: 60s
  external_labels:
    environment: production #{{ENVIRONMENT}}

remote_write:
  - url: REMOTE_WRITE_URL #{{REMOTE_WRITE_URL}}
    basic_auth:
        username: USER
        password: PASS
    metadata_config:
      send: false

scrape_configs:
  - job_name: prometheus
    honor_labels: true
    static_configs:
      - targets:
        - localhost:9090
    metrics_path: /metrics

# Blackbox Exporter probes endpoints over HTTP, HTTPS, DNS, TCP or ICMP protocols, returning detailed metrics about the request,
# including whether or not it was successful and how long it took to receive a response.
  - job_name: 'blackbox-http'
    metrics_path: /probe
    params:
      module: [http_2xx] # Look for a HTTP 200 response
    static_configs:
      - targets:
        # External DNS 
        - 1.1.1.1 # Cloudflare
        - 25.25.25.25 # NCSC PDNS
        - 25.26.27.28 # NCSC PDNS
        - www.ppud.gsi.gov.uk
        - https://bbc.co.uk/
        - gateway-f.internal.vpn.justice.gov.uk
        - a03.wp360g.svcs.hp.com


    relabel_configs:
      - source_labels: [__address__]
        target_label: __param_target
      - source_labels: [__param_target]
        target_label: instance
      - target_label: __address__
        replacement: localhost:9115 # Blackbox Exporter hostname:port