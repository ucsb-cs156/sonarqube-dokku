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

With name sonarqube:
```
dokku apps:create sonarqube
dokku config:set sonarqube --no-restart SONAR_WEB_PORT=5000
dokku postgres:create sonarqube-db
dokku postgres:link  sonarqube-db sonarqube --no-restart
dokku git:sync sonarqube https://github.com/ucsb-cs156/sonarqube-dokku main --build
```

These may or may not work:

```
dokku letsencrypt:set sonarqube email yourEmail@ucsb.edu
dokku letsencrypt:enable sonarqube
```

# Removing so you can start over

```
dokku postgres:unlink sonarqube-db sonarqube --no-restart
dokku postgres:destroy sonarqube-db --force
dokku apps:destroy sonarqube --force
```

# Dokku port commands

```
dokku ports:report sonarqube
dokku ports:set sonarqube http:80:5000
```

