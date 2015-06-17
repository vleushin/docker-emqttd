FROM debian:jessie

RUN apt-get update && \
    apt-get install -y wget unzip && \
    rm -rf /var/lib/apt/lists/* && \
    wget -q http://emqtt.io/static/brokers/emqttd-ubuntu64-0.8.5-beta-20150610.zip -O /tmp/emqttd.zip && \
    unzip /tmp/emqttd.zip -d /opt && \
    rm /tmp/emqttd.zip

EXPOSE 1883 8883

WORKDIR /opt/emqtdd

VOLUME ["/opt/emqttd/etc", "/opt/emqttd/data"]

ENTRYPOINT ["/opt/emqttd/bin/emqttd"]
CMD ["console"]
