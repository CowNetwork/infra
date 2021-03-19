Infrastructure
==============

This repo contains infrastructure as code for cow network.


Requirements
------------

* Have Terraform installed
* Have Pipenv installed

Usage
-----

Run the following command to sync the packages from `Pipfile.lock`

```
$ pipenv sync
```

after that create a shell session for the virtual environment

```
$ pipenv shell
```

install all needed ansible roles and collections 

```
$ ansible-galaxy install -r requirements.yaml
```
