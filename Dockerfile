FROM ubuntu:14.04

# Install and setup runit
RUN apt-get update && apt-get -y install runit && mkdir -p /etc/service /etc/runit
ADD runit-cron /etc/service/001-cron/run
# ADD runit-pgbouncer /etc/service/002-pgbouncer/run
# ADD runit-cron /etc/service/003-cron/run
ADD runit-2 /etc/runit/2
ADD runit-3 /etc/runit/3

COPY boot /
