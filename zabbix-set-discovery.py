import urllib2
import json

url = 'http://localhost/zabbix/api_jsonrpc.php'
usr = 'admin'
pwd = 'zabbix'

req_auth = urllib2.Request(url)

req_auth.add_header('Content-Type', 'application/json-rpc')
req_auth.add_data('{ "jsonrpc": "2.0", "method": "user.login", "params": { "user": "%s", "%s": "zabbix" }, "id": 1, "auth": null }' % (usr,pwd))

js = urllib2.urlopen(req_auth).read()
print "deconding %s" % js

res = json.loads( js )

print res['result']

req_action_update = urllib2.Request(url)

req_action_update.add_header('Content-Type', 'application/json-rpc')

req_auth.add_data('{ "jsonrpc": "2.0", "method": "action.update", "params": { "actionid": "2", "status": "0" }, "id": 1, "auth": "%s"" }' % res['result'])

js = urllib2.urlopen(req_auth).read()
print "deconding %s" % js

res = json.loads( js )

print res