#!/bin/bash

# This scrpt generates a random password.
# This user can set the password lenghr with -l and add a special character with -s
# Verbose mode can be enebled with -v

# Set a default password lenght
LENGTH=48

usage() {
  echo "Usage: ${0} [-v] [-l LENGTH]" >&2
  echo 'Generate a random password.'
  echo '  -l  LENGTH  Specify the password length.'
  echo '  -s          Append a special character to the password.'
  echo '  -v          Increase verbosity.'
  exit 1
}

log() {
  local MESSAGE="{@}"
  if [[ "${VERBOSE}" = 'true' ]]
  then
    echo "${MESSAGE}"
  fi
}

while getops vl:s OPTION
do
  case ${OPTION} in 
    v)
     VERBOSE='true'
     log 'Verbose mode on.'
     ;;
    l)
     LENGTH="${OPTARG}"
     ;;
    s)
     USE_SPECIAL_CHARACTER='true'
     ;;
    ?)
     usage
     ;;
   esac
done

echo "Number of args: ${#}"
echo "All args: ${@}"
echo "First arg: ${1}"
echo "Second arg: ${2}"
echo "Third arg: ${3}"

log 'GENERATING A PASSWORD.'
PASSWORD=$(date +%s%N${RANDOM}${RANDOM} | sha256sum | head -c${LENGHT})
if [[ "${USE_SPECIAL_CHARACTER}" = 'true' ]]
then
  log 'Selecting a random special character.'
  SPECIAL_CHARACTER=$(echo '!@#$%^&*()_+=' | fold -w1 | shuf | head -c)
  PASSWORD="${PASSWORD}${SPECIAL_CHARACTER}"
fi

log 'DONE.'
log 'HERE IS THE PASSWORD'

# DIsplay the password
echo "${PASSWORD}"
