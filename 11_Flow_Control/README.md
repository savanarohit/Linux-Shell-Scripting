#### Flow Control in Linux Shell Scripting

Flow control in Linux shell scripting involves guiding the execution flow of a script based on various conditions.

#### Conditional Statements

1) if-else Statements

The if statement tests a condition. If true, it executes a specific block of code.

Example
```
if [ $age -ge 18 ]; then
    echo "You are eligible to vote."
else
    echo "You are not eligible to vote."
fi
```

Real World Example - Check if the Log file exists and archive it if it does.
```
#!/bin/bash
# Script to check if the Log file exists and archive it if it does.

# Log File Path
LOG_FILE_PATH="/opt/access.log"
FILE_ARCHIVE_PATH="/opt/archive"

# Check if the file exists
if [ -f "$LOG_FILE_PATH" ]; then
    echo "Log file exists. Archiving statrted"
    mkdir -p "$FILE_ARCHIVE_PATH"
    mv "$LOG_FILE_PATH" "$FILE_ARCHIVE_PATH/$(date +'%Y-%m-%d_%H-%M-%S')_access.log"
    echo "Log file archived completed."
else
    echo "Log file does not exist."
fi
```

Output
```
nixmin@DESKTOP:~/$ sudo ./log_file_archive.sh 
[sudo] password for nixmin: 
Log file exists. Archiving statrted
Log file archived completed.

nixmin@DESKTOP-GINCH92:~/$ ls -l /opt/archive/
total 4
-rw-r--r-- 1 root root 29 Jun 17 16:47 2024-06-17_16-49-13_access.log
```

2) case Statements

The case statement matches a variable against multiple patterns and executes corresponding blocks of code.

Example
```
case $day in 
    "Monday")
        echo "Start of the workweek."
    ;;
    Friday)
        echo "End of the workweek."
    ;;
*)
    echo "It's just another day."
    ;;
esac    
```

Real World Example - Script to manage a Service in Linux
```
#!/bin/bash
# Script to manage a Service in Linux

# Service name
service_name="snapd"

# Systemctl service command options
echo "Enter you choice for service: start | stop | restart | status"

read -r user_input

case $user_input in 
    start)
        echo "Starting $service_name "
        systemctl start $service_name
        echo "$service_name started"
        ;;
    stop)
        echo "Stoppig $service_name"
        systemctl stop $service_name
        echo "$service_name stopped"
        ;;
    restart)
        echo "Restarting $service_name"
        systemctl restart $service_name
        echo "$service_name restarted"
        ;;
    status)
        echo "Status of service $service_name"
        systemctl status $service_name
        ;;
    *)
        echo "Enter correct option: start , stop , restart , status "
esac


Output

nixmin@DESKTOP:~/$ ./service.sh
Enter you choice for service: start | stop | restart | status
status

Status of service snapd
● snapd.service - Snap Daemon
     Loaded: loaded (/lib/systemd/system/snapd.service; enabled; vendor preset: enabled)
     Active: active (running) since Tue 2024-06-18 09:52:20 IST; 24min ago
TriggeredBy: ● snapd.socket
   Main PID: 241 (snapd)
      Tasks: 14 (limit: 9464)
     Memory: 80.0M
     CGroup: /system.slice/snapd.service
             └─241 /usr/lib/snapd/snapd

Jun 18 09:52:14 DESKTOP-GINCH92 systemd[1]: Starting Snap Daemon...
Jun 18 09:52:20 DESKTOP-GINCH92 snapd[241]: overlord.go:271: Acquiring state lock file
lines 1-12...skipping...
● snapd.service - Snap Daemon
     Loaded: loaded (/lib/systemd/system/snapd.service; enabled; vendor preset: enabled)
     Active: active (running) since Tue 2024-06-18 09:52:20 IST; 24min ago
TriggeredBy: ● snapd.socket
   Main PID: 241 (snapd)
      Tasks: 14 (limit: 9464)
     Memory: 80.0M
     CGroup: /system.slice/snapd.service
             └─241 /usr/lib/snapd/snapd
```

#### Looping Statements

1) for loop

The for loop iterates over a list of items and executes a block of code for each item.

Example
```
#!/bin/bash
# Print each number from 1 to 5

for i in {1..5}; do
    echo "$i"
done

output

1
2
3
4
5
```

Real World Example - Renaming All Files in a Directory

