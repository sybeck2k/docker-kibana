#!/bin/bash
set -e

KIBANA_PORT=${KIBANA_PORT:-80}
ELASTICSEARCH_HOST=${ELASTICSEARCH_HOST:-localhost}
ELASTICSEARCH_PORT=${ELASTICSEARCH_PORT:-9200}

cat > /opt/kibana/config/kibana.yml <<EOF
port: $KIBANA_PORT
elasticsearch: "http://$ELASTICSEARCH_HOST:$ELASTICSEARCH_PORT"
kibanaIndex: "kibana-int"

apps:
  - { id: "discover", name: "Discover" }
  - { id: "visualize", name: "Visualize" }
  - { id: "dashboard", name: "Dashboard" }
  - { id: "settings", name: "Settings" }
defaultAppId: "discover"
EOF
