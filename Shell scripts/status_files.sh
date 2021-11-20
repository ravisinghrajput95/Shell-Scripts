#Thus script will tell us the Status on Total Number of Files (Send alert if files are less than 20)
# First create 20 files

#!/bin/bash
touch file{1..20}.txt

#file status
a=`ls -l file* | wc -l`

	if [ $a -eq 20 ]
	then
	echo Yes there are $a files
	else
	echo Files are less than 20
	fi
