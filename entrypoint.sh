#!/bin/bash
set -e

echo "starting DB"
exec mongodb
echo "starting nodejs"
exec node wiki configure
