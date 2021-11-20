#!/bin/bash

#yq installation
#sudo add-apt-repository ppa:rmescandon/yq
#sudo apt-get install yq

#Reading file name
echo "Please enter your filename to modify:"
read config_file

#File to which modified contect would be redirected
echo "Please enter flename to save modified configurations:"
read output

# Display the Key value pairs being supplied to the config file.
echo "Key: ${1}"
echo "Value: ${2}"
echo

# Loop through all the key value pairs as positional parameters.
for update in $(yq w $config_file "$1" "$2" > $output.yml)
do
    yq w $config_file "$1" "$2" > $output.yml
done

#merging files and keeping track of a single config file
yq merge --inplace --overwrite $config_file $output.yml
rm -rf $output.yml

echo $config_file updated!!!!