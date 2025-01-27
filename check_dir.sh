#!/bin/bash

VAR=$(ls -l)

for i in $(awk 'print{$1, $5}') 
do
	echo $i
done

