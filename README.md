Infrastructure
==============

This repo contains infrastructure as code for cow network.

Requirements
------------

* Have Terraform (>= 0.14.8) installed
* Have Python3 installed
* Have Pipenv installed

Usage
-----

### Setup

* Run `./setup.sh` to set up your local repo. 
* Set `$COW_NET_SSH_KEY` to your personal SSH key (Recommendation: Install [direnv](https://direnv.net/) and load it automatically)
* Create `tf/token.auto.tfvars` file and put in your hcloud API token like this `hcloud_token = "<mytoken>"`

**Note:** Always make sure you are in your virtual environment, if not execute `pipenv shell` otherwise all python modules will be missing.

### Initial server setup

When deploying the infrastructure from scratch, you have to use a SSH key we call `management-key` which functions basically as a bootstrap key. Add other SSH keys using this command:

```
$ ansible-playbook --private-key <management-key> add_ssh_keys_playbook.yaml -e servers=<groups>
```

The management key has to be set on all hcloud servers.

# TODO:
* support subgroups in `inventory.py`
