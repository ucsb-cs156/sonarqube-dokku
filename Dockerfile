# Use the official SonarQube image as the base
FROM sonarqube:lts-community

# Set volumes for persistence
VOLUME /opt/sonarqube/data
VOLUME /opt/sonarqube/extensions


# The ENTRYPOINT script of the original image might not accept an env var for the port
# so we must modify the configuration file directly
USER root
RUN echo "sonar.web.port=5000" >> /opt/sonarqube/conf/sonar.properties
USER sonarqube


# The Docker image will automatically pull the database setup from DATABASE_URL
# and use the default entry point.

