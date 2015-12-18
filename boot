#!/bin/bash
/etc/runit/2&
RUNSVDIR_PID=$!
echo "Started runsvidr, PID is $RUNSVDIR_PID"
trap "echo Container has been stopped && /etc/runit/3 && kill -HUP $RUNSVDIR_PID && wait $RUNSVDIR_PID" SIGTERM SIGHUP
wait $RUNSVDIR_PID
