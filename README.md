[![repo standards badge](https://img.shields.io/badge/dynamic/json?color=blue&style=flat&logo=github&labelColor=32393F&label=MoJ%20Compliant&query=%24.result&url=https%3A%2F%2Foperations-engineering-reports.cloud-platform.service.justice.gov.uk%2Fapi%2Fv1%2Fcompliant_public_repositories%2Fstaff-infrastructure-monitoring-app-reachability)](https://operations-engineering-reports.cloud-platform.service.justice.gov.uk/public-github-repositories.html#staff-infrastructure-monitoring-app-reachability "Link to report")

# NVVS DevOps App Reachbility probe

This repo holds a lightweight all-in-one docker image for monitoring http endpoints and shipping metrics back to a central prometheus over the internet.
Essentially it's prometheus and blackbox exporter on the same container.

## Getting Started

To run this container successfully you will need 4 values.

`PROM_USER=<prometheus-basic-auth user>`

`PROM_PASS=<prometheus-basic-auth-password>`

`PROM_TARGET=<target-url-to-check>`

`REMOTE_WRITE_URL=<url-for-prometheus-remote-write-target>`

## Testing locally

### With Docker-Compose

Populate the fields in docker-compose.yml and run `docker compose up`

### With Docker

- Create a .env file `cp .env.example .env`
- Populate the fields
- Run `make run`
