#!/bin/bash
exec /sbin/setuser docker-user \
    /usr/bin/insync-headless start --no-daemon \
    >> /var/log/insync-headless 2>&1
