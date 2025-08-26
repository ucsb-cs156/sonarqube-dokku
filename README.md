# sonarqube-dokku
Files to set up SonarQube on Dokku


# Dokku Setup


With name sq:

```
dokku apps:create sq
dokku postgres:create sq-db
dokku postgres:link  sq-db sq --no-restart
dokku git:sync sq https://github.com/ucsb-cs156/sonarqube-dokku main --build
```

# Removing so you can start over

```
dokku postgres:unlink sq-db sq --no-restart
dokku postgres:destroy sq-db --force
dokku apps:destroy sq --force
```

These may or may not work:

```
dokku letsencrypt:set sq email phtcon@ucsb.edu
dokku letsencrypt:enable sq
```



# Dokku port commands

```
dokku ports:report sonarqube
dokku ports:set sonarqube http:80:9000
```

