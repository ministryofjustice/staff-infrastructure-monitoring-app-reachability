#!/bin/bash

cp prometheus.yml.tpl prometheus.yml

sed -i 's#USER#'$IMA_USER'#g' prometheus.yml
sed -i 's#PASS#'$IMA_PASS'#g' prometheus.yml
sed -i 's#TARGET#'$IMA_TARGET'#g' prometheus.yml
sed -i 's#IMAP_PROMETHEUS_URL#'$IMAP_PROMETHEUS_URL'#g' prometheus.yml

/bin/blackbox_exporter --config.file=/etc/blackbox_exporter/blackbox.yml &
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start blackbox exporter: $status"
  exit $status
fi

/bin/prometheus --config.file=prometheus.yml &
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
  
  if [ $BLACKBOX_STATUS -ne 0 -o $PROMETHEUS_STATUS -ne 0 ]; then
    echo "Blackbox or Prometheus has exited"
    exit 1
  fi
done

