Configurable Gerrit
===================

The problem with the normal gerrit docker-container is, that it is not 
straightforward to install plugins or to provide a `project.config` that 
is applied to the repo `All-Projects` from which the settings are 
inherited for the new repositories.

## Getting started

Move `example.env` to `.env` and edit it. Here, the initial password 
of gerritadmin is saved. Default is username `gerritadmin` with password 
`secret`.

Remember that the first user that logs in becomes admin, thut is is a good
idea to login immediatly.

Add this to your `/etc/hosts`: 
```
127.0.0.1   review.firmenessen.de
```

Start the containers by 


```
docker-compose up --build 
```

Delete all volumes (for a fresh start by)


```
docker-compose down -v
```

## The project.config

Please note that the `project.config` allows EVERYTHING to every 
registered user. The best strategy to create your own is to delete 
it, go to gerrit > `Repositories` > `All Projects` > `Access` > `Edit`. 
Then Go to `Repositories` > `All Projects` > `Browse`, select the 
last commit, open project.config and use that.

## Plugins 

Download the (.jar) plugins from [gerritforge](https://gerrit-ci.gerritforge.com/) and 
place them into `conf/gerrit/plugins` (which is mounted in the `docker-compose.yml`).
They will be loaded on container-startup.

If you don't want to stop the container after adding a plugin, you can also do
1. `docker exec -it configurable_gerrit_review_1 /bin/bash`
2. `ln -s /plugins/* /var/gerrit/plugins/ 2> /dev/null || true` (see `entrypoint-override.sh`) 

As soon as a plugin is added, it will update automatically, if you override it.

## Thank you

* https://github.com/openfrontier/docker-gerrit