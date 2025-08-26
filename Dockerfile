# Use the official SonarQube image as the base
FROM sonarqube:lts-community

# Expose the default SonarQube web port
EXPOSE 9000

# Set the SonarQube home directory for plugins and extensions
# NOTE: The default image already has this set, but it's good practice
# to explicitly note it if you plan to add plugins.
VOLUME /opt/sonarqube/data
VOLUME /opt/sonarqube/extensions

# Set environment variables for the external PostgreSQL database
# IMPORTANT: You must create a PostgreSQL database on your Dokku server
# and link it to this application.
# Dokku's PostgreSQL plugin automatically sets these environment variables.
# You don't need to put values here; Dokku will inject them at runtime.

ENV SONAR_JDBC_URL=jdbc:postgresql://$(echo "$DATABASE_URL" | cut --delimiter=\@ -f2)
ENV SONAR_JDBC_USERNAME=postgres
ENV SONAR_JDBC_PASSWORD=$(echo "$DATABASE_URL" | cut --delimiter=: -f3 | cut --delimiter=\@ -f1)

# SonarQube requires a specific setting for Elasticsearch on Docker
# to run in a non-root environment. This check is disabled by default
# in the official image, but it's a critical setting to remember for
# any self-hosted SonarQube instance.
ENV SONAR_ES_BOOTSTRAP_CHECKS_DISABLE=true

# This is the command that will be run when the container starts.
# It simply executes the default SonarQube server startup script.
CMD ["/opt/sonarqube/bin/run.sh"]
