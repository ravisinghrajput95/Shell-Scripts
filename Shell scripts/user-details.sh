#!/bin/bash

#This script will check the whether the user is root or non root.

user_name=$(id -un)

echo "your username is ${user_name}"
echo "Your user id is ${UID}"

if [[ "${UID}" -eq 0 ]]
then 
echo "you are root"
else
echo "you are a non root user"
fi
