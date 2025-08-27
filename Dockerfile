# Use the official SonarQube image as the base
FROM sonarqube:25.8.0.112029-community

# Set volumes for persistence
VOLUME /opt/sonarqube/data
VOLUME /opt/sonarqube/extensions

# The Docker image will automatically pull the database setup from DATABASE_URL
# and use the default entry point.

