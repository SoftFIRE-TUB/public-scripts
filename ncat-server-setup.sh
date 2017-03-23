#!/bin/bash

err="$(tmux new -d -s ncatserver 'ncat -l 9876 -k >> /home/ubuntu/received' 2>&1)"

if [ -n "$err" ]; then
  echo "ncat server was not set up. error message was $err"
else
  echo "ncat server running"
fi
