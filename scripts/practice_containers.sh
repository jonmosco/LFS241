#!/bin/bash
#
# Various practice/demo containers to use with training exercises

# Grafana
function run_grafana() {
    docker run -d -p 3000:3000 --name grafana grafana/grafana:5.2.4
}

# cAdvisor
function run_cadvisor() {
    docker run \
        --volume=/:/rootfs:ro \
        --volume=/var/run:/var/run:ro \
        --volume=/sys:/sys:ro \
        --volume=/var/lib/docker/:/var/lib/docker:ro \
        --volume=/dev/disk/:/dev/disk:ro \
        --publish=8080:8080 \
        --detach=true \
        --name=cadvisor \
        google/cadvisor:v0.30.2
}
