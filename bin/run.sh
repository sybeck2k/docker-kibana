#!/bin/bash

# Fail hard and fast
set -eo pipefail

export ETCD_PORT=${ETCD_PORT:-4001}
export ETCD_HOST_IP=${ETCD_HOST_IP:-172.17.42.1}
export ETCD=$ETCD_HOST_IP:4001
export CONFD_BACKEND=${CONFD_BACKEND:-env}
export ELASTICSEARCH_HOST=${ELASTICSEARCH_HOST:-172.17.42.1}

/usr/sbin/nginx &

# Loop until confd has updated the logstash config
/confd -interval 30 -backend $CONFD_BACKEND -node $ETCD -config-file /etc/confd/conf.d/nginx.toml

