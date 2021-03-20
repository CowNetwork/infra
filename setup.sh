#/bin/bash

terraform -chdir=tf init
pipenv sync && pipenv shell && ansible-galaxy install -r requirements.yaml
