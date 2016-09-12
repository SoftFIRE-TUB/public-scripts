#!/bin/bash

export LC_ALL=C

shard_uri="$shard_softfire_internal_floatingIp:$shard_port"

echo $shard_uri
echo "sh.addShard('$shard_uri')" > addShard.js

if [ -z $database ]; then
       	database=softfire
fi

echo "sh.enableSharding('$database')" >> addShard.js

mongo --port $port < addShard.js
