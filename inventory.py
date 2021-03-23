#!/usr/bin/python3


import subprocess
import json
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('--list', action='store_true')
parser.add_argument('--host', type=str)
args = parser.parse_args()

#bla = subprocess.run(['terraform', '-chdir=tf', 'state', 'pull'], capture_output=True, text=True)

state = {}
with open('statefile') as json_file:
  state = json.load(json_file)

server_resources = [x for x in state['resources'] if x['type'] == 'hcloud_server']

instances = []
for resource in server_resources:
  for instance in resource['instances']:
    instances.append(instance)

inventory = {
  '_meta': {
    'hostvars': {}
  },
  'all': {
    'hosts': [],
  },
}

# transform instances to ansible inventory hosts
for instance in instances:
  attrs = instance['attributes']
  name = attrs['name']

  inventory['_meta']['hostvars'][name] = {
    'ansible_host': attrs['ipv4_address']
  }
  
  groups = attrs['labels']['type'].split(',')
  for group in groups:
    inventory['all']['hosts'].append(name)
    
    if group not in inventory:
        inventory[group] = {'hosts':[]}
    group_entry = inventory[group]

    group_entry['hosts'].append(name)


if args.list:
  print(json.dumps(inventory))
elif args.host:
  print(json.dumps(inventory['_meta']['hostvars'][args.host]))

