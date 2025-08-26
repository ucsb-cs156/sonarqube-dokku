# sonarqube-dokku
Files to set up SonarQube on Dokku


# Dokku Setup

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
ports:list <app>                        # List port mappings for an app
ports:add <app> <scheme>:<host-port>:<container-port> [<scheme>:<host-port>:<container-port>...]           # Add port mappings to an app
ports:clear <app>                       # Clear all port mappings for an app
ports:remove <app> <host-port> [<host-port>|<scheme>:<host-port>:<container-port>...]                      # Remove specific port mappings from an app
ports:set <app> <scheme>:<host-port>:<container-port> [<scheme>:<host-port>:<container-port>...]           # Set port mappings for an app
```
