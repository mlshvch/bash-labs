#!/bin/bash

count=$1
json=~/Desktop/lab6.json

while [ true ]; do


	if [ -n $count ]; then		
		if [[ $count =~ ^[0-9]+$ ]]; then
			break
		else read -p "Enter number of photos:" count
		fi
	fi
done

curl https://api.nasa.gov/planetary/apod?{"count="$count'&'}api_key=eGABWFOEKXksKMlgE0D6VvzscEsgxPDlgauBc0qM | jq ".[].url"

while read line; do
	echo "$line"
done<$json