```
#!/bin/bash
# A Script for renaming all files in a directory

# Dir
dir="/opt/test"

# updated files prefix
prefix="updated_"

# Change to Dir
cd $dir

# Using for loop to rename files with prefix
for file in *; do
    if [ -f "$file" ]; then
        mv "$file" "${prefix}${file}"
        echo "Renamed $file to ${prefix}${file}"
    fi
done

Output

nixmin@DESKTOP:~/$ sudo ./file_rename.sh 
Renamed file1 to updated_file1
Renamed file2 to updated_file2
Renamed file3 to updated_file3
Renamed file4 to updated_file4

nixmin@DESKTOP:~/$ ls -l /opt/test/
total 0
-rw-r--r-- 1 nixmin nixmin 0 Jun 21 09:25 updated_file1
-rw-r--r-- 1 nixmin nixmin 0 Jun 21 09:25 updated_file2
-rw-r--r-- 1 nixmin nixmin 0 Jun 21 09:25 updated_file3
-rw-r--r-- 1 nixmin nixmin 0 Jun 21 09:25 updated_file4
```

2) while loop

The while loop repeatedly executes a block of code as long as a given condition is true.

Example
```
#!/bin/bash
# while loop example

count=1
while [ $count -le 5 ]; do
	echo "Count: $count"
	count=$((count + 1))
done

output

Count: 1
Count: 2
Count: 3
Count: 4
Count: 5
```

Real World Example - Backup of log file to a dir
```
#!/bin/bash
# Script to backup log file to a backup dir

# Log file
log_file="/var/log/apache2/access.log"
backup_dir="/opt/backup"

# Create backup dir
mkdir -p "$backup_dir"

# Message
echo "Backup for log files $log_file starts...."

while true; do
    if [ -f "$log_file" ]; then
        echo "$(date): $log_file found. Processing it now..."
        mv "$log_file" "$backup_dir/special_$(date +"%Y%m%d_%H%M%S").log"
        echo "$(date): $log_file backup kept in $backup_dir"
        break
    else
        echo "$(date): $log_file not found."

    fi
    sleep 10

done

echo "Log file backup completed"

Output

nixmin@DESKTOP:~/$ sudo ./log_file_processor.sh 
Backup for log files /var/log/apache2/access.log starts....
Sat Jun 22 10:30:32 IST 2024: /var/log/apache2/access.log found. Processing it now...
Sat Jun 22 10:30:32 IST 2024: /var/log/apache2/access.log backup kept in /opt/backup
Log file backup completed

nixmin@DESKTOP:~/$ sudo ls -l /opt/backup/
total 0
-rw-r----- 1 root adm 0 Jun 11 08:44 special_20240622_103032.log
```

3) until Loops

The until loop runs until a condition becomes true.

Example
```
#!/bin/bash
# until loop example

count=1
until [ $count -gt 5 ]; do
    echo "Count: $count"
    count=$((count + 1))
done

output

Count: 1
Count: 2
Count: 3
Count: 4
Count: 5
```

Real World Example - Service monitoring in linux

```
#!/bin/bash
# Script to check if nginx service is running

# Name of the service to check
service_name="nginx"

# Log file
log_file="/var/log/service_monitor.log"

# Function to check service status
check_service() {
    systemctl is-active --quiet "$service_name"
}

echo "Monitoring for $service_name service to start..." >> "$log_file"

# Using 'until' loop to check service status
until check_service; do
    echo "$(date): $service_name is not running. Checking again in 10 seconds..." >> "$log_file"
    sleep 10
done

echo "$(date): $service_name is now running!" >> "$log_file"

echo "Finished monitoring. $service_name service is active."

```

#### Control Flow Commands

1) break

The break command exits the nearest enclosing loop.

Example
```
#!/bin/bash
# break example

for i in {1..5}; do
    if [ $i -eq 2 ]; then
        break
    fi
    echo "Number: $i"
done

output

Number: 1
Number: 2
Number: 3
```

Real World Example - 

```
#!/bin/bash
# 




```

2) continue

The continue command skips remaining commands in the current loop iteration and starts the next iteration.

Example
```
#!/bin/bash
# continue example

for in in {1..8}; do 
    if [ $i -eq 7]; then
        continue
    fi
    echo "Number: $i"
done

output

Number: 1
Number: 2
Number: 3
Number: 4
Number: 6
Number: 7
Number: 8
Number: 9
Number: 10
```

Real World Example - Checking Service Status on Multiple Servers

```
#!/bin/bash
# Script to check services on multiple linux servers

# Servers
node=("node1.abc.com" "node2.abc.com" "node3.abc.com")

# Service to check
service="apache2"

# Checking on each server
for server in "$({node[@]}"; do
    echo "Checking servers: $node"

    # Check if the server is reachable
    if ! ping -c 1 -W 1 "$node" &> /dev/null; then
        echo "Server $node is down
        continue 
    fi

    # Check the service
    ssh "$nodes" "systemctl is-active --quiet $node"

    if [ $? -eq 0 ]; then
        echo "Service $service is up on $node"
    else
        echo "Service $service is down on $node"
    fi

done


Output

nixmin@DESKTOP:~/$ sudo ./service_check.sh 
Checking nodes: node1.abc.com
ping: $: Name or service not known
Node node1.abc.com is down
```