#### AWK

AWK is a powerful and versatile programming language primarily used for pattern scanning and processing. AWK is commonly used for data extraction and reporting. It reads input line by line, splits each line into fields, and then processes the fields according to specified rules.

#### AWK Command 

AWK can be used both as a command-line tool and as part of a shell script. The basic syntax for an AWK command is:

awk 'pattern {action}' input_file

pattern: Specifies a pattern to match.
action: Specifies what to do with the matched pattern.
input_file: The file to be processed.

##### AWK Structure

BEGIN block: Executed before any input lines are read.
Main block: Executed for each line in the input.
END block: Executed after all input lines have been processed.

awk 'BEGIN { ... } { ... } END { ... }' input_file

##### AWK Field Variables

awk 'pattern {print $1}' input_file

$0: Represents the entire line.
$1, $2, ..., $n: Represents the first, second, ..., nth field in the line.
Fields are typically separated by whitespace or can be defined using the -F option.

#### Example - Basic usage

Example 1: Print the Third Field
Let's consider a file data.txt with the following content:

John 25 50000
Jane 30 60000
Doe 22 45000

We want to print the third field (salary).

awk '{ print $3 }' data.txt


#### Example - Search for a username
'
nixmin@DESKTOP:~$ awk '/root/ {print $1}' /etc/passwd
root:x:0:0:root:/root:/bin/bash

nixmin@DESKTOP:~$ awk '/ro/ {print $1}' /etc/passwd
root:x:0:0:root:/root:/bin/bash
proxy:x:13:13:proxy:/bin:/usr/sbin/nologin
systemd-timesync:x:103:106:systemd
'

#### Example - Get all the usernames

nixmin@DESKTOP:~$ awk -F ":" '{print $1}' /etc/passwd
root
daemon
bin
sys
sync
games
man
lp

#### Example - Get all the usernames with home dir

nixmin@DESKTOP:~$ awk -F ":" '{print $1,$6}' /etc/passwd
root /root
daemon /usr/sbin
bin /bin
sys /dev
sync /bin
games /usr/games
