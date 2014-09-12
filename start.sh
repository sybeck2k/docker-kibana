#!/bin/bash

# Write the configs
/opt/kibana/bin/write-nginx-config.sh
/opt/kibana/bin/write-kibana-config.sh

exec /usr/sbin/nginx
