# Check if a process is running and kill it
#!/bin/bash

# Start a process first to kill
sleep 600

#Kill process with name sleep 600
ps -ef | grep "sleep 600" | grep -v grep | awk '{print $2}' | xargs -I{} kill {}
