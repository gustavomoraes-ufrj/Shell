#!/bin/bash

cat << EOF
what's the directory
EOF

read DIR

cd $DIR
pwd
ls

exit 0
