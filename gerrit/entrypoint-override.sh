#!/bin/bash -e

echo "linking plugins"
ln -s /plugins/* /var/gerrit/plugins/ 2> /dev/null || true

# do not ru on init and only when the user provides a project.config
if [ "$1" != "init" ] && [ -f /var/gerrit/etc/project.config ]
then
  ./configure-gerrit.sh & # note, this runs in the background as it waits for the startup of gerrit, which happens in ./entrypoint.sh
fi

# as we only override the entrypoint, call it
./entrypoint.sh



