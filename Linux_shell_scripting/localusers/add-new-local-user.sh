#!/bin/bash

# This script creates a new user on the local system
# You must supply a username as an argument to the script
# The intial password will be automatically generated

# Check if the executer of the script is root
if [[ "${UID}" -ne 0 ]]
then
  echo "You do not have the required privilages to run this script"
  echo "You are logged with the username: $(id -un)"
  exit 1
fi

# Check that there is at least one argument provided
if [[ "${#}" -eq 0 ]]
then
  echo "You have to supply at least one argument"
  echo "Usage: ${0} ACCOUNT_NAME [COMMENT] ..."
  exit 1
fi
# The first parameter is the username
USERNAME="${1}"

# The rest of the parameters are for the account comments
shift
COMMENT="${@}"
# Create the new account
useradd -m ${USERNAME} -c "${COMMENT}"
if [[ "${?}" -ne 0 ]]
then
  echo "The account has not been created."
  exit 1
fi

# Generate the password for the new account
PASSWORD=$(date +%s%N | sha256sum | head -c48)
echo ${PASSWORD} | passwd --stdin "${USERNAME}"

if [[ "${?}" -ne 0 ]]
then
  echo "Password cannot be changed"
  exit 1
fi
# Force the password to be changed after the first login
passwd -e ${USERNAME}

# Display the name of the account created and the password
echo
echo "Account name: "
echo "${USERNAME}"
echo
echo "Password: "
echo "${PASSWORD}"
echo
echo "Host: "
echo "${HOSTNAME}"
echo
exit 0

