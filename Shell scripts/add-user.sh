#!/bin/bash
  
#This script will ask user for details in account creation

#Prompt user to input the username
read -p 'Please enter the user name: ' username

#Prompt user to input their full name
read -p 'Please enter the full name of the user: ' name

#Ask user to provide the password for the account
read -p 'Please enter password for the user: ' password

#create the user and their home directory
useradd -c "${name}" -m ${username}

#Set the password for the created user
echo "${username}:${password}" | chpasswd

#enforce the user to reset the password on the very first login
passwd -e ${username}

# Display the username, password, and the host where the user was created.
echo
echo 'username:'
echo "${username}"
echo
echo 'password:'
echo "${password}"
echo
echo 'host:'
echo "${HOSTNAME}"
exit 0