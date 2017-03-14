#!/bin/bash

if [[ -z "$port" ]]; then
	echo "port not set, using default"
	port=5001
fi

if [ $server_int_net_floatingIp ]
then
	screen -d -m -S client iperf -c $server_int_net_floatingIp -t 360 -p $port
elif [ $server_softfire_test_floatingIp ]
then
	screen -d -m -S client iperf -c $server_softfire_test_floatingIp -t 360 -p $port
elif [ $server_softfire_internal_floatingIp ]
then
	screen -d -m -S client /bin/sh -c "iperf -c $server_softfire_internal_floatingIp -t 300; sh"
else
	screen -d -m -S client iperf -c $server_private_floatingIp -t 360 -p $port
fi
