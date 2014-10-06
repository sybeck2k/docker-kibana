#!/bin/bash
set -e

# Write the configs
/opt/kibana/bin/write-kibana-config.sh

exec /opt/kibana/bin/kibana
