#!/bin/bash
set -e

echo "*************Starting MongoDB**********************"
mkdir /data && mkdir /data/db
mongod &
echo "*************************Starting nodejs**************"
node wiki configure

echo "Something bad happened, I shouldnt be here! (db or something failed probably)"
echo "Now enjoy this lovely black hole (ctrl-c to kill)"
tail -f /dev/null
