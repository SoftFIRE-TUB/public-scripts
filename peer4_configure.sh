#!/bin/bash

if [ ! -f /home/ubuntu/identification ]; then
  hostname -I > /home/ubuntu/identification
fi
i=0
ncat $peer4_softfire_internal 9876 < /home/ubuntu/identification 

# in case the server was not ready yet
while [ $? -ne 0 ] && [ $i -lt 5 ]; do
  sleep 2
  i=$((i+1))
  ncat $peer4_softfire_internal 9876 < /home/ubuntu/identification 
done

if [ $? -ne 0 ]; then
  echo "Could not send ip address to host $peer4_softfire_internal"
else
  echo "Ip address $(cat /home/ubuntu/identification) sent to host $peer4_softfire_internal"
  echo "Peer4 at $peer4_softfire_internal" >> /home/ubuntu/sent
fi
