#!/bin/bash
trap 'rm -f /tmp/ladder' SIGINT SIGTERM
rm /tmp/ladder 2>/dev/null
touch /tmp/ladder
ls -l /tmp/ladder
echo trap me if you can
sleep 10

