
FROM ubuntu:latest
MAINTAINER jeffrey.freeman@qoto.org

RUN apt-get update && apt-get -y install cron npm

# Run the command on container startup
CMD crontab /etc/cron.d/* && cron -f
