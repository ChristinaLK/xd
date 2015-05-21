#!/bin/bash

##Script to strip XDMod files for UW-Madison users
##Argument is list of files to be combined
##Run from within the data folder

files=$*

##produce stripped data files
for file in $files
do
	head -7 $file >> madison_$file
	head -8 $file | tail -1 | cut -d , -f 1,2 >> madison_$file
	grep Wisconsin-Madison $file | cut -d . -f 1 | cut -d , -f 1,2,3 >> madison_$file
done

##generate final database file and return title
title=$(python ../scripts/combine_sheets.py $files)

##remove intermediate files (optional)
for file in $files
do
	rm madison_$file
done

##concat database files
cat ../reports/title.txt > ../reports/$title
echo " " >> ../reports/$title
cat ../reports/data.txt >> ../reports/$title

##remove database files
rm ../reports/title.txt
rm ../reports/data.txt
