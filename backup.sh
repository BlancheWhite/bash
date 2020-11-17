#!/usr/bin/bash

# This bash script is used to backup a user's home directory to /tmp/.

function backup {

if [ -z $1 ]; then
	user=$(whoami)
fi
	user=$1
# Check if this is ok, as find from total_files search in /home/svadmin
input=/home/$user
output=/tmp/${user}_home_$(date +%Y-%m-%d_%H%M%S.tar.gz)

function total_files {
	find $1 -type f | wc -l
}

function total_directories {
	find $1 -type d | wc -l
}

function total_archived_directories {
	tar -tzf $1 | grep /$ | wc -l
}

function total_archived_files {
	tar -tzf $1 | grep -v /$ | wc -l
}

tar -czf $output $input 2> /dev/null

src_files=$( total_files $input )
src_directories=$( total_directories $input )

arch_files=$( total_archived_files $output )
arch_directories=$( total_archived_directories $output )

echo "########## $user ###########"
echo "Files to be included: $src_files"
echo "Directories to be included: $src_directories"
echo "Files archived: $arch_files"
echo "Directories archived: $arch_directories"

if [ $src_files -eq $arch_files ]; then
	echo "Backup of $intput completed!"
	echo "Details about the output backup file:"
	ls -l $output
else
	echo "Backup of $input failed"
fi
}

for i in $*; do
        if [ ! -d "/home/$i" ]; then
                echo "Requested $i user home doesn't exist"
        else
                echo "Starting backup for $i"
		backup $directory
		let all=$all+$arch_files+$arch_directories
        fi
done;
	echo "TOTAL FILES AND DIRECTORIES: $all"
	
