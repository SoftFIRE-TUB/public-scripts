#!/bin/bash
# used for the integration tests

sudo apt-get update && sudo apt-get install -y nmap && sudo apt-get install -y tmux

# check if ncat and tmux are installed
command -v ncat > /dev/null
if [ $? -ne 0 ]
then 
  >&2 echo "ncat was not installed successfully"
else
  echo "ncat is installed"
fi
command -v tmux > /dev/null
if [ $? -ne 0 ]
then
  >&2 echo "tmux was not installed successfully"
else
  echo "tmux is installed"
fi
