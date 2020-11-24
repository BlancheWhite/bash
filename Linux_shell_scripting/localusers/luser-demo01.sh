#!/bin/bash

# This script displays varios information to the screen

echo "Hello"

# Assign a value to a variable
WORD='script'
ENDING='ed'
# Display that value using the variable

echo "$WORD"

# Demonstrate that single quotes cause variables to NOT ge expanded

echo '$WORD'

# Combine the variable with hard-coded text.

echo "This is a shell $WORD"

# Display the contents of the variable using alternative syntax
echo "This is a shell ${WORD}"
# Append text to the variable
echo "${WORD}ing is fun!"
# Show how not to append text to a variable
echo "$WORDing is fun!"
# Combine the 2 variables
echo "This is ${WORD}${ENDING}"
# Reassign the variable ENDING
ENDING='ing'
echo "${WORD}${ENDING} is fun!"
# Reassign value to ENDING
ENDING='s'
echo "You are going to write many ${WORD}${ENDING} in this class!"

