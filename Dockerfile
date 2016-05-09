# Elastalert Docker image running on Alpine Linux.
# Build image with: docker build -t ivankrizsan/elastalert:latest .
#
# The WORKDIR instructions are deliberately left, as it is recommended to use WORKDIR over the cd command.

FROM elasticsearch:2.3.1

MAINTAINER Jailbirt

#Where elasticsearch is Installed.
WORKDIR /usr/share/elasticsearch

#Would be overriden by docker-compose
VOLUME /usr/share/elasticsearch/data

# Set this environment variable to true to set timezone on container start.
ENV SET_CONTAINER_TIMEZONE false
# Default container timezone as found under the directory /usr/share/zoneinfo/.
ENV CONTAINER_TIMEZONE Europe/Stockholm
# Launch Elastalert when a container is started.
RUN bin/plugin install com.floragunn/search-guard-ssl/2.3.1.8.1

CMD ["bin/plugin install com.floragunn/search-guard-2/2.3.1.0-beta1"]
