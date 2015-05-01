#!/bin/bash

##Script to strip XDMod files for UW-Madison users
##Argument is list of files to be combined
##Run from within the data folder

files=$*

for file in $files
do
	head -7 $file >> madison_$file
	head -8 $file | tail -1 | cut -d , -f 1,2 >> madison_$file
	grep Wisconsin-Madison $file | cut -d . -f 1 | cut -d , -f 1,2,3 >> madison_$file
done

python ../scripts/combine_sheets.py $files

##remove intermediate files (optional)
for file in $files
do
	rm madison_$file
done
