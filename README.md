# sonarqube-dokku
Files to set up SonarQube on Dokku


# Dokku Setup

```
dokku apps:create sonar
dokku config:set sonar --no-restart SONAR_WEB_PORT=5000
dokku postgres:create sonar-db
dokku postgres:link  sonar-db sonar --no-restart
dokku git:sync sonar https://github.com/ucsb-cs156/sonarqube-dokku main --build
```

These may or may not work:

```
dokku letsencrypt:set sonar email yourEmail@ucsb.edu
dokku letsencrypt:enable sonar
```

# Removing so you can start over

```
dokku postgres:unlink sonar-db sonar --no-restart
dokku postgres:destroy sonar-db --force
dokku apps:destroy sonar --force
```
