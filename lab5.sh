#!/bin/bash

#30 16 * * 6 /usr/local/bin/serve in crontab -e

dlist=~/Desktop/spo_list.txt
ext=$1
dest=$2


if [ -z $ext ]; then
	echo "Ext is null!"
		while [ -z $ext ]; do
			read -p "Enter extension: " ext
		done
fi

if [ -z $dest ]; then
	echo "Destination is null!"
		while [ -z $dest ]; do
			read -p "Enter backup dir: " dest
		done
fi


while [ true ]; do

	if [ -d $dest ]; then
		break
	fi
	
	read -p "dir is not exist. Do you want to create it? [y/n]:" answer
	    case $answer in
		[Yy]* ) mkdir $dest && echo "Dir: " $dest "created and set as backup directory!";;
		[Nn]* ) read -p "Enter backup dir: " dest;;
		* ) echo "Please answer Y or N.";;
	    esac

done

while [ true ]; do
	read -p "Do you want add baskup directory? [y/n]:" answer
		    case $answer in
			[Yy]* ) read -p "Enter dir: " dir && echo "$dir" >> $dlist;;
			[Nn]* ) break;;
			* ) echo "Please answer Y or N.";;
		    esac
done

while IFS= read -r line; do
    find $line/ -type f -name "*.$ext" -exec cp {} $dest \;
done < $dlist

sleep 5
echo "Backup into $dest is finished"
#shutdown 0


