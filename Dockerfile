FROM debian:jessie

RUN apt-get update && \
    apt-get install -y wget && \
    rm -rf /var/lib/apt/lists/* && \
    wget -q http://emqtt.io/static/brokers/emqttd-ubuntu64-0.8.2-alpha-20150601.tgz -O /tmp/emqttd.tgz && \
    tar xfz /tmp/emqttd.tgz -C /opt && \
    rm /tmp/emqttd.tgz

EXPOSE 1883 8883

WORKDIR /opt/emqtdd

VOLUME ["/opt/emqttd/etc", "/opt/emqttd/data"]

ENTRYPOINT ["/opt/emqttd/bin/emqttd"]
CMD ["console"]
