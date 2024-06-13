#### Tee

The tee command in Unix/Linux is a versatile utility that reads from standard input and writes to standard output and one or more files simultaneously.

#### Basic Syntax
```
command | tee [OPTIONS] [FILE...]
```

command: The command whose output you want to process.
```
[OPTIONS]: Optional flags that modify tee’s behavior.
[FILE...]: One or more files where the output will be written.
```
Common Options
```
-a or --append: Append to the given files, rather than overwriting them.
-i or --ignore-interrupts: Ignore interrupt signals.
```

#### How tee Works
tee takes the output of a command from a pipeline, writes it to a file, and simultaneously displays it in the terminal.

#### Basic Examples

1) Write to a File and Display Output
Example: Capture the output of ls -l in a file while still displaying it on the terminal.
```
ls -l | tee output.txt
```

Explanation:

ls -l: Lists the contents of the current directory in long format.
| tee output.txt: Pipes the output to tee, which writes it to output.txt and displays it on the terminal

Output
```
total 0
-rw-r--r--  1 user  group  0 Jun  9 10:30 file1
-rw-r--r--  1 user  group  0 Jun  9 10:30 file2
```

2) Append to a File
```
Append the output of echo "Hello World" to an existing file.

echo "Hello World" | tee -a output.txt
```

3) Write to Multiple Files
```
Save the output of df -h to multiple files.

df -h | tee file1.txt file2.txt
```


#### Example - Write to a File and Display Output
```
nixmin@DESKTOP:~/$ cat data.txt  | tee log.txt
Rohit Amit

nixmin@DESKTOP:~/$ cat log.txt
Rohit Amit
```


#### Real-World Example - Redirecting Both Standard Output and Error to Separate Files
```
Scenario
You want to run a script and save both its standard output and standard error to different files for debugging purposes.

./myscript.sh > >(tee stdout.log) 2> >(tee stderr.log >&2)
```

#### Real-World Example - Creating Backups with Logging
```
Scenario
You want to back up your home directory and log the output of the backup process to monitor for any errors or important messages.

tar -czf backup_home.tar.gz /home/user | tee /var/log/backup.log

Explanation:

tar -czf backup_home.tar.gz /home/user: Creates a compressed archive of the /home/user directory.
| tee /var/log/backup.log: Logs the output of the tar command to backup.log while displaying it on the terminal.
```

#### Real-World Example - Monitoring Log Files
```
Scenario
You want to monitor a log file and save any new entries to another file for analysis.

# Continuously monitor a log file and append new entries to another file
tail -f /var/log/syslog | tee -a /var/log/syslog_monitor.log


Explanation:

tail -f /var/log/syslog: Continuously outputs new lines added to syslog.
| tee -a /var/log/syslog_monitor.log: Appends the new lines to syslog_monitor.log while displaying them on the terminal
```

#### Real-World Example - Monitoring and Logging System Status
```
Scenario
You are a system administrator tasked with monitoring the status of your server's disk usage and CPU load, and you want to log this information for future reference while simultaneously viewing it in real-time.

Step-by-Step Command
Monitor Disk Usage:

Use df to get disk usage and tee to log it to a file and display it on the terminal.

df -h | tee -a /var/log/disk_usage.log
```