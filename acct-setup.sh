#!/bin/bash

set -ue

if [[ $# -ne 1 ]]; then
    echo "ERROR: provide a code gained from http://goo.gl/kTvy0y" >&2
    exit 1
fi

code="$1"

insync-headless start
while [[ ! $(insync-headless get_status) = "UNLINKED" ]]; do :; done
insync-headless add_account "$code" /gdrive/data | grep '^Error:' && exit 1
insync-headless quit
