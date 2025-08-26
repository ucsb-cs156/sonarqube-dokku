# Use the official SonarQube image as the base
FROM sonarqube:lts-community

# Set volumes for persistence
VOLUME /opt/sonarqube/data
VOLUME /opt/sonarqube/extensions


ENV SONAR_PORT=5000

# The ENTRYPOINT script of the original image might not accept an env var for the port
# so we must modify the configuration file directly
# USER root
# RUN sed -i "s/^sonar\.web\.port=.*/sonar.web.port=${SONAR_PORT}/" /opt/sonarqube/conf/sonar.properties
# USER sonarqube


# The Docker image will automatically pull the database setup from DATABASE_URL
# and use the default entry point.

