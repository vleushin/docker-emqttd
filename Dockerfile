FROM debian:jessie

RUN apt-get update && \
    apt-get install -y wget unzip && \
    rm -rf /var/lib/apt/lists/* && \
    wget -q https://github.com/vleushin/emqttd/releases/download/0.8.6-beta-kafka/emqttd-ubuntu.tar.gz -O /tmp/emqttd.tar.gz && \
    tar -xf /tmp/emqttd.tar.gz -C /opt && \
    rm /tmp/emqttd.tar.gz
COPY start.sh /opt/emqttd/start.sh
EXPOSE 1883 8883

VOLUME ["/opt/emqttd/etc", "/opt/emqttd/data", "/opt/emqttd/plugins"]

CMD ["/opt/emqttd/start.sh"]
