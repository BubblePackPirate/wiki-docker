#!/bin/bash

echo "*************Starting MongoDB**********************"
mongod &

echo "*************************Starting nodejs**************"
export PATH=/root/.nvm/versions/node/v9.2.0/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
if [ ! -e '/var/wiki/configure.done' ]; then
echo "**********initial configuration not compelte, running now!***********"
node wiki configure
touch configure.done
else
node wiki start
tail -f /dev/null
fi

echo "Now enjoy this lovely black hole (ctrl-c to kill)"
tail -f /dev/null
