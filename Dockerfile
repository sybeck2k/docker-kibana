FROM ubuntu:14.04

RUN apt-get update && apt-get -y upgrade && apt-get -y install wget nginx-full

WORKDIR /opt
RUN wget https://download.elasticsearch.org/kibana/kibana/kibana-3.1.0.tar.gz
RUN tar xf kibana-3.1.0.tar.gz && mv kibana-3.1.0 kibana && rm kibana-3.1.0.tar.gz

# Setup base nginx config.
RUN rm /etc/nginx/sites-enabled/*
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN echo "error_log /dev/stdout info;" >> /etc/nginx/nginx.conf

## Add scripts
ADD scripts/write-kibana-config.sh /opt/kibana/bin/write-kibana-config.sh
ADD scripts/write-nginx-config.sh /opt/kibana/bin/write-nginx-config.sh
RUN chmod +x /opt/kibana/bin/*sh

# Start the stuff
ADD start.sh /opt/kibana/bin/start.sh
RUN chmod +x /opt/kibana/bin/start.sh
CMD ["/opt/kibana/bin/start.sh"]
