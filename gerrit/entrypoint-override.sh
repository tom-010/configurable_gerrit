#!/bin/bash -e

echo "entrypoint override"
./configure-gerrit.sh & 

./entrypoint.sh

if [ "$1" != "init" ]
then
  echo "entrypoint override"
fi

