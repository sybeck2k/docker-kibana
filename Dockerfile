FROM registry.banno-internal.com/java

RUN apt-get update && apt-get -y upgrade && apt-get -y install wget

WORKDIR /opt
RUN wget https://download.elasticsearch.org/kibana/kibana/kibana-4.0.0-BETA1.tar.gz
RUN tar xf kibana-4.0.0-BETA1.tar.gz && mv kibana-4.0.0-BETA1 kibana && rm kibana-4.0.0-BETA1.tar.gz

## Add scripts
ADD scripts/write-kibana-config.sh /opt/kibana/bin/write-kibana-config.sh
RUN chmod +x /opt/kibana/bin/*sh

# Start the stuff
ADD start.sh /opt/kibana/bin/start.sh
RUN chmod +x /opt/kibana/bin/start.sh
CMD ["/opt/kibana/bin/start.sh"]
