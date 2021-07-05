# CloudOps App Reachbility probe

This repo holds a lightweight all-in-one docker image for monitoring http endpoints and shipping metrics back to a central prometheus over the internet.
Essentially it's prometheus and blackbox exporter on the same container.

## Getting Started

To run this container successfully you will need 4 values.

`PROM_USER=<prometheus-basic-auth user>`

`PROM_PASS=<prometheus-basic-auth-password>`

`PROM_TARGET=<target-url-to-check>`

`REMOTE_WRITE_URL=<url-for-prometheus-remote-write-target>`
