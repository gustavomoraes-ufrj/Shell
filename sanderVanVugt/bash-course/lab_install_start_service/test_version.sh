#!/bin/bash

package_name="openssh-server"
service_file=$(dpkg -L $package_name | grep '\.service$' | head -n 1)
service_name=$(basename $service_file)
#binary=$(grep ExecStart $service_file | head -n 1 | cut -d" "  -f1 | cut -d"=" -f2)

binary=$(grep ExecStart $service_file | head -n 1 | awk -F"=" '{print $2}' | awk '{print $1}')

echo $binary
echo "Package name: $package_name"
echo "Service file: $service_file"
echo "Service name: $service_name"
echo "Main binary: $binary"

[ -x "$binary" ] && 
	echo exists || 
	echo not exists

#if [ -x "$binary" ] 
#then
#    echo "Binary exists and is executable."
#else
#    echo "Binary does not exist or is not executable."
#fi

