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

## Thank you

* https://github.com/openfrontier/docker-gerrit