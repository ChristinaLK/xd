#!/bin/bash

for file in *by_PI*aggregate.csv
do
	head -8 $file >> madison_$file	
	grep Wisconsin-Madison $file >> madison_$file
done
