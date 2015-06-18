#!/bin/bash
/opt/emqttd/bin/emqttd start && sleep 10 &&  tail -f --retry /opt/emqttd/log/*
