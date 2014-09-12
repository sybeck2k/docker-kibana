#!/bin/bash

NGINX_PORT=${NGINX_PORT:-80}
ELASTICSEARCH_HOST=${ELASTICSEARCH_HOST:-localhost}
ELASTICSEARCH_PORT=${ELASTICSEARCH_PORT:-9200}

cat > /etc/nginx/sites-enabled/nginx <<EOF
server {
  listen   $NGINX_PORT; ## listen for ipv4; this line is default and implied
  listen   [::]:$NGINX_PORT default ipv6only=on; ## listen for ipv6

  # Make site accessible from http://localhost/
  # server_name localhost;
  access_log /dev/stdout;

  location = /health {
    return 200;
    access_log off;
  }

  location / {
    root /opt/kibana;
    index index.html index.htm;
  }

  # Reverse proxy elasticsearch ajax calls
  location ~ ^/(_aliases|_nodes)$ {
    proxy_pass http://$ELASTICSEARCH_HOST:$ELASTICSEARCH_PORT;
    proxy_read_timeout 90;
  }
  location ~ ^/.*/(_aliases|_search)$ {
    proxy_pass http://$ELASTICSEARCH_HOST:$ELASTICSEARCH_PORT;
    proxy_read_timeout 90;
  }
  location ~ ^/.*/_mapping {
    proxy_pass http://$ELASTICSEARCH_HOST:$ELASTICSEARCH_PORT;
    proxy_read_timeout 90;
  }
  location ~ ^/kibana-int/dashboard/.*$ {
    proxy_pass http://$ELASTICSEARCH_HOST:$ELASTICSEARCH_PORT;
    proxy_read_timeout 90;
  }
  location ~ ^/kibana-int/temp.*$ {
    proxy_pass http://$ELASTICSEARCH_HOST:$ELASTICSEARCH_PORT;
    proxy_read_timeout 90;
  }
}
EOF
