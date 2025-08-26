# Use the official SonarQube image as the base
FROM sonarqube:lts-community

# Expose the default SonarQube web port
EXPOSE 9000

# Set volumes for persistence
VOLUME /opt/sonarqube/data
VOLUME /opt/sonarqube/extensions

# SonarQube requires these environment variables to connect to an external database.
# Dokku's postgres plugin will automatically set DATABASE_URL, which the official
# SonarQube image can use. This Dockerfile does not need to extract the values itself.

# This is the command that will be run when the container starts.
# It simply executes the default SonarQube server startup script.
# The script will read the database connection info from the environment variables.
CMD ["/opt/sonarqube/bin/run.sh"]
