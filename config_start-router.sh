#!/bin/bash

export LC_ALL=C

screen -d -m -S router mongos --port $port --configdb $config_int_net_floatingIp:$port

#while ! nc -z localhost $port; do
#  sleep 0.5 # wait for 1/10 of the second before check again
#done

echo "mongodb router is running"

# just for security.....
sleep 7
