#!/bin/bash

/bin/blackbox_exporter --config.file=/etc/blackbox_exporter/blackbox.yml &
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start blackbox exporter: $status"
  exit $status
fi

/bin/prometheus --config.file=/etc/prometheus/prometheus.yml &
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start prometheus: $status"
  exit $status
fi

while sleep 60; do
  ps aux |grep blackbox_exporter |grep -q -v grep
  BLACKBOX_STATUS=$?
  ps aux |grep prometheus |grep -q -v grep
  PROMETHEUS_STATUS=$?
  
  if [ $BLACKBOX -ne 0 -o $PROMETHEUS_STATUS -ne 0 ]; then
    echo "Blackbox or Prometheus has exited"
    exit 1
  fi
done

