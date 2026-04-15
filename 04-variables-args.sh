#!/bin/bash

# we can use these variables as arguments to pass in command line
PERSON1=$1
PERSON2=$2

echo "${PERSON1}:: Hi ${PERSON2}"
echo "${PERSON2}:: hello ${PERSON1}, How are you?"
echo "${PERSON1}:: I am fine ${PERSON2}, How are you doing"
echo "${PERSON2}:: doing great ${PERSON1}"