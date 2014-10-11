#!/bin/sh

read -p "Visit http://goo.gl/kTvy0y and paste in the code: " code

docker run -d \
    --name gdrive \
    --restart="always" \
    -v /mnt/gdrive:/gdrive/data \
    ahri/gdrive \
    "$code"
