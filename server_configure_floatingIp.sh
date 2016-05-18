#!/bin/bash

if [ $server_int_net_floatingIp ]
then
	screen -d -m -S client iperf -c $server_int_net_floatingIp -t 300
else
	if [ $server_softfire_test_floatingIp ]
		screen -d -m -S client iperf -c $server_softfire_test_floatingIp -t 300
	else
		screen -d -m -S client iperf -c $server_private_floatingIp -t 300
fi
