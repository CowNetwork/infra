Infrastructure
==============

This repo contains infrastructure as code for cow network.

Requirements
------------

* Have Terraform (>= 0.14.8) installed
* Have Pipenv installed

Usage
-----

* Run `./setup.sh` to set up your local repo. 
* Set `$COW_NET_SSH_KEY` to your personal SSH key

**Note:** Always make sure you are in your virtual environment, if not execute `pipenv shell` otherwise all python modules will be missing.

### Initial install

When deploying the infrastructure from scratch, you have to use an SSH key we call `management-key` which functions basically as a bootstrap key. Add other users SSH key using this command:

```
$ ansible-playbook --private-key <management-key> add_ssh_keys_playbook.yaml -e servers=<groups>
```

The management key has to be set on all hcloud servers.
