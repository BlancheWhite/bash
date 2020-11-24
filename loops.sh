#!/usr/bin/bash

path="/home/bianca.pasarea/Desktop/Projects/bash/bash"



files=$( ls $path )
text_files=$( $( cat $i ) | wc -c )
for i in $files;do
	echo -n "File $i has "	
	echo -n $text_files
#	echo -n $( cat $i ) | wc -c ; 
	echo " characters"
done

