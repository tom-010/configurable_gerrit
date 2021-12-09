#!/bin/bash -e

cd /home/

bash -c 'while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' localhost:8080)" != "200" ]]; do sleep 5; done'

git clone /var/gerrit/git/All-Projects.git

cd All-Projects/
cp /initial-project.config project.config -f
git add .
git commit -am "new initial config, provided by the container"
git push /var/gerrit/git/All-Projects.git HEAD:refs/meta/config

echo "Gerrit configured"