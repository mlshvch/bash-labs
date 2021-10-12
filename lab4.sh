#!/bin/bash

src=$1
dest=$2
pref=$3

srcdir=$PWD



if [ -z $src ]; then
		while [ -z $src ]; do
			read -p "Enter source directiry: " src
		done
fi

if [ -z $dest ]; then
		while [ -z $dest ]; do
			read -p "Enter destination directory: " dest
		done
fi

if [ -z $pref ]; then
		while [ -z $pref ]; do
			read -p "Enter prefix: " pref
		done
fi

find $src/ -type d | 
while read dir;
do
cd $dir
	for f in *.* ; 
	do mv -v "$f" "$pref$f"; 
	done;
done;

cp -rp $src/* $dest/

find $src/ -type d | 
while read dir;
do
cd $dir
	for f1 in *.* ; 
	do mv "$f1" "${f1#$pref}"
	done;
done;

cd $srcdir

# /home/alex/Desktop/source
# /home/alex/Desktop/dest


