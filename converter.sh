#!/bin/bash
# author : Liam Cannon
# Lab 6.2 Iteration
# date 10/13/2020

#functions
usage()
{
    echo "$0 usage: [-f input filed] [-c U(pper) or L(lower)"
    exit 1
}
#takes in a file and converts the text to lower or upper case depending on which the user wants
while getopts ":f:c:" options;
do
    case "${options}" in
	f)
	  f=${OPTARG}
	  if [ -f ${f} ]; then
	      usage
	  else
	      echo "${f} does not exist."
	      exit 3
	  fi
	  ;;
	c)
	  c=${OPTARG}
	  if [[ ${c} == "U" || ${c} == "L" ]]; then
	    echo "${f} - ${c}"
	  else
	    usage
	  fi
        ;;
	*)
	usage
        ;;
    esac
done
#conversion logic here

while read line
do
    if [ ${c} == "U" ]; then
	echo $line | tr [:lower:] [:upper:]
    else
	echo $line | tr [:upper:] [:lower:]
    fi
    
done < $f
exit 0
