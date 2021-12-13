#!/bin/bash -e

cd /home/

# wait until gerrit is ready (=reachable)
bash -c 'while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' localhost:8080)" != "200" ]]; do sleep 5; done'


# if not happended already, clone the bare repo from the path
if [ ! -d All-Projects ]; then
    git clone /var/gerrit/git/All-Projects.git
fi


# make the change
cd All-Projects/
git reset --hard
cp /var/gerrit/etc/project.config project.config -f
git add .
git commit -am "auto-config from project.config"
git push /var/gerrit/git/All-Projects.git HEAD:refs/meta/config

echo $LDAP_ADMIN_PASSWORD
echo "username=gerritadmin&password=$LDAP_ADMIN_PASSWORD&rememberme=1"

# make gerritadmin the admin by logging in first
# (the first user that logs into gerrit becomes admin by convention)
curl -s \
    -d "username=gerritadmin&password=$LDAP_ADMIN_PASSWORD&rememberme=1" \
    -H "Content-Type: application/x-www-form-urlencoded" \
    -X POST http://localhost:8080/login/%2Fq%2Fstatus%3Aopen%2B-is%3Awip

echo "Gerrit configured"