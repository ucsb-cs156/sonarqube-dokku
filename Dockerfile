# Use the official SonarQube image as the base
FROM sonarqube:lts-community

# Expose the default SonarQube web port
EXPOSE 5000

# Set volumes for persistence
VOLUME /opt/sonarqube/data
VOLUME /opt/sonarqube/extensions

# The Docker image will automatically pull the database setup from DATABASE_URL
# and use the default entry point.
