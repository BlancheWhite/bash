#!/bin/bash

# This script demonstrate I/O redirection

# Redirect STDOUT to a file
FILE="/tmp/data"
head -n1 /etc/passwd > "${FILE}"

# Redirect STDIN to a program
read LINE < ${FILE}
echo "LINE containes: ${LINE}"

# Redirect STDOUT to a file, overwriting the file

head -n3 /etc/passwd > ${FILE}
echo
echo "Contents of ${FILE}:"
cat ${FILE}

# Redirect STOUT to a file, appending to the fie
echo "${RANDOM}${RANDOM}" >> ${FILE}
echo "${RANDOM}${RANDOM}" >> ${FILE}
echo
echo "Contents of that file: "
cat ${FILE}

# Redirect STDIN to a program, using File Descriptor 0.
read LINE 0< ${FILE}
echo
echo "LINE contains: ${LINE}"

# Redirect STDOUT to a file usinf FD 1, overwriting the file.
head -n3 /etc/passwd 1> ${FILE}
echo
echo "Contents of ${FILE}:"
cat ${FILE}

# Redirect STDERR to a file using FD 2

ERR_FILE="/tmp/data.err"
head -n3 /etc/passwd /fakefile 2> ${ERR_FILE}
echo
cat ${ERR_FILE}

# Redirect STDOUT and STDERR to a file

heand -n3 /etc/passwd /fakefile &> ${FILE}
echo
echo "Contents fo ${FILE}:"
cat ${FILE}

# Redirect STDOUT AND STDERR through a pipe
echo
head -n3 /etc/passwd /fakefile |& cat -n

# Send output to STDERR

echo "This is STDERR" >&2

# Discard STDUT 
echo
echo "Dtscarding DTDOUT:"
head -n3 /etc/passwd /fakefie > /dev/null

# Discard STDERR 
echo
echo "Discarding STDERR:"
head -n3 /etc/passwd /fakefile 2> /dev/null

# Discard STDOUT and STDERR
echo 
echo "Discarding STDOUT and STDERR:"
head -n3 /etc/passwd /fakefile &> /dev/null

# clean up
rm ${FILE} ${ERR_FILE} &> /dev/null
