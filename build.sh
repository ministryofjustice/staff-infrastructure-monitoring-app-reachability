#! /bin/bash

mkdir tmp
curl -L https://github.com/prometheus/blackbox_exporter/releases/download/v0.19.0/blackbox_exporter-0.19.0.linux-amd64.tar.gz --output ./tmp/bb.tar.gz
tar -xzvf tmp/bb.tar.gz -C ./tmp
mv ./tmp/blackbox_exporter-0.19.0.linux-amd64/blackbox_exporter ./build/
