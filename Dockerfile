FROM ubuntu:latest
MAINTAINER jeffrey.freeman@qoto.org

RUN apt-get update && apt-get -y install cron npm python3 python3-pip python-pip gnuplot
RUN pip3 install Mastodon.py feedparser feed2toot
RUN pip install Mastodon.py
RUN mkdir /root/.config

RUN sed -i '/session    required     pam_loginuid.so/c\#session    required   pam_loginuid.so' /etc/pam.d/cron

# Run the command on container startup
CMD crontab /etc/cron.d/* && cron -f
