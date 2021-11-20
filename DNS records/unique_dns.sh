
#!/bin/bash

#cc_logs
echo "Please enter your filename:"
read filename

#Find the total number of distinct DNS records / URLs in the log file   

result=$(cat $filename | awk '{ print $11 } ' $filename | sort | uniq | wc -l )
echo "Your file has total $result unique DNS records"


#print the URL with the number of times the URL was repeated in the log file
for DNS in $(awk '{print $11}' "$filename" | sort -u)
do
    echo -en "${DNS}\tcount: "
    grep -c "$DNS" "$filename"
done