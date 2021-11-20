#Create another scheduled script to send this information on email at the end of every day at 10:30 PM to a designated email address

crontab -e
30 10 * * *	 /root/log-alert