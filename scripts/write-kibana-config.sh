#!/bin/bash

ELASTICSEARCH_HOST=${ELASTICSEARCH_HOST:-localhost}
ELASTICSEARCH_PORT=${ELASTICSEARCH_PORT:-9200}

cat > /opt/kibana/config.js <<EOF
define(['settings'],
function (Settings) {
  return new Settings({
    elasticsearch: 'http://$ELASTICSEARCH_HOST:$ELASTICSEARCH_PORT',
    default_route     : '/dashboard/file/default.json',
    kibana_index: "kibana-int",
    panel_names: [
      'histogram',
      'map',
      'goal',
      'table',
      'filtering',
      'timepicker',
      'text',
      'hits',
      'column',
      'trends',
      'bettermap',
      'query',
      'terms',
      'stats',
      'sparklines'
    ]
  });
});
EOF
