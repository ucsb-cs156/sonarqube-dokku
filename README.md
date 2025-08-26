# sonarqube-dokku
Files to set up SonarQube on Dokku


# Dokku Setup

```
dokku apps:create sonar
dokku postgres:create sonar-db
dokku postgres:link  sonar-db sonar --no-restart
dokku git:sync sonar https://github.com/ucsb-cs156/sonarqube-dokku main
```
