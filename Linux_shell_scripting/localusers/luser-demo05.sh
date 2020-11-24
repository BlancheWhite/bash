#!/bin/bash

# This script generates some random passwords

# A random number as a password
PASSWORD="${RANDOM}"
echo "${PASSWORD}"

# Three random numbers toghether
PASSWORD="${RANDOM}${RANDOM}${RANDOM}"
echo "${PASSWORD}"

# Use the current date/time as the basis for the password
PASSWORD=$(date +%s)
echo "${PASSWORD}"

# Use nanosecondss to act as randomization

PASSWORD=$(date +%s%N)
echo "${PASSWORD}"

# A better password
PASSWORD=$(date +%s%N | sha256sum | head -c32)
echo "${PASSWORD}"

# Ane even better password
PASSWORD=$(date +%s%N${RANDOM}${RANDOM} | sha256sum | head -c48)
echo "${PASSWORD}"

# Append a special character to the password.
SPECIAL_CHARACTER=$(echo '!@#$%^&*(){}:<>?.,}' | fold -w1 | shuf | head -c1)
echo "${PASSWORD}${SPECIAL_CHARACTER}"
