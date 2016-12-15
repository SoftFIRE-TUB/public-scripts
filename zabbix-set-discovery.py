import urllib2
import json

url = 'http://localhost/zabbix/api_jsonrpc.php'
usr = 'admin'
pwd = 'zabbix'

req_auth = urllib2.Request(url)

req_auth.add_header('Content-Type', 'application/json-rpc')
req_auth.add_data('{ "jsonrpc": "2.0", "method": "user.login", "params": { "user": "%s", "password": "%s" }, "id": 1, "auth": null }' % (usr,pwd))

js = urllib2.urlopen(req_auth).read()

res = json.loads( js )

# print res

token = res['result']

req_action_update = urllib2.Request(url)

req_action_update.add_header('Content-Type', 'application/json-rpc')

req_action_update.add_data('{ "jsonrpc": "2.0", "method": "action.update", "params": { "actionid": "2", "status": "0" }, "id": 1, "auth": "%s" }' % token)

js = urllib2.urlopen(req_action_update).read()

res = json.loads( js )

req_drule_get = urllib2.Request(url)

req_drule_get.add_header('Content-Type', 'application/json-rpc')

req_drule_get.add_data('{ "jsonrpc": "2.0", "method": "drule.get", "params": { "output": "extend", "selectDChecks": "extend" }, "id": 1, "auth": "%s" }' % token)

js = urllib2.urlopen(req_drule_get).read()

res = json.loads( js )

# print res['result']

req_drule_update = urllib2.Request(url)

req_drule_update.add_header('Content-Type', 'application/json-rpc')

# print json.dumps(res['result'][0]['dchecks'])

req_drule_update.add_data('{ "jsonrpc": "2.0", "method": "drule.update", "params": { "druleid": "2", "status": "0", "delay": "30", "name" : "fokus network discovery", "iprange": "172.18.1.1-255", "dchecks": %s }, "id": 1, "auth": "%s" }' % (json.dumps(res['result'][0]['dchecks']), token))

js = urllib2.urlopen(req_drule_update).read()

res = json.loads( js )

# print res

req_drule_create = urllib2.Request(url)

req_drule_create.add_header('Content-Type', 'application/json-rpc')

# print json.dumps(res['result'][0]['dchecks'])

req_drule_create.add_data('{ "jsonrpc": "2.0", "method": "drule.create", "params": { "name": "ericsson network discovery", "delay": "30", "iprange": "10.44.57.1-255", "dchecks": [ { "type": "9", "key_": "system.uname", "ports": "10050", "uniq": "0" } ] }, "auth": "%s", "id": 1 }' % (token))

js = urllib2.urlopen(req_drule_create).read()

res = json.loads( js )

# print res

req_drule_create = urllib2.Request(url)

req_drule_create.add_header('Content-Type', 'application/json-rpc')

# print json.dumps(res['result'][0]['dchecks'])

req_drule_create.add_data('{ "jsonrpc": "2.0", "method": "drule.create", "params": { "name": "surrey network discovery", "delay": "30", "iprange": "10.5.21.1-255", "dchecks": [ { "type": "9", "key_": "system.uname", "ports": "10050", "uniq": "0" } ] }, "auth": "%s", "id": 1 }' % (token))

js = urllib2.urlopen(req_drule_create).read()

res = json.loads( js )

print res
