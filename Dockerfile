FROM ubuntu:14.04

# Install runit and setup its directories
RUN apt-get update && apt-get -y install runit && mkdir -p /etc/service /etc/runit
ADD runit-cron /etc/service/001-cron/run
ADD runit-2 /etc/runit/2
ADD runit-3 /etc/runit/3
RUN chmod +x /boot /etc/service/001-cron/run /etc/runit/2 /etc/runit/3

COPY boot /
CMD [ "/boot" ]