FROM ubuntu:14.04

MAINTAINER Roberto Migli <robertomigli@gmail.com>

RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install wget nginx-full

# Get confd
RUN wget -O /confd https://github.com/kelseyhightower/confd/releases/download/v0.6.0-alpha3/confd-0.6.0-alpha3-linux-amd64
RUN chmod +x /confd

WORKDIR /opt
RUN wget -O- https://download.elasticsearch.org/kibana/kibana/kibana-3.1.0.tar.gz | tar xvfz -

# Add files
ADD ./confd /etc/confd
ADD ./bin/run.sh /run.sh

RUN rm /etc/nginx/sites-enabled/*
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN echo "error_log /dev/stdout info;" >> /etc/nginx/nginx.conf

# Start the container
RUN chmod +x /run.sh
CMD /run.sh

EXPOSE 80
