#!/bin/bash

set -ue

if [[ $# -ne 1 ]]; then
    echo "ERROR: provide a code gained from http://goo.gl/kTvy0y" >&2
    exit 1
fi

code="$1"

chown docker-user:docker-group /gdrive/data
/sbin/setuser docker-user /acct-setup.sh "$code"

/sbin/my_init
