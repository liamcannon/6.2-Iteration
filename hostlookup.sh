#!/bin/bash
#comments go here

usage() {
	echo "$0 usage: [-f input filed]"
	exit 1
}

if [ -f $1 ]; then
	echo "$1 validated"
	for f in $(cat $1); do
	out=$(host -W1 -t A $f)
		if [ $? -eq 0 ]; then
			ip=$(echo $out | cut -d " " -f 4)
			echo ${f},$ip
		else
			echo "${f}, not found"
		fi
	done
fi
