#!/bin/bash

if [[ -z "$port" ]]; then
	echo "port not set, using default"
	port=5001
fi

screen -d -m -S server iperf -s -p $port
