#!/bin/bash

export LC_ALL=C

mongo --port $port --eval  "sh.addShard( '`echo $shard_softfire_internal_floatingIp:$shard_port`' )"

mongo --port $port --eval  'sh.enableSharding("softfire")'
