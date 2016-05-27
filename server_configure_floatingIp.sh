#!/bin/bash

if [[ -z "$port" ]]; then
	echo "port not set, using default"
	port=5001
fi

if [ $server_int_net_floatingIp ]
then
	screen -d -m -S client iperf -c $server_int_net_floatingIp -t 300 -p $port
elif [ $server_softfire_test_floatingIp ]
then
	screen -d -m -S client iperf -c $server_softfire_test_floatingIp -t 300 -p $port
else
	screen -d -m -S client iperf -c $server_private_floatingIp -t 300 -p $port
fi
